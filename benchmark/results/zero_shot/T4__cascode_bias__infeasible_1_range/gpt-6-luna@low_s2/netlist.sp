.subckt dut iin out vb1 vb2 vb3 vb4
* Best-effort cascoded mirrors. The bias stacks are diode connected;
* the 1-ohm connection preserves the reference design's Iin-to-bias connection.
XMREFN1 vb4 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=200 L=1.0 nf=1 m=1
XMREFN2 vb3 vb3 vb4 vb4 sky130_fd_pr__nfet_01v8_lvt W=200 L=1.0 nf=1 m=1
XMREFP1 vb1 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=400 L=1.0 nf=1 m=1
XMREFP2 vb2 vb2 vb1 vdd sky130_fd_pr__pfet_01v8_lvt W=400 L=1.0 nf=1 m=1
RREF iin vb3 1

XMN0 nsrc vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=200 L=1.0 nf=1 m=1
XMN2 out vb3 nsrc 0 sky130_fd_pr__nfet_01v8_lvt W=200 L=1.0 nf=1 m=1
XMP1 psrc vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=400 L=1.0 nf=1 m=1
XMP0 out vb2 psrc vdd sky130_fd_pr__pfet_01v8_lvt W=400 L=1.0 nf=1 m=1
.ends dut
