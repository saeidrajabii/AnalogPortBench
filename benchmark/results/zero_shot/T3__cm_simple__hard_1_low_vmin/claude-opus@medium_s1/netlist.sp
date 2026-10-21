* Low-voltage, high-output-resistance current mirror for SKY130 (VDD = 1.2 V)
* M1 sinks the reference current at node "in" (into its drain).
* M2 is the output device and shares gate node "g" with M1.
* A pseudo-differential PMOS amplifier (MA1/MA2 with NMOS mirror load MN3/MN4)
* compares V(in) and V(out) and drives "g" so that V(in) = V(out).
* M1 and M2 therefore have equal Vgs and equal Vds, which makes
* Iout track Iref down to a few tens of mV.
* M2/M1 = 21/20 gives a deliberate +5 % ratio for margin at low output voltage.

.subckt dut in out
* mirror pair (weak/moderate inversion, W/L = 140 and 147)
XM1  in  g  0 0 sky130_fd_pr__nfet_01v8_lvt W=7 L=1 nf=1 m=20
XM2  out g  0 0 sky130_fd_pr__nfet_01v8_lvt W=7 L=1 nf=1 m=21

* Vds-equalizing amplifier: inputs are gates only, so it draws no current from in or out
* in rises -> MA1 current falls -> MN4 sinks less -> g rises -> M1 pulls in back down
XMA1 d1 in  vdd vdd sky130_fd_pr__pfet_01v8_lvt W=2 L=1 nf=1 m=1
XMA2 g  out vdd vdd sky130_fd_pr__pfet_01v8_lvt W=2 L=1 nf=1 m=1
XMN3 d1 d1  0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=1 nf=1 m=1
XMN4 g  d1  0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=1 nf=1 m=1
.ends dut
