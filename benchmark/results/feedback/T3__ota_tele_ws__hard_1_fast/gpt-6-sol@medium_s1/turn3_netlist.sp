.subckt dut iref inp inn out
* Reference current is converted to a gate bias and mirrored into the tail.
XREF  iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XTAIL ns iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=180 L=0.5 nf=1 m=1

* Decoupled NMOS cascode bias.
RBH vdd ncas 42k
RBL ncas 0 58k
CB ncas 0 10p

* Differential pair and matched, longer-channel NMOS cascodes.
XINP nl inp ns 0 sky130_fd_pr__nfet_01v8_lvt W=150 L=0.35 nf=1 m=1
XINN nr inn ns 0 sky130_fd_pr__nfet_01v8_lvt W=150 L=0.35 nf=1 m=1
XCN1 pl ncas nl 0 sky130_fd_pr__nfet_01v8_lvt W=150 L=0.75 nf=1 m=1
XCN2 out ncas nr 0 sky130_fd_pr__nfet_01v8_lvt W=150 L=0.75 nf=1 m=1

* Matched cascoded PMOS mirror load.
XPT1 ptop ptop vdd vdd sky130_fd_pr__pfet_01v8_lvt W=200 L=0.35 nf=1 m=1
XPC1 pl pl ptop vdd sky130_fd_pr__pfet_01v8_lvt W=285 L=0.5 nf=1 m=1
XPT2 pr ptop vdd vdd sky130_fd_pr__pfet_01v8_lvt W=200 L=0.35 nf=1 m=1
XPC2 out pl pr vdd sky130_fd_pr__pfet_01v8_lvt W=285 L=0.5 nf=1 m=1

* Smaller compensation network limits high-frequency loading.
RZ pl nz 2k
CZ nz out 0.10p
.ends dut
