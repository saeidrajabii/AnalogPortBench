.subckt dut iref inp inn out
* 20 uA reference and NMOS mirror
XMREFN iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=2.5 nf=1 m=1
XMNBIAS p_ref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=2.5 nf=1 m=1
XMPBIAS p_ref p_ref vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=2.5 nf=1 m=1

* Differential input pair and PMOS mirror load
XMTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=6 L=2.5 nf=1 m=1
XMINN n1 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=2 nf=1 m=1
XMINP n2 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=2 nf=1 m=1
XMPLOAD1 n1 n1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=2.5 nf=1 m=1
XMPLOAD2 n2 n1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=2.5 nf=1 m=1

* Second gain stage
XMOUTN out n2 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=2.5 nf=1 m=1
XMOUTP out p_ref vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=2.5 nf=1 m=1

* Miller compensation
RZ n2 ncomp 2k
CCOMP ncomp out 600f
.ends dut
