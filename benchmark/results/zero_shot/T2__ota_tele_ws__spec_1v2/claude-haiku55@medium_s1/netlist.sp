.subckt dut iref inp inn out
* Two-stage Miller OTA: NMOS input pair with PMOS mirror load, PMOS common-source
* second stage with NMOS current sink, and Miller compensation Cc.
* Bias: diode-connected NMOS on iref sets the sink, tail (2x), and second-stage (8x) currents.
* Branch currents: tail 40 uA, second stage 160 uA, reference 20 uA (about 264 uW at 1.2 V).

* Bias reference (diode-connected, iref enters the drain/gate node, source to ground)
XMref iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1

* Tail current source, 2x reference (40 uA)
XMtail tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1

* Input differential pair, 20 uA per side
XM1 d1 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=0.3 nf=1 m=1
XM2 out1 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=0.3 nf=1 m=1

* PMOS current mirror load (diode-connected on the inp side)
XM3 d1 d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=7 L=0.35 nf=1 m=1
XM4 out1 d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=7 L=0.35 nf=1 m=1

* Second stage: PMOS common source driven by out1, NMOS current sink (160 uA)
XM6 out out1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=0.35 nf=1 m=1
XM7 out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=80 L=0.5 nf=1 m=1

* Miller compensation from first-stage output to out
Cc out1 out 0.8p
.ends dut
