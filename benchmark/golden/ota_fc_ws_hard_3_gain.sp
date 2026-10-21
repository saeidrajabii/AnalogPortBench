* ota_fc_ws, hard spec point hard_3_gain, VDD = 1.2 V (VCM = 0.6 V)
* Verified with benchmark/evaluate.py --spec circuits/ota_fc_ws/profiles/hard_3_gain.yaml: >= 5 % margin on every
* limit at TT, passes at tt ff ss sf fs.
* Design: two stages as ota_fc_ws_1v2.sp, but the first-stage NMOS mirror is a self-biased low-voltage CASCODE mirror
* (MNC1/MNC2 on vbnc from the long diode MBC): the stage-1 output resistance is then set by the PMOS mirror output alone
* and the first stage gives ~45 dB. The stage-1 output still sits at the NMOS mirror Vgs (n1 = o1 by symmetry), so the
* NMOS common-source stage (M7, 8 x the sink) stays ratio-matched and the open-loop output stays mid-rail at every
* corner. ~77 dB total with ~0.83 V swing; speed is what it gives up (Cc = 1.8 pF for PM ~69 deg, UGB ~17 MHz).
.subckt dut iref inp inn out
XMB iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=1 nf=1 ad=11.6 as=11.6 pd=80.58 ps=80.58 m=1
XMT tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=1 nf=1 ad=11.6 as=11.6 pd=80.58 ps=80.58 m=1
XMBP pb iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 ad=5.8 as=5.8 pd=40.58 ps=40.58 m=1
XMPB pb pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=1 nf=1 ad=11.6 as=11.6 pd=80.58 ps=80.58 m=1
XMPC vbnc pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=1 nf=1 ad=11.6 as=11.6 pd=80.58 ps=80.58 m=1
XMBC vbnc vbnc 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=2 nf=1 ad=1.16 as=1.16 pd=8.58 ps=8.58 m=1
XM1 y inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=90 L=1 nf=1 ad=26.1 as=26.1 pd=180.6 ps=180.6 m=1
XM2 x inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=90 L=1 nf=1 ad=26.1 as=26.1 pd=180.6 ps=180.6 m=1
XMPY y y vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=1 nf=1 ad=2.9 as=2.9 pd=20.58 ps=20.58 m=1
XMPX x x vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=1 nf=1 ad=2.9 as=2.9 pd=20.58 ps=20.58 m=1
XMPY2 n1 y vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=1 nf=1 ad=2.9 as=2.9 pd=20.58 ps=20.58 m=1
XMPX2 o1 x vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=1 nf=1 ad=2.9 as=2.9 pd=20.58 ps=20.58 m=1
XMNC1 n1 vbnc s1 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=0.5 nf=1 ad=11.6 as=11.6 pd=80.58 ps=80.58 m=1
XMNC2 o1 vbnc s2 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=0.5 nf=1 ad=11.6 as=11.6 pd=80.58 ps=80.58 m=1
XMN1 s1 n1 0 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=0.75 nf=1 ad=8.7 as=8.7 pd=60.58 ps=60.58 m=1
XMN2 s2 n1 0 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=0.75 nf=1 ad=8.7 as=8.7 pd=60.58 ps=60.58 m=1
XM7 out o1 0 0 sky130_fd_pr__nfet_01v8_lvt W=240 L=0.75 nf=1 ad=69.6 as=69.6 pd=480.6 ps=480.6 m=1
XM8 out pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=320 L=1 nf=1 ad=92.8 as=92.8 pd=640.6 ps=640.6 m=1
Rz o1 cz 1.2k
Cc cz out 1.8p
.ends dut
