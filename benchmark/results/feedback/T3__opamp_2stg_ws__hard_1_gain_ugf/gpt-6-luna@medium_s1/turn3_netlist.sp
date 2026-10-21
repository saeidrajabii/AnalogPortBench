.subckt dut iref inp inn out
  * Reference sink and scaled NMOS current mirrors.
  XMNREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=6 nf=1 m=1
  XMNTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=240 L=6 nf=1 m=1

  * NMOS differential pair and PMOS current-mirror load.
  XMNINN n1 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=300 L=6 nf=1 m=1
  XMNINP n2 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=300 L=6 nf=1 m=1
  XMPD n1 n1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=160 L=6 nf=1 m=1
  XMPM n2 n1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=160 L=6 nf=1 m=1

  * Common-source output stage.
  XMP2 out n1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=430 L=6 nf=1 m=1
  XMN2 out n2 0 0 sky130_fd_pr__nfet_01v8_lvt W=430 L=6 nf=1 m=1

  * Series-resistor Miller compensation.
  RR0 n2 ncomp 1k
  CC0 ncomp out 220f
.ends dut
