* cascode_bias_ws, VDD = 1.2 V
* INFEASIBLE TASK: no design can meet match_width_V >= 1.144 V at VDD 1.2 V (reason: |Isource - Isink| < 1 uA lets each
* side lose < 5 % of 20 uA, which needs >= ~3 Vt (~80 mV) across even a single weak-inversion device, plus its cascode,
* at each rail; 1.144 V leaves 56 mV for both rails, so the physical limit is ~1.2 - 2 x 0.08 ~ 1.04 V); this is the
* best-achievable reference.
* Verified with benchmark/evaluate.py (27 C, same testbench and spec); n_triode = 0, mismatch and current errors pass
* at tt ff ss sf fs; match_width_V fails at every corner (0.95-0.96 V, 83-84 % of the limit, as it must).
* Design: NO topology change - the advisor's full wide-swing topology fits in 1.2 V once every output/replica device is
* moved to (near) weak inversion (Vdsat 0.05-0.08 V). MP4 (W/L = 40) puts Vsd(MP3/MP1) at ~0.16 V, MN8 (W/L = 8) puts
* Vds(MN10/MN0) at ~0.12 V; MN11/MN12 level shifters W/L = 800/1600 (weak inversion, small VGS).
* Rev 2 (saturation margin + area): MN6 was only 5 mV in saturation at ss/sf (Vds = vb2 - VGS12, and vb2 = VDD - VSG(MP4)
* drops ~0.13 V with slow PMOS): MN12 W/L 200 -> 1600 (VGS12 -60 mV) and MN11 200 -> 800 fix it (MN6 >= 64 mV). Area
* 75,392 -> 15,792 um^2: PMOS mirrors MP1/3/7/11 W/L 200 L 8 -> W/L 400 L 2 (12,800 -> 1,600 um^2 each), PMOS cascodes
* W/L 800 L 2 -> L 1, Iref mirror MN4/6/7 L 8 -> 4 at W/L 50. Trade-off chosen: shorter L gives more DIBL/output
* conductance, so the matched range drops 0.99 -> 0.96 V (-3 %, set by the PMOS-side edge) and the mismatch at 0.9 V
* grows -93 -> -179 nA (limit 1000 nA) for a 4.8x smaller gate area; L = 4 PMOS mirrors bought back only 0.01 V
* for +9,600 um^2, so they were not kept.
* TT: range 0.10-1.06 V (0.96 V), mismatch at 0.9 V -179 nA, Isink -0.8 %, Isource -1.7 %, no triode.
* Corners: range 0.95-0.96 V, |mismatch| <= 195 nA, |Isink|,|Isource| <= 3.2 %, min saturation margin 64 mV (MN6, sf).
.subckt dut iin out vb1 vb2 vb3 vb4
XMN4 iin iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=4 nf=1 m=2
XMN6 net1 iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=4 nf=1 m=2
XMN7 net2 iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=4 nf=1 m=2
XMN12 vb2 vb2 net1 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=1 nf=1 m=16
XMN11 vb1 vb1 net2 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=1 nf=1 m=8
XMP4 vb2 vb2 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=80 L=2 nf=1 m=1
XMP3 net13 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=100 L=2 nf=1 m=8
XMP2 vb1 vb2 net13 vdd sky130_fd_pr__pfet_01v8_lvt W=100 L=1 nf=1 m=8
XMP7 net5 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=100 L=2 nf=1 m=8
XMP6 vb3 vb2 net5 vdd sky130_fd_pr__pfet_01v8_lvt W=100 L=1 nf=1 m=8
XMN8 vb3 vb3 0 0 sky130_fd_pr__nfet_01v8_lvt W=16 L=2 nf=1 m=1
XMP11 net6 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=100 L=2 nf=1 m=8
XMP10 vb4 vb2 net6 vdd sky130_fd_pr__pfet_01v8_lvt W=100 L=1 nf=1 m=8
XMN9 vb4 vb3 net10 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=1 nf=1 m=2
XMN10 net10 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=2 nf=1 m=2
XMN0 nsrc vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=2 nf=1 m=2
XMN2 out vb3 nsrc 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=1 nf=1 m=2
XMP1 psrc vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=100 L=2 nf=1 m=8
XMP0 out vb2 psrc vdd sky130_fd_pr__pfet_01v8_lvt W=100 L=1 nf=1 m=8
.ends dut
