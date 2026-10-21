.subckt dut iref inp inn out
  * 20 uA reference sink and scaled NMOS tail-current mirror
  XMREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=5 nf=1 m=1
  XMTAIL net10 iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=80 L=5 nf=1 m=1

  * NMOS differential pair
  XMNIN net9 inp net10 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=5 nf=1 m=1
  XMNINB out inn net10 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=5 nf=1 m=1

  * PMOS current-mirror load
  XMPD net9 net9 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=80 L=5 nf=1 m=1
  XMPM out net9 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=80 L=5 nf=1 m=1
.ends dut
