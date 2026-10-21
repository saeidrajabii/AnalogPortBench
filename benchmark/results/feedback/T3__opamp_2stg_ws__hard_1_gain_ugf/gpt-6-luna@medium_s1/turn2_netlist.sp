.subckt dut iref inp inn out
  * 20-uA reference sink; all mirror devices use the same channel length.
  XMNREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=3 nf=1 m=1
  XMNTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=3 nf=1 m=1
  XMN2 out n2 0 0 sky130_fd_pr__nfet_01v8_lvt W=200 L=3 nf=1 m=1

  * Differential input stage and PMOS mirror load.
  XMNINN n1 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=160 L=3 nf=1 m=1
  XMNINP n2 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=160 L=3 nf=1 m=1
  XMPD n1 n1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=80 L=3 nf=1 m=1
  XMPM n2 n1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=80 L=3 nf=1 m=1

  * Second-stage PMOS current source, mirrored from the first-stage load.
  XMP2 out n1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=320 L=3 nf=1 m=1

  * Miller compensation.
  RR0 n2 ncomp 500
  CC0 ncomp out 800f
.ends dut
