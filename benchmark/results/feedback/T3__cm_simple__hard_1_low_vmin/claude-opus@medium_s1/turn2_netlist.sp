* Regulated low-voltage current mirror for SKY130 (VDD = 1.2 V)
* M1 sinks the reference current at node "in" (into its drain).
* M2 is the output device and shares gate node "g" with M1.
* The PMOS pseudo-differential amplifier (MA1/MA2, NMOS mirror load MN3/MN4)
* forces V(in) = V(out), so M1 and M2 have equal Vgs and Vds.
* Rbleed sets a well-defined, finite output conductance of about 0.5 uS.

.subckt dut in out
XM1  in  g  0 0 sky130_fd_pr__nfet_01v8_lvt W=7 L=1 nf=1 m=20
XM2  out g  0 0 sky130_fd_pr__nfet_01v8_lvt W=7 L=1 nf=1 m=20

XMA1 d1 in  vdd vdd sky130_fd_pr__pfet_01v8_lvt W=2 L=1 nf=1 m=1
XMA2 g  out vdd vdd sky130_fd_pr__pfet_01v8_lvt W=2 L=1 nf=1 m=1
XMN3 d1 d1  0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=1 nf=1 m=1
XMN4 g  d1  0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=1 nf=1 m=1

Rbleed out 0 2Meg
.ends dut
