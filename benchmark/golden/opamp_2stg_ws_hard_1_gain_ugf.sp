* opamp_2stg_ws, VDD = 1.2 V golden for HARD spec circuits/opamp_2stg_ws/profiles/hard_1_gain_ugf.yaml
* (loop gain >= 80 dB at UGF >= 118 MHz).
* Verified with benchmark/evaluate.py (27 C, same testbench as every other design: unity-gain follower,
* VCM = 0.9 V, Iref = 20 uA, CL = 1 pF) at all five corners tt ff ss sf fs.
* Topology changes vs. the advisor's design (two-stage Miller, wide-swing cascode bias):
*  1. Stage 1: the 5T NMOS pair + PMOS mirror becomes an NMOS-input FOLDED CASCODE (PMOS sources on vb1,
*     PMOS cascodes on vb2, NMOS wide-swing cascode mirror on vb3). Sky130 devices have much lower
*     gm/gds than the 180 nm ones at the same L; the naive port of the original reaches only 46 dB (1.8 V) /
*     40 dB (1.2 V) loop gain (limit 71.9 dB), and with VCM fixed at 0.9 V there is no room for a telescopic cascode at 1.2 V.
*     The folding uses all four outputs of the wide-swing bias (the original opamp used only vb3/vb4).
*  2. Stage 2: PMOS common source + NMOS cascode sink becomes NMOS common source + PMOS current-source
*     load (vb1). At VDD = 1.2 V and Vout = 0.9 V the PMOS device has only 0.3 V of Vds: as the gain device
*     it had gm/gds ~ 7; as a long-L load it does not limit the gain, and the NMOS gain device has 0.9 V.
*  3. Tail: single NMOS device on vb4 (the cascode tail goes into triode: with VCM = 0.9 V the tail node
*     sits at only ~0.3 V).
*  4. Wide-swing bias: same four-branch structure (vb1 PMOS diode reference, vb2 weak PMOS diode,
*     vb3 weak NMOS diode, vb4 cascoded NMOS diode), branch currents scaled from 20 uA to Iref/4 (Iref/8
*     in hard_3) to save power; the level-shift diodes MN11/MN12, the vb1 cascode MP2 and the vb3 cascode
*     MP6 are removed (they pushed MN6/MP2/MP6 into triode at 1.2 V and at the fs corner).
*  5. Miller compensation kept (Cc + series Rz); Cc/Rz re-tuned for the Sky130 parasitics (the 3 kOhm of
*     the original puts the Rz*C_gate pole at ~170 MHz with the large Sky130 second-stage device).
* Sizing (from the 1.2 V golden): stage 2 raised to ~200 uA with a short (L = 0.36) gain device to halve its
* gate capacitance, short NMOS cascodes in the folding mirror, tail 9 units, Cc = 400 fF, Rz = 1.5 kOhm.
.subckt Cascode_Bias_WS Iin Vbias_1 Vbias_2 Vbias_3 Vbias_4
* Iref diode and its copies for the four bias branches
XMN4 Iin Iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=1 nf=1 m=1
XMN6 Vbias_2 Iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=1 nf=1 m=1
XMN7 Vbias_1 Iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=1 nf=1 m=1
* vb2: weak PMOS diode (PMOS cascode gate)
XMP4 Vbias_2 Vbias_2 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=0.42 L=0.6 nf=1 m=1
* vb1: PMOS diode (gate of all PMOS current sources)
XMP3 Vbias_1 Vbias_1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=16 L=2 nf=1 m=1
* vb3: PMOS copy into weak NMOS diode (NMOS cascode gate)
XMP7 Vbias_3 Vbias_1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=16 L=2 nf=1 m=1
XMN8 Vbias_3 Vbias_3 0 0 sky130_fd_pr__nfet_01v8_lvt W=0.5 L=2 nf=1 m=1
* vb4: PMOS copy into cascoded NMOS diode (NMOS current-source gate)
XMP11 net6 Vbias_1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=16 L=2 nf=1 m=1
XMP10 Vbias_4 Vbias_2 net6 vdd sky130_fd_pr__pfet_01v8_lvt W=16 L=0.5 nf=1 m=1
XMN9 Vbias_4 Vbias_3 net10 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1
XMN10 net10 Vbias_4 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=1 nf=1 m=1
.ends Cascode_Bias_WS
.subckt Opamp_2stg Vbias_1 Vbias_2 Vbias_3 Vbias_4 vm vout vp
* tail: single device on vb4
XMN3 net10 Vbias_4 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=1 nf=1 m=9
* input pair
XMN1 fa vp net10 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
XMN2 fb vm net10 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
* PMOS folding sources (vb1) and cascodes (vb2)
XMPA fa Vbias_1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=16 L=2 nf=1 m=11
XMPB fb Vbias_1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=16 L=2 nf=1 m=11
XMPC net08 Vbias_2 fa vdd sky130_fd_pr__pfet_01v8_lvt W=16 L=0.5 nf=1 m=3
XMPD net9 Vbias_2 fb vdd sky130_fd_pr__pfet_01v8_lvt W=16 L=0.5 nf=1 m=3
* NMOS wide-swing cascode mirror load (cascodes on vb3)
XMNC net08 Vbias_3 xa 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=0.5 nf=1 m=8
XMND net9 Vbias_3 xb 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=0.5 nf=1 m=8
XMNE xa net9 0 0 sky130_fd_pr__nfet_01v8_lvt W=1.5 L=0.5 nf=1 m=8
XMNF xb net9 0 0 sky130_fd_pr__nfet_01v8_lvt W=1.5 L=0.5 nf=1 m=8
* stage 2: NMOS common source + PMOS current-source load (vb1)
XMN5 vout net08 0 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=0.36 nf=1 m=1
XMP2 vout Vbias_1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=16 L=2 nf=1 m=46
CC0 net012 vout 400f m=1
RR0 net08 net012 1.5k m=1
.ends Opamp_2stg
.subckt dut iref inp inn out
XI0 iref vb1 vb2 vb3 vb4 Cascode_Bias_WS
XI1 vb1 vb2 vb3 vb4 inn out inp Opamp_2stg
.ends dut
