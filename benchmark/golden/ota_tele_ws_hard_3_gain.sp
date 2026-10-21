* ota_tele_ws, hard spec point hard_3_gain, VDD = 1.2 V (VCM = 0.6 V), Sky130 1.8 V LVT devices
* Verified with: python benchmark/evaluate.py ota_tele_ws benchmark/golden/ota_tele_ws_hard_3_gain.sp
*                --spec benchmark/circuits/ota_tele_ws/profiles/hard_3_gain.yaml [--corner tt|ff|ss|sf|fs]
* Design: same two-stage architecture as ota_tele_ws_1v2.sp, built for gain: long-channel stage-1 cascodes
* (NMOS MC L=1.5, PMOS MP3/MP4 L=1.5, MBN2 matched), mirror/output PMOS at L=1 (MP1, M5, MR) and the output
* sink M6/MNR at L=2, so both stages gain more (~86 dB total). Tail cut to 30 uA with 34 uA fold sinks
* (sinks > tail: clean slewing); the larger M5 gate capacitance is handled by Cc = 1.2 pF, Rz = 2.5 k
* (UGB ~30 MHz, PM ~69 deg). vpc diode MBD narrowed so the PMOS mirror MP1/MP2 keeps >= 50 mV saturation margin.
.subckt dut iref inp inn out
R0 iref vnc 1
Rn vnc vnb 12k
XMBN2 vnb vnc bn1 0 sky130_fd_pr__nfet_01v8_lvt W=36 L=1.5 nf=1 m=1
XMBN1 bn1 vnb 0 0 sky130_fd_pr__nfet_01v8_lvt W=6.25 L=1 nf=1 m=1
XMBS1 vpb vnb 0 0 sky130_fd_pr__nfet_01v8_lvt W=6.25 L=1 nf=1 m=1
XMBP1 vpb vpb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=80 L=1 nf=1 m=1
XMBS3 vpc vnb 0 0 sky130_fd_pr__nfet_01v8_lvt W=3.125 L=1 nf=1 m=1
XMBD vpc vpc vdd vdd sky130_fd_pr__pfet_01v8_lvt W=7 L=2 nf=1 m=1
XMT tail vpb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=120 L=1 nf=1 m=1
XM1 f1 inn tail tail sky130_fd_pr__pfet_01v8_lvt W=80 L=0.35 nf=1 m=1
XM2 f2 inp tail tail sky130_fd_pr__pfet_01v8_lvt W=80 L=0.35 nf=1 m=1
XMS1 f1 vnb 0 0 sky130_fd_pr__nfet_01v8_lvt W=10.6 L=1 nf=1 m=1
XMS2 f2 vnb 0 0 sky130_fd_pr__nfet_01v8_lvt W=10.6 L=1 nf=1 m=1
XMC1 d1 vnc f1 0 sky130_fd_pr__nfet_01v8_lvt W=22 L=1.5 nf=1 m=1
XMC2 o1 vnc f2 0 sky130_fd_pr__nfet_01v8_lvt W=22 L=1.5 nf=1 m=1
XMP3 d1 vpc p1 vdd sky130_fd_pr__pfet_01v8_lvt W=128 L=1.5 nf=1 m=1
XMP1 p1 d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=34 L=1 nf=1 m=1
XMP4 o1 vpc p2 vdd sky130_fd_pr__pfet_01v8_lvt W=128 L=1.5 nf=1 m=1
XMP2 p2 d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=34 L=1 nf=1 m=1
XM5 out o1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=34 L=1 nf=1 m=4
XM6 out vnr 0 0 sky130_fd_pr__nfet_01v8_lvt W=25 L=2 nf=1 m=4
XMR vnr d1f vdd vdd sky130_fd_pr__pfet_01v8_lvt W=34 L=1 nf=1 m=1
XMNR vnr vnr 0 0 sky130_fd_pr__nfet_01v8_lvt W=25 L=2 nf=1 m=1
Rf d1 d1f 2meg
Cf d1f vdd 0.5p
Rz o1 cz 2.5k
Cc cz out 1.2p
.ends dut
