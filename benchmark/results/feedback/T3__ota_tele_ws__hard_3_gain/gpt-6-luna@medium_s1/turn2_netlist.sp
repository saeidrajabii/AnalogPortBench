.subckt OTA_Telescopic iref inp inn out
  * Reference and scaled NMOS current sinks
  XMREF   iref  iref  0  0 sky130_fd_pr__nfet_01v8_lvt W=80  L=2 nf=1 m=1
  XMNTAIL ntail iref  0  0 sky130_fd_pr__nfet_01v8_lvt W=280 L=2 nf=1 m=1
  XMNBIAS pbi  iref  0  0 sky130_fd_pr__nfet_01v8_lvt W=80  L=2 nf=1 m=1

  * Differential input pair with PMOS mirror load
  XMNINN n1 inn ntail 0 sky130_fd_pr__nfet_01v8_lvt W=300 L=4 nf=1 m=1
  XMNINP n2 inp ntail 0 sky130_fd_pr__nfet_01v8_lvt W=300 L=4 nf=1 m=1
  XMPLOAD1 n1 n1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=200 L=4 nf=1 m=1
  XMPLOAD2 n2 n1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=200 L=4 nf=1 m=1

  * PMOS bias reference and second-stage output
  XMPBIAS pbi pbi vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20  L=4 nf=1 m=1
  XMP2    out pbi vdd vdd sky130_fd_pr__pfet_01v8_lvt W=120 L=4 nf=1 m=1
  XMN2    out n2  0   0   sky130_fd_pr__nfet_01v8_lvt W=200 L=4 nf=1 m=1

  * Miller compensation with series nulling resistor
  RZ n2 ncomp 1k
  CC ncomp out 1.8p
.ends OTA_Telescopic

.subckt dut iref inp inn out
  XIOTA iref inp inn out OTA_Telescopic
.ends dut
