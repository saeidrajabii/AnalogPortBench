* ota_tele_ws, VDD = 1.2 V (VCM = 0.6 V), Sky130 1.8 V LVT devices
* Verified with: python benchmark/evaluate.py ota_tele_ws benchmark/golden/ota_tele_ws_1v2.sp --vdd 1.2
* Why the topology changes: with VCM = 0.6 V an NMOS input pair leaves its source at 0.6 - Vgs (0.55-0.6 V)
* = 0-0.05 V, so neither the advisor's cascoded tail nor a single tail transistor can stay saturated, and the
* telescopic stack (tail, input, 2 cascodes, load) needs ~1.4 V for the 0.51 V swing the spec asks for.
* Design: two stages.
*  Stage 1: PMOS-input FOLDED cascode (input bulk tied to the tail node, own n-well), NMOS fold sinks with
*  NMOS cascodes, PMOS low-voltage cascode mirror load (the folded form of the advisor's telescopic stage).
*  Stage 2: PMOS common source M5 + NMOS sink M6, Miller Rz + Cc.
*  Replica bias of the output stage (in the spirit of the advisor's replica-biased cascodes): MR is one unit of
*  M5 driven by the mirror node d1 (low-passed by Rf/Cf so no signal feeds forward), MNR mirrors its current
*  into M6. The M5/M6 current ratio is then purely geometric, so the OPEN-LOOP output DC (ota_ol_ac
*  testbench) stays at ~0.6 V in every corner instead of hitting a rail.
*  Bias: self-biased NMOS cascode reference (Iref -> Rn -> diode); PMOS tail reference MBP1 (diode); PMOS
*  cascode gate vpc from a long-L diode MBD, so the load's Vsd = Vsg(MBD) - Vsg(MP3) tracks the PMOS corner.
* All five corners pass spec.yaml.
.subckt dut iref inp inn out
R0 iref vnc 1
Rn vnc vnb 12k
XMBN2 vnb vnc bn1 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=0.5 nf=1 m=1
XMBN1 bn1 vnb 0 0 sky130_fd_pr__nfet_01v8_lvt W=6.25 L=1 nf=1 m=1
XMBS1 vpb vnb 0 0 sky130_fd_pr__nfet_01v8_lvt W=6.25 L=1 nf=1 m=1
XMBP1 vpb vpb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=80 L=1 nf=1 m=1
XMBS3 vpc vnb 0 0 sky130_fd_pr__nfet_01v8_lvt W=3.125 L=1 nf=1 m=1
XMBD vpc vpc vdd vdd sky130_fd_pr__pfet_01v8_lvt W=7.7 L=2 nf=1 m=1
XMT tail vpb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=160 L=1 nf=1 m=1
XM1 f1 inn tail tail sky130_fd_pr__pfet_01v8_lvt W=80 L=0.35 nf=1 m=1
XM2 f2 inp tail tail sky130_fd_pr__pfet_01v8_lvt W=80 L=0.35 nf=1 m=1
XMS1 f1 vnb 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
XMS2 f2 vnb 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
XMC1 d1 vnc f1 0 sky130_fd_pr__nfet_01v8_lvt W=7.3 L=0.5 nf=1 m=1
XMC2 o1 vnc f2 0 sky130_fd_pr__nfet_01v8_lvt W=7.3 L=0.5 nf=1 m=1
XMP3 d1 vpc p1 vdd sky130_fd_pr__pfet_01v8_lvt W=60 L=0.7 nf=1 m=1
XMP1 p1 d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=0.7 nf=1 m=1
XMP4 o1 vpc p2 vdd sky130_fd_pr__pfet_01v8_lvt W=60 L=0.7 nf=1 m=1
XMP2 p2 d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=0.7 nf=1 m=1
XM5 out o1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=0.7 nf=1 m=6
XM6 out vnr 0 0 sky130_fd_pr__nfet_01v8_lvt W=5 L=1 nf=1 m=6
XMR vnr d1f vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=0.7 nf=1 m=1
XMNR vnr vnr 0 0 sky130_fd_pr__nfet_01v8_lvt W=5 L=1 nf=1 m=1
Rf d1 d1f 2meg
Cf d1f vdd 0.5p
Rz o1 cz 3.5k
Cc cz out 0.75p
.ends dut
