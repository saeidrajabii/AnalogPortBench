* ota_tele golden at VDD = 1.8 V (task T1): circuits/ota_tele/spec.yaml, Sky130 1.8 V LVT devices.
* Topology: the source's single-stage NMOS-input TELESCOPIC cascode OTA (tail, input pair, NMOS cascodes,
*   PMOS low-voltage cascode mirror load; 5-device stack), with two changes:
*   (1) regulated (gain-boosted) NMOS cascodes: one common-source NMOS (XMA1/XMA2, 10 uA PMOS load each) holds
*       the cascode source x1/x2 at its own VGS (~0.61 V) and drives the cascode gate;
*   (2) new bias: tail and mirror copies taken straight from the Iref diode; PMOS cascode gate vcp = PMOS diode
*       (same current density as the cascode) minus 20 uA * 16.5 k, which sets |VDS| of the mirror devices to ~0.33 V.
* Why: the naive port fails only on gain (49.6 dB vs >= 66.84 dB). Sky130 LVT devices have intrinsic gain ~25-100
*   at these currents, and the plain telescopic, even with L = 1-2 um, reached 68-72 dB only at the cost of
*   phase margin (long PMOS cascodes put a pole near 45 MHz) and swing (giving the input pair and the mirror more VDS
*   eats the 0.43 V swing budget: 1.8 V - 0.35 V tail node - VDS(in) - VDS(mirror) - 2 Vdsat). The regulated NMOS
*   cascode makes the NMOS side ~50x stiffer for 20 uA, so the gain is set by the PMOS side (~71 dB) while the
*   input pair can stay short (W=30 L=0.5, low input/tail capacitance: higher UGF, smaller fall overshoot).
*   vcp from a resistor-shifted diode keeps the mirror and the PMOS cascode saturated at the corner where PMOS
*   |Vth| is lowest (fs: VGS of the PMOS mirror drops 0.14 V; split 0.33 V / 0.19 V between the two).
* Sky130 1.8 V LVT devices, VDD = 1.8 V, VCM = 0.9 V, Iref = 20 uA into iref, CL = 1 pF. NMOS bulks at 0.
* Sized by hand (gm/Id, gm/gds per device, headroom budget), one simulation per change; no automated search.
* Results (python benchmark/evaluate.py ota_tele benchmark/golden/ota_tele_1v8.sp --vdd 1.8 --corner <k>):
*  corner  gain dB  UGF MHz  PM deg  GM dB  power uW  rise/fall settle ns  overshoot r/f %  swing V  min sat margin
*  tt      70.95    58.9     62.3    13.1   201.3     10.8 / 16.0          2.7 / 9.0        0.538    100 mV
*  ff      70.90    59.3     61.4    13.4   204.0     11.7 / 16.7          3.9 / 9.4        0.541     95 mV
*  ss      70.91    58.3     63.0    12.9   198.6     10.2 / 13.8          2.1 / 8.6        0.531    104 mV
*  sf      70.72    59.6     63.4    13.0   200.4     11.9 / 13.2          3.6 / 8.4        0.588    107 mV
*  fs      70.88    57.5     60.5    14.1   202.2     11.3 / 18.1          3.7 / 9.7        0.483     74 mV
* Passes spec.yaml at all five corners. TT margins: gain +6.1 %, UGF +32 %, PM +13 %, power +25 %, fall settle +17 %,
*   swing +25 %. Worst-corner margins: gain +5.8 % (sf), fall settle +7.0 % (fs), PM +10 % (fs), swing +12.6 % (fs).
* Power includes the 36 uW of Iref (supply current 112 uA: Iref 20, tail 40, vcp branch 21, vbp branch 10, aux 2 x 10).
.subckt dut iref inp inn out
* --- bias: Iref diode (tail and mirror copies), PMOS cascode gate vcp, PMOS load bias vbp for the boost amplifiers
XMB1 iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=1 nf=1 ad=2.32 as=2.32 pd=16.58 ps=16.58 m=2
XMBN2 vcp iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=1 nf=1 ad=2.32 as=2.32 pd=16.58 ps=16.58 m=2
XMBP vpb vpb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=1 nf=1 ad=11.6 as=11.6 pd=80.58 ps=80.58 m=1
Rp vpb vcp 16.5k
XMBN3 vbp iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=1 nf=1 ad=2.32 as=2.32 pd=16.58 ps=16.58 m=1
XMBP2 vbp vbp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=1 nf=1 ad=2.32 as=2.32 pd=16.58 ps=16.58 m=1
* --- tail, input pair, regulated NMOS cascodes
XMT tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=1 nf=1 ad=2.32 as=2.32 pd=16.58 ps=16.58 m=4
XM1 x1 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=0.5 nf=1 ad=8.7 as=8.7 pd=60.58 ps=60.58 m=1
XM2 x2 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=0.5 nf=1 ad=8.7 as=8.7 pd=60.58 ps=60.58 m=1
XM3 d1 g3 x1 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=1.2 nf=1 ad=11.6 as=11.6 pd=80.58 ps=80.58 m=1
XM4 out g4 x2 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=1.2 nf=1 ad=11.6 as=11.6 pd=80.58 ps=80.58 m=1
XMA1 g3 x1 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 ad=1.16 as=1.16 pd=8.58 ps=8.58 m=1
XMA2 g4 x2 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 ad=1.16 as=1.16 pd=8.58 ps=8.58 m=1
XMPA1 g3 vbp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=1 nf=1 ad=2.32 as=2.32 pd=16.58 ps=16.58 m=1
XMPA2 g4 vbp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=1 nf=1 ad=2.32 as=2.32 pd=16.58 ps=16.58 m=1
* --- PMOS low-voltage cascode mirror load (diode side at d1)
XM5 d1 vcp y1 vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=1 nf=1 ad=11.6 as=11.6 pd=80.58 ps=80.58 m=1
XM6 out vcp y2 vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=1 nf=1 ad=11.6 as=11.6 pd=80.58 ps=80.58 m=1
XM7 y1 d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1 nf=1 ad=5.8 as=5.8 pd=40.58 ps=40.58 m=1
XM8 y2 d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1 nf=1 ad=5.8 as=5.8 pd=40.58 ps=40.58 m=1
.ends dut
