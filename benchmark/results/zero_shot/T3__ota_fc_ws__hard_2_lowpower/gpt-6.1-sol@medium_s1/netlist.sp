* Two-stage, Miller-compensated low-voltage OTA.
* Candidate port; specification compliance requires model-based simulation.
* Global supply node: vdd = 1.2 V.

.subckt dut iref inp inn out

* Diode-connected reference device and mirrored bias currents.
XREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=1.5 nf=1 m=1
XTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=1.5 nf=1 m=1
XSINK out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=1.5 nf=1 m=1

* NMOS differential input pair.
XINN mirror inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=80 L=1 nf=1 m=1
XINP stage1 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=80 L=1 nf=1 m=1

* PMOS current-mirror active load.
XLOADREF mirror mirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=16 L=0.8 nf=1 m=1
XLOAD stage1 mirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=16 L=0.8 nf=1 m=1

* Inverting second stage.
XOUT out stage1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=120 L=1.5 nf=1 m=1

* Miller compensation with a series zero-control resistor.
RCOMP stage1 comp 1.5k
CCOMP comp out 1.3p

.ends dut
