.subckt dut iref inp inn out
  * 20 uA reference sink and 1.5:1 NMOS tail-current mirror
  XNREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.8 nf=1 m=1
  XNTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=0.8 nf=1 m=1

  * NMOS differential pair; the inp branch drives the PMOS mirror diode
  XNINP x inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=0.8 nf=1 m=1
  XNINN out inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=0.8 nf=1 m=1

  * PMOS active mirror load
  XPMD x x vdd vdd sky130_fd_pr__pfet_01v8_lvt W=24 L=0.8 nf=1 m=1
  XPMO out x vdd vdd sky130_fd_pr__pfet_01v8_lvt W=24 L=0.8 nf=1 m=1
.ends dut
