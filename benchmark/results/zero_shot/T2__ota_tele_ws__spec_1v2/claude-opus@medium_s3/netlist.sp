* Two-stage Miller OTA for SKY130, VDD = 1.2 V
* Bias: 20 uA reference mirrored to the tail (40 uA) and to the output sink (120 uA)
.subckt dut iref inp inn out
* Bias reference diode (iref flows only into drain/gate)
XMB  iref iref 0    0   sky130_fd_pr__nfet_01v8_lvt W=20 L=1   nf=1 m=1
* Tail current source, 2x reference = 40 uA
XMT  tail iref 0    0   sky130_fd_pr__nfet_01v8_lvt W=20 L=1   nf=1 m=2
* NMOS input pair (inn drives the diode side, inp drives the output side, so the stage is non-inverting)
XM1  y    inn  tail 0   sky130_fd_pr__nfet_01v8_lvt W=24 L=0.8 nf=1 m=1
XM2  x    inp  tail 0   sky130_fd_pr__nfet_01v8_lvt W=24 L=0.8 nf=1 m=1
* PMOS current-mirror load
XM3  y    y    vdd  vdd sky130_fd_pr__pfet_01v8_lvt W=6  L=0.5 nf=1 m=1
XM4  x    y    vdd  vdd sky130_fd_pr__pfet_01v8_lvt W=6  L=0.5 nf=1 m=1
* Second stage: PMOS common source (6x the mirror) with NMOS sink (6x the reference) = 120 uA
XM5  out  x    vdd  vdd sky130_fd_pr__pfet_01v8_lvt W=6  L=0.5 nf=1 m=6
XM6  out  iref 0    0   sky130_fd_pr__nfet_01v8_lvt W=20 L=1   nf=1 m=6
* Miller compensation with nulling resistor (Rz > 1/gm5 gives a left-half-plane zero)
Rz   x    nz   1.2k
Cc   nz   out  0.8p
.ends dut
