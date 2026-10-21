.subckt Cascode_Bias_WS iin vb1 vb2 vb3 vb4
* vb4 is the reference gate node (tied to iin, no DC current)
R1 iin vb4 1
* --- Reference cascode stack: Iref into drain of MN9R ---
XMN9R iin vb3 n10 0 sky130_fd_pr__nfet_01v8_lvt W=5 L=0.5 nf=1 m=30
XMN10R n10 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=5 L=1 nf=1 m=60
* --- vb3 generation: vb4 -> PMOS mirror -> dense NMOS diode ---
XMN7 pd vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=5 L=1 nf=1 m=60
XMP5 pd pd vdd vdd sky130_fd_pr__pfet_01v8_lvt W=5 L=0.5 nf=1 m=100
XMP6 vb3 pd vdd vdd sky130_fd_pr__pfet_01v8_lvt W=5 L=0.5 nf=1 m=100
XMN8 vb3 vb3 0 0 sky130_fd_pr__nfet_01v8_lvt W=5 L=0.5 nf=1 m=2
* --- vb2 generation: vb4 mirror -> dense PMOS diode ---
XMN6 vb2 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=5 L=1 nf=1 m=60
XMP4 vb2 vb2 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=5 L=0.5 nf=1 m=7
* --- vb1 generation: cascoded NMOS replica sinks from self-biased PMOS stack ---
XMNA nr1 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=5 L=1 nf=1 m=60
XMNB vb1 vb3 nr1 0 sky130_fd_pr__nfet_01v8_lvt W=5 L=0.5 nf=1 m=30
XMP2 vb1 vb2 p13 vdd sky130_fd_pr__pfet_01v8_lvt W=5 L=0.5 nf=1 m=100
XMP3 p13 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=5 L=0.5 nf=1 m=100
.ends Cascode_Bias_WS

.subckt dut iin out vb1 vb2 vb3 vb4
XI0 iin vb1 vb2 vb3 vb4 Cascode_Bias_WS
* NMOS cascode sink (replica of reference stack)
XMN0 nsrc vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=5 L=1 nf=1 m=60
XMN2 out vb3 nsrc 0 sky130_fd_pr__nfet_01v8_lvt W=5 L=0.5 nf=1 m=30
* PMOS cascode source (replica of vb1 stack)
XMP1 psrc vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=5 L=0.5 nf=1 m=100
XMP0 out vb2 psrc vdd sky130_fd_pr__pfet_01v8_lvt W=5 L=0.5 nf=1 m=100
.ends dut
