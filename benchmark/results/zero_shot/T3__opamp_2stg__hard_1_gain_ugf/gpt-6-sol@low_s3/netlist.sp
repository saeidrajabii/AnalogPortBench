.subckt dut iref inp inn out
* The 20 uA reference is established in a diode-connected NMOS stack.
XBNREF nb nb 0 0 sky130_fd_pr__nfet_01v8_lvt W=45 L=0.5 nf=1 m=1
XBCREF iref iref nb 0 sky130_fd_pr__nfet_01v8_lvt W=45 L=0.5 nf=1 m=1

* Cascoded 60 uA tail current and NMOS differential pair.
XBT nt nb 0 0 sky130_fd_pr__nfet_01v8_lvt W=45 L=0.5 nf=1 m=3
XCT ns iref nt 0 sky130_fd_pr__nfet_01v8_lvt W=45 L=0.5 nf=1 m=3
XINP na inp ns 0 sky130_fd_pr__nfet_01v8_lvt W=80 L=0.5 nf=1 m=1
XINN mp inn ns 0 sky130_fd_pr__nfet_01v8_lvt W=80 L=0.5 nf=1 m=1

* PMOS current-mirror load.
XPMD mp mp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=43.2 L=1 nf=1 m=1
XPMM na mp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=43.2 L=1 nf=1 m=1

* Second stage with a cascoded NMOS current sink.
XPOUT out na vdd vdd sky130_fd_pr__pfet_01v8_lvt W=48 L=1 nf=1 m=3
XBOUT no nb 0 0 sky130_fd_pr__nfet_01v8_lvt W=45 L=0.5 nf=1 m=5
XCOUT out iref no 0 sky130_fd_pr__nfet_01v8_lvt W=45 L=0.5 nf=1 m=5

* Miller compensation with a series nulling resistor.
RCOMP na nc 1k
CCOMP nc out 550f
.ends dut
