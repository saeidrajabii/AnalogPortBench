.subckt dut iin out vb1 vb2 vb3 vb4
* ---------------- input mirror ----------------
XMN4 iin  iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=2
XMN7 vb2  iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=2
* ------------- PMOS low-voltage cascode reference (vb1, vb2) -------------
XMP3 n13 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=25 L=0.5 nf=1 m=4
XMP2 vb1 vb2 n13 vdd sky130_fd_pr__pfet_01v8_lvt W=25 L=0.5 nf=1 m=4
R1 vb1 vb2 7k
* ------------- PMOS copy feeding NMOS reference -------------
XMP11 n6 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=25 L=0.5 nf=1 m=4
XMP10 vb3 vb2 n6 vdd sky130_fd_pr__pfet_01v8_lvt W=25 L=0.5 nf=1 m=4
* ------------- NMOS low-voltage cascode reference (vb3, vb4) -------------
R2 vb3 vb4 7k
XMN9  vb4 vb3 n10 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=4
XMN10 n10 vb4 0   0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=4
* ---------------- output cascode source / sink ----------------
XMP1 psrc vb1 vdd  vdd sky130_fd_pr__pfet_01v8_lvt W=25 L=0.5 nf=1 m=4
XMP0 out  vb2 psrc vdd sky130_fd_pr__pfet_01v8_lvt W=25 L=0.5 nf=1 m=4
XMN2 out  vb3 nsrc 0   sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=4
XMN0 nsrc vb4 0    0   sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=4
.ends dut
