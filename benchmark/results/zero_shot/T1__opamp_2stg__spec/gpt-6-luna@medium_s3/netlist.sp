.subckt dut iref inp inn out
  * Reference-current sink and NMOS mirrors
  XMNREF   iref    iref    0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1.5 nf=1 m=1
  XMNBIAS  p2bias  iref    0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1.5 nf=1 m=1
  XMTAIL   tail    iref    0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1.5 nf=1 m=2

  * PMOS bias generator and second-stage current source
  XMPBIAS  p2bias  p2bias  vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1.5 nf=1 m=1
  XMPOUT   out     p2bias  vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1.5 nf=1 m=3

  * NMOS differential input stage; diode-connected load is on the inn side
  XMNINP   n1      inp     tail 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=1.5 nf=1 m=1
  XMNINN   nminus  inn     tail 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=1.5 nf=1 m=1
  XMPDIODE nminus  nminus  vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1.5 nf=1 m=1
  XMPMIR   n1      nminus  vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1.5 nf=1 m=1

  * Second gain stage and Miller compensation
  XMNS2    out     n1      0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=1.5 nf=1 m=1
  RCOMP    n1      ncomp   3k
  CCOMP    ncomp   out     700f
.ends dut
