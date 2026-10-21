* ota_tele_ws, VDD = 1.8 V (VCM = 0.9 V), Sky130 1.8 V LVT devices
* Verified with: python benchmark/evaluate.py ota_tele_ws benchmark/golden/ota_tele_ws_1v8.sp --vdd 1.8 --corner <k>
* Topology: the advisor's telescopic core (NMOS input pair, NMOS cascodes, cascoded NMOS tail, PMOS
* low-voltage-cascode mirror load) and wide-swing bias Cascode_Bias_WS, single-ended output. Changes vs source:
*  - NMOS cascode gate bias Vbias5 = V(tail) + Vgs(MN11) (was a PMOS replica, which tracked the PMOS corner):
*    MN11 a long diode on the pair's own tail node, 5 uA from a cascoded PMOS mirror of the bias generator.
*    MN11 L = 3 um sets the input-pair Vds to ~0.25 V at every corner (gm/gds of the pair 47 -> 60).
*  - Level-shifted mirror diode (new in this revision). The open-loop output sits where both branches match,
*    i.e. at the mirror's diode-side drain. With the gate tied straight to that drain the output was at
*    VDD - |Vgs(load)| (1.26 V at fs), leaving the output PMOS cascode MP3 only 0.21 V (gm/gds 26) -> 60.7 dB at fs.
*    Now the load gates (ng) sit dV = Ils*Rls ~0.13 V above the diode-side drain net082: Ils ~2.1 uA from a
*    cascoded PMOS mirror (MP6/MP7, gates vb1/vb2) flows through Rls = 60 kOhm into net082. An identical source
*    (MP8/MP9) injects the same Ils into the output so both branches stay balanced; it is cascoded and long
*    (> 100 MOhm) so it does not load Rout. The output now sits dV lower (1.16 V at fs, 0.88 V at sf), MP3 gets
*    +dV of Vsd, and the NMOS cascode MN2, which had 0.3..0.77 V to spare, gives it up. Cls = 5 pF bypasses Rls
*    so that above ~0.5 MHz the mirror gate still follows net082 (mirror gain Cls/(Cls+Cgg) ~0.95 at the UGB).
*  - PMOS loads MP0/MP2 W/L 6/1.5 -> 4.8/1.2 (same W/L, 0.64x gate area): mirror pole up, PM +4 deg,
*    fall settling 18.6 -> 16.3 ns at tt; their lower ro is offset by the better MP3 and input-pair gm*ro.
*  - Kept from the previous revision: PMOS cascodes MP1/MP3 W = 20, vb2 diode W = 8.5, tail stack and the bias
*    generator's vb4 branch widened 2x, vb3 diode W = 3.1, Cc = 0.1 pF output trim capacitor.
* Previous revision passed tt ff ss sf and failed fs (gain 60.7 dB < 62.54, fall settling 19.5 ns > 18.75).
* Corners: passes all five. Min saturation margin 52 mV (tail cascode at fs), max overshoot 8.1 % (fall, fs).
*   corner   gain dB  UGB MHz  PM deg  rise/fall ns  OS %   swing V  vout_dc V  min sat mV
*   tt       66.06    54.3     64.1    12.4 / 16.3    6.9    0.578    1.020      74
*   ff       65.73    55.8     62.9    13.1 / 16.0    7.5    0.538    1.097      87
*   ss       65.95    52.6     65.1     9.6 / 16.8    6.3    0.610    0.941      61
*   sf       65.11    54.7     65.6     9.4 / 15.6    5.9    0.583    0.879      78
*   fs       65.07    53.4     62.0    13.8 / 17.7    8.1    0.568    1.161      52
*   (limits: gain >= 62.54, UGB >= 46.7, PM >= 55, rise <= 19.09, fall <= 18.75, swing >= 0.513, power <= 320 uW;
*    power 189..200 uW: Ils is taken out of the load current, so the total supply current is unchanged)
.subckt Cascode_Bias_WS Iin Vbias_1 Vbias_2 Vbias_3 Vbias_4
XMN12 Vbias_2 Vbias_2 net1 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XMN11 Vbias_1 Vbias_1 net2 0 sky130_fd_pr__nfet_01v8_lvt W=5 L=1 nf=1 m=1
XMN10 net10 Vbias_4 0 0 sky130_fd_pr__nfet_01v8_lvt W=12.8 L=1 nf=1 m=1
XMN9 Vbias_4 Vbias_3 net10 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=0.5 nf=1 m=1
XMN8 Vbias_3 Vbias_3 0 0 sky130_fd_pr__nfet_01v8_lvt W=3.1 L=3.33 nf=1 m=1
XMN7 net2 Iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=5 L=1 nf=1 m=1
XMN6 net1 Iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=5 L=1 nf=1 m=1
XMN4 Iin Iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
XMP11 net6 Vbias_1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=1 nf=1 m=1
XMP10 Vbias_4 Vbias_2 net6 vdd sky130_fd_pr__pfet_01v8_lvt W=24 L=1 nf=1 m=1
XMP7 net5 Vbias_1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=1 nf=1 m=1
XMP6 Vbias_3 Vbias_2 net5 vdd sky130_fd_pr__pfet_01v8_lvt W=24 L=1 nf=1 m=1
XMP4 Vbias_2 Vbias_2 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8.5 L=4 nf=1 m=1
XMP3 net13 Vbias_1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=1 nf=1 m=1
XMP2 Vbias_1 Vbias_2 net13 vdd sky130_fd_pr__pfet_01v8_lvt W=24 L=1 nf=1 m=1
.ends Cascode_Bias_WS
.subckt OTA_Telescopic Vbias_1 Vbias_2 Vbias_3 Vbias_4 vm vout vp
* PMOS low-voltage-cascode mirror load
XMP0 net0100 ng vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4.8 L=1.2 nf=1 m=5
XMP1 net082 Vbias_2 net0100 vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1 nf=1 m=5
XMP2 net097 ng vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4.8 L=1.2 nf=1 m=5
* level-shifted mirror diode: load gates ng sit Ils*Rls ~0.13 V above the diode-side drain net082; Cls bypasses Rls
XMP6 net_ls1 Vbias_1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=4 nf=1 m=1
XMP7 ng Vbias_2 net_ls1 vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=2 nf=1 m=1
Rls ng net082 60k
Cls ng net082 5p
* identical Ils into the output so both branches stay balanced (cascoded, long: does not load Rout)
XMP8 net_ls2 Vbias_1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=4 nf=1 m=1
XMP9 vout Vbias_2 net_ls2 vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=2 nf=1 m=1
XMP3 vout Vbias_2 net097 vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1 nf=1 m=5
* NMOS cascodes and input pair
XMN0 net082 Vbias5 net074 0 sky130_fd_pr__nfet_01v8_lvt W=5 L=1 nf=1 m=5
XMN2 vout Vbias5 net030 0 sky130_fd_pr__nfet_01v8_lvt W=5 L=1 nf=1 m=5
XMN1 net074 vp net8 0 sky130_fd_pr__nfet_01v8_lvt W=6 L=1 nf=1 m=5
XMN3 net030 vm net8 0 sky130_fd_pr__nfet_01v8_lvt W=6 L=1 nf=1 m=5
* cascoded tail (two stacks of m=5, mirror of the bias generator's vb4 branch)
XMN4 net8 Vbias_3 net012 0 sky130_fd_pr__nfet_01v8_lvt W=6 L=0.5 nf=1 m=5
XMN5 net012 Vbias_4 0 0 sky130_fd_pr__nfet_01v8_lvt W=6.4 L=1 nf=1 m=5
XMN7 net8 Vbias_3 net6 0 sky130_fd_pr__nfet_01v8_lvt W=6 L=0.5 nf=1 m=5
XMN6 net6 Vbias_4 0 0 sky130_fd_pr__nfet_01v8_lvt W=6.4 L=1 nf=1 m=5
* cascode gate bias: Vbias5 = V(tail) + Vgs(MN11), 5 uA from a cascoded PMOS mirror; sets input-pair Vds ~0.25 V
XMP4 net016 Vbias_1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=6 L=1 nf=1 m=1
XMP5 Vbias5 Vbias_2 net016 vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=1 nf=1 m=1
XMN11 Vbias5 Vbias5 net8 0 sky130_fd_pr__nfet_01v8_lvt W=1 L=3 nf=1 m=1
* output compensation (load) capacitor: trims the UGB ~8 % (PM >= 62 deg, overshoot <= 8.1 % at every corner)
Cc vout 0 0.1p
.ends OTA_Telescopic
.subckt dut iref inp inn out
XI0 iref vb1 vb2 vb3 vb4 Cascode_Bias_WS
XI1 vb1 vb2 vb3 vb4 inn out inp OTA_Telescopic
.ends dut
