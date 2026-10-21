* cascode_bias_ws, VDD = 1.8 V
* Verified with benchmark/evaluate.py (27 C, same testbench and spec as every other design); passes at tt ff ss sf fs.
* Design: the advisor's wide-swing bias topology unchanged (MN4/MN6/MN7 Iref mirror, MN11/MN12 level-shift diodes,
* MP4 diode -> vb2, MP3/MP2 -> vb1, MP7/MP6 + MN8 diode -> vb3, MP11/MP10 + MN9/MN10 replica -> vb4); resized only.
* Sky130 LVT Vth/mobility differ from 180 nm, so the 180 nm W/L ratios put the bias points in the wrong place
* (naive port: MP2 in triode, range 0.87 V). Main devices sized near weak inversion (Vdsat ~0.07-0.15 V, long L),
* MP4 W/L = 5 sets Vsd(MP3/MP1) = VSG(MP4) - VSG(MP2) ~0.25 V and MN8 W/L = 2 sets Vds(MN10/MN0) ~0.21 V.
* Rev 2 (saturation margin): MP4 W 8 -> 10 um. With W = 8 the vb1 cascode MP2 (Vsd = VSG3 - Vsd3) was only 35 mV
* in saturation at fs and MN6 (Vds = vb2 - VGS12) 50 mV at ss; the wider MP4 raises vb2 ~40 mV, moving 40 mV from
* Vsd(MP3/MP1) (margin >= 104 mV) to MP2 and MN6. Min saturation margin now 72 mV (MP2, fs), >= 83 mV elsewhere.
* TT: matched range 0.15-1.58 V (1.43 V, spec >= 1.144), mismatch at 0.9 V -24 nA, Isink -0.7 %, Isource -0.9 %, no triode.
* Corners: range 1.42-1.44 V, |mismatch| <= 28 nA, |Isink|,|Isource| <= 1.7 %. Gate area 3,096 um^2.
.subckt dut iin out vb1 vb2 vb3 vb4
XMN4 iin iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=4 nf=1 m=1
XMN6 net1 iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=4 nf=1 m=1
XMN7 net2 iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=4 nf=1 m=1
XMN12 vb2 vb2 net1 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=2 nf=1 m=1
XMN11 vb1 vb1 net2 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=2 nf=1 m=1
XMP4 vb2 vb2 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=2 nf=1 m=1
XMP3 net13 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=80 L=2 nf=1 m=1
XMP2 vb1 vb2 net13 vdd sky130_fd_pr__pfet_01v8_lvt W=160 L=2 nf=1 m=1
XMP7 net5 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=80 L=2 nf=1 m=1
XMP6 vb3 vb2 net5 vdd sky130_fd_pr__pfet_01v8_lvt W=160 L=2 nf=1 m=1
XMN8 vb3 vb3 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=2 nf=1 m=1
XMP11 net6 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=80 L=2 nf=1 m=1
XMP10 vb4 vb2 net6 vdd sky130_fd_pr__pfet_01v8_lvt W=160 L=2 nf=1 m=1
XMN9 vb4 vb3 net10 0 sky130_fd_pr__nfet_01v8_lvt W=80 L=2 nf=1 m=1
XMN10 net10 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=4 nf=1 m=1
XMN0 nsrc vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=4 nf=1 m=1
XMN2 out vb3 nsrc 0 sky130_fd_pr__nfet_01v8_lvt W=80 L=2 nf=1 m=1
XMP1 psrc vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=80 L=2 nf=1 m=1
XMP0 out vb2 psrc vdd sky130_fd_pr__pfet_01v8_lvt W=160 L=2 nf=1 m=1
.ends dut
