.subckt dut iin out vb1 vb2 vb3 vb4
* Reference: diode-connected NMOS sets Iref (20 uA) at iin.
* vb4 follows iin through a 1 mOhm tie, so vb4 is a bias output.
XMref iin iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=0.5 nf=1 m=1
Rb4 iin vb4 1m

* NMOS bias generators (sinks fed by Iref)
XMc vb1 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=0.5 nf=1 m=1
XMd3 vb2 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=0.5 nf=1 m=1
XMb3 vb3 vb3 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=0.5 nf=1 m=1

* PMOS bias generators (sources fed by Iref)
XMpa vb1 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XMpe vb3 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XMpg vb2 vb2 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4.5 L=0.5 nf=1 m=1

* NMOS cascode sink (out to ground)
XMn0 nsrc vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=0.5 nf=1 m=1
XMn2 out vb3 nsrc 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=0.5 nf=1 m=1

* PMOS cascode source (vdd to out)
XMp1 psrc vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XMp0 out vb2 psrc vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.5 nf=1 m=1
.ends dut
