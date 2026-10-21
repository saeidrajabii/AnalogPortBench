* ota_fc_ws, hard spec point hard_2_lowpower, VDD = 1.2 V (VCM = 0.6 V)
* Verified with benchmark/evaluate.py --spec circuits/ota_fc_ws/profiles/hard_2_lowpower.yaml: >= 5 % margin on every
* limit at TT, passes at tt ff ss sf fs.
* Design: same two-stage topology as ota_fc_ws_1v2.sp (symmetrical-OTA first stage, NMOS common-source second stage,
* Rz-Cc Miller) scaled down: 9 uA tail, 30 uA output stage, 2.5 uA PMOS bias branch; the 20 uA Iref diode (24 uW) is
* the largest single consumer. Weak-inversion devices everywhere (higher gm/Id, lower Vdsat): gain and swing hold, the
* unity-gain frequency (~20 MHz) and the slew-limited settling (~36 ns) are what it gives up. Rz = 4k puts the LHP zero
* near the output pole (small output-stage gm).
.subckt dut iref inp inn out
XMB iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=1 nf=1 ad=11.6 as=11.6 pd=80.58 ps=80.58 m=1
XMT tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 ad=5.8 as=5.8 pd=40.58 ps=40.58 m=1
XMBP pb iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=5 L=1 nf=1 ad=1.45 as=1.45 pd=10.58 ps=10.58 m=1
XMPB pb pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=1 nf=1 ad=2.9 as=2.9 pd=20.58 ps=20.58 m=1
XM1 y inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=45 L=1 nf=1 ad=13.05 as=13.05 pd=90.58 ps=90.58 m=1
XM2 x inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=45 L=1 nf=1 ad=13.05 as=13.05 pd=90.58 ps=90.58 m=1
XMPY y y vdd vdd sky130_fd_pr__pfet_01v8_lvt W=3.75 L=0.75 nf=1 ad=1.087 as=1.087 pd=8.08 ps=8.08 m=1
XMPX x x vdd vdd sky130_fd_pr__pfet_01v8_lvt W=3.75 L=0.75 nf=1 ad=1.087 as=1.087 pd=8.08 ps=8.08 m=1
XMPY2 nd y vdd vdd sky130_fd_pr__pfet_01v8_lvt W=3.75 L=0.75 nf=1 ad=1.087 as=1.087 pd=8.08 ps=8.08 m=1
XMPX2 o1 x vdd vdd sky130_fd_pr__pfet_01v8_lvt W=3.75 L=0.75 nf=1 ad=1.087 as=1.087 pd=8.08 ps=8.08 m=1
XMN1 nd nd 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 ad=2.9 as=2.9 pd=20.58 ps=20.58 m=1
XMN2 o1 nd 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 ad=2.9 as=2.9 pd=20.58 ps=20.58 m=1
XM7 out o1 0 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=0.5 nf=1 ad=17.4 as=17.4 pd=120.6 ps=120.6 m=1
XM8 out pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=120 L=1 nf=1 ad=34.8 as=34.8 pd=240.6 ps=240.6 m=1
Rz o1 cz 4k
Cc cz out 0.75p
.ends dut
