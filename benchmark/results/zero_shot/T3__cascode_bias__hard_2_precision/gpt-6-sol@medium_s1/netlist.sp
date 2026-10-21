.subckt bias_amp sense ref drive nb
* Non-inverting DC error amplifier.
XTAIL tail nb 0 0 sky130_fd_pr__nfet_01v8_lvt W=6 L=1 nf=1 m=1
XIN1 left sense tail 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=1 nf=1 m=1
XIN2 drive ref tail 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=1 nf=1 m=1
XLOAD1 left left vdd vdd sky130_fd_pr__pfet_01v8_lvt W=18 L=1 nf=1 m=1
XLOAD2 drive left vdd vdd sky130_fd_pr__pfet_01v8_lvt W=18 L=1 nf=1 m=1
.ends bias_amp

.subckt dut iin out vb1 vb2 vb3 vb4
* Ideal-resistor voltage references and amplifier bias.
RREFH vdd vref 100k
RREFL vref 0 300k
RNCASH vdd vb3 200k
RNCASL vb3 0 100k
RPCASH vdd vb2 100k
RPCASL vb2 0 100k
RAMP vdd nb 220k
XAMPBIAS nb nb 0 0 sky130_fd_pr__nfet_01v8_lvt W=5 L=1 nf=1 m=1

* Regulate the NMOS reference-stack drain to 0.9 V. The source
* follower shifts the amplifier output to the bottom-device gate.
XNA iin vref ndrive nb bias_amp
XSHIFT vdd ndrive vb4 0 sky130_fd_pr__nfet_01v8_lvt W=16 L=1 nf=1 m=1
XSHIFTBIAS vb4 nb 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1
XNREFBOT nrsource vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=300 L=1.2 nf=1 m=1
XNREFTOP iin vb3 nrsource 0 sky130_fd_pr__nfet_01v8_lvt W=400 L=1.2 nf=1 m=1
XNOUTBOT nsource vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=300 L=1.2 nf=1 m=1
XNOUTTOP out vb3 nsource 0 sky130_fd_pr__nfet_01v8_lvt W=400 L=1.2 nf=1 m=1

* An identically sized NMOS stack sinks the PMOS reference current.
* Feedback regulates its drain to the same 0.9 V reference.
XNCOPYBOT ncsource vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=300 L=1.2 nf=1 m=1
XNCOPYTOP pdrain vb3 ncsource 0 sky130_fd_pr__nfet_01v8_lvt W=400 L=1.2 nf=1 m=1
XPA pdrain vref vb1 nb bias_amp
XPREFUP prsource vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=2000 L=1.2 nf=1 m=1
XPREFLOW pdrain vb2 prsource vdd sky130_fd_pr__pfet_01v8_lvt W=900 L=1.2 nf=1 m=1
XPOUTUP psource vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=2000 L=1.2 nf=1 m=1
XPOUTLOW out vb2 psource vdd sky130_fd_pr__pfet_01v8_lvt W=900 L=1.2 nf=1 m=1
.ends dut
