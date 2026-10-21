* Regulated reference branches and matched low-headroom cascodes.
* Dimensions are in micrometres.

.subckt bias_amp vref vsense vg nb pb
* Two-stage amplifier: vg increases when vsense increases.
XIN1 nd vref nt 0 sky130_fd_pr__nfet_01v8_lvt W=80 L=4 nf=1 m=1
XIN2 na vsense nt 0 sky130_fd_pr__nfet_01v8_lvt W=80 L=4 nf=1 m=1
XTAIL nt nb 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=4 nf=1 m=2

XLOAD1 nd nd vdd vdd sky130_fd_pr__pfet_01v8_lvt W=80 L=4 nf=1 m=1
XLOAD2 na nd vdd vdd sky130_fd_pr__pfet_01v8_lvt W=80 L=4 nf=1 m=1

XGAIN vg na 0 0 sky130_fd_pr__nfet_01v8_lvt W=16 L=4 nf=1 m=1
XBIAS vg pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=4 nf=1 m=8
CCOMP na vg 20p
.ends bias_amp

.subckt dut iin out vb1 vb2 vb3 vb4
* Auxiliary amplifier bias.
RB vdd nb 200k
XNB nb nb 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=4 nf=1 m=1
XNBP pb nb 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=4 nf=1 m=1
XPB pb pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=4 nf=1 m=1

* Common reference-drain target: 0.75 VDD.
RVT vdd vtarget 30k
RVB vtarget 0 90k

* Regulate the reference-current input and PMOS reference drain.
XAN vtarget iin vb4 nb pb bias_amp
XAP vtarget pref vb1 nb pb bias_amp

* Cascode gate offsets derived from the regulated mirror gates.
RNC1 vb4 vb3 14k
RNC2 vb3 vdd 86k
RPC1 vb1 vb2 14k
RPC2 vb2 0 86k

* Reference current enters a drain, not a source.
XNR0 nr vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=8 nf=1 m=80
XNR1 iin vb3 nr 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=4 nf=1 m=40

* NMOS mirror transfers the reference current to the PMOS reference.
XNT0 nt vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=8 nf=1 m=80
XNT1 pref vb3 nt 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=4 nf=1 m=40

* PMOS reference stack.
XPR0 pr vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=8 nf=1 m=80
XPR1 pref vb2 pr vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=4 nf=1 m=40

* Output NMOS cascode sink.
XNO0 nsrc vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=8 nf=1 m=80
XNO1 out vb3 nsrc 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=4 nf=1 m=40

* Output PMOS cascode source.
XPO0 psrc vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=8 nf=1 m=80
XPO1 out vb2 psrc vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=4 nf=1 m=40
.ends dut
