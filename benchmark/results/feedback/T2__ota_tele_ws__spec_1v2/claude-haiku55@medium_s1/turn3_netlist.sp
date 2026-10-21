.subckt dut iref inp inn out
* Two-stage Miller OTA, revision 3.
* Stage 1: NMOS input pair (L=0.8) with PMOS mirror load (L=1.0).
* Stage 2: PMOS common source (XM6, sized to carry 160 uA at the stage-1 output
*          voltage) with PMOS cascode and NMOS cascode sink, all saturated.
* Bias: iref sets tail (2x) and stage-2 sink (8x). Cascode gates come from
*       resistor dividers (vbn about 0.85 V, vbp about 0.35 V).
* Branch currents: tail 40 uA, stage 2 160 uA, reference 20 uA (about 264 uW at 1.2 V).

* Cascode bias: vbn = 0.85 V, vbp = 0.35 V (ideal resistor dividers)
Rbn1 vdd vbn 4.1meg
Rbn2 vbn 0 10meg
Rbp1 vdd vbp 12meg
Rbp2 vbp 0 5meg

* Bias reference (diode-connected NMOS, iref enters the drain/gate node)
XMref iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1

* Tail current source, 2x reference (40 uA)
XMtail tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1

* Input differential pair, 20 uA per side
XM1 d1 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=200 L=0.8 nf=1 m=1
XM2 out1 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=200 L=0.8 nf=1 m=1

* PMOS current-mirror load (diode-connected on the inp side)
XM3 d1 d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1.0 nf=1 m=1
XM4 out1 d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1.0 nf=1 m=1

* Second stage: PMOS common source (gate out1), PMOS cascode, NMOS cascode, NMOS sink (160 uA)
XM6 x6 out1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=190 L=0.8 nf=1 m=1
XM8 out vbp x6 vdd sky130_fd_pr__pfet_01v8_lvt W=118 L=0.5 nf=1 m=1
XM9 out vbn x7 0 sky130_fd_pr__nfet_01v8_lvt W=80 L=0.5 nf=1 m=1
XM7 x7 iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=160 L=1.0 nf=1 m=1

* Miller compensation from first-stage output to out (reduced for higher unity-gain bandwidth)
Cc out1 out 0.35p
.ends dut
