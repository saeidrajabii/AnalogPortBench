.subckt dut iref inp inn out
* ---------------- bias ----------------
XMR   iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
* PMOS reference diode (20uA)
XMB1  vbp iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
XMB2  vbp vbp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=1 nf=1 m=1
* NMOS cascode bias vb3 (20uA into high-density diode)
XMB3  vb3 vbp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=1 nf=1 m=1
XMB4  vb3 vb3 0 0 sky130_fd_pr__nfet_01v8_lvt W=1.5 L=1 nf=1 m=1
* PMOS cascode bias vb2 (20uA out of high-density diode)
XMB5  vb2 iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
XMB6  vb2 vb2 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=3 L=1 nf=1 m=1
* ---------------- OTA ----------------
* tail 100uA
XMT   tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=1 nf=1 m=1
* input pair
XM1   fl inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=0.5 nf=1 m=1
XM2   fr inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=0.5 nf=1 m=1
* top PMOS sources (gate from left branch)
XMP1  fl net1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=24 L=0.35 nf=1 m=1
XMP2  fr net1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=24 L=0.35 nf=1 m=1
* PMOS cascodes
XMP3  net1 vb2 fl vdd sky130_fd_pr__pfet_01v8_lvt W=30 L=0.5 nf=1 m=1
XMP4  out  vb2 fr vdd sky130_fd_pr__pfet_01v8_lvt W=30 L=0.5 nf=1 m=1
* NMOS cascodes
XMN3  net1 vb3 sl 0 sky130_fd_pr__nfet_01v8_lvt W=15 L=0.5 nf=1 m=1
XMN4  out  vb3 sr 0 sky130_fd_pr__nfet_01v8_lvt W=15 L=0.5 nf=1 m=1
* NMOS current sinks 30uA
XMN5  sl iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=1 nf=1 m=1
XMN6  sr iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=1 nf=1 m=1
.ends dut
