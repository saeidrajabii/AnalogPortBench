.subckt dut iref inp inn out
* NMOS reference mirror: 20 uA reference, 20 uA tail, and 20 uA PMOS-bias sink
XMREF  iref iref 0   0   sky130_fd_pr__nfet_01v8_lvt W=5 L=1.0 nf=1 m=1
XMTAIL tail iref 0   0   sky130_fd_pr__nfet_01v8_lvt W=5 L=1.0 nf=1 m=1
XMPBS  pb   iref 0   0   sky130_fd_pr__nfet_01v8_lvt W=5 L=1.0 nf=1 m=1

* PMOS reference and current-source loads
XMPREF pb   pb   vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=1.5 nf=1 m=1
XMPL1  n1   pb   vdd vdd sky130_fd_pr__pfet_01v8_lvt W=5  L=1.5 nf=1 m=1
XMPL2  n2   pb   vdd vdd sky130_fd_pr__pfet_01v8_lvt W=5  L=1.5 nf=1 m=1
XMPOUT out  pb   vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=1.5 nf=1 m=1

* NMOS differential input stage
XMNINP n1   inp  tail 0   sky130_fd_pr__nfet_01v8_lvt W=20 L=1.5 nf=1 m=1
XMNINN n2   inn  tail 0   sky130_fd_pr__nfet_01v8_lvt W=20 L=1.5 nf=1 m=1

* Second gain stage and Miller compensation
XMNS2  out  n1   0    0   sky130_fd_pr__nfet_01v8_lvt W=40 L=1.5 nf=1 m=1
RZ     n1   ncomp 2.5k
CC     ncomp out  300f
.ends dut
