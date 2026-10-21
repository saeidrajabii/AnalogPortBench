* Low-common-mode error amplifier.
* Increasing vsense decreases vg.
.subckt error_amp_low vref vsense vg bn bp
XPT tail bp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=30 L=10 nf=1 m=1
XPS nd vsense tail vdd sky130_fd_pr__pfet_01v8_lvt W=120 L=2 nf=1 m=1
XPR err vref tail vdd sky130_fd_pr__pfet_01v8_lvt W=120 L=2 nf=1 m=1
XND nd nd 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=2 nf=1 m=1
XNM err nd 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=2 nf=1 m=1
XNG vg err 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=2 nf=1 m=1
XPL vg bp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=30 L=10 nf=1 m=1
CC err vg 2p
.ends error_amp_low

* High-common-mode error amplifier.
* Increasing vsense decreases vg.
.subckt error_amp_high vref vsense vg bn bp
XNT tail bn 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=10 nf=1 m=1
XNS pd vsense tail 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=2 nf=1 m=1
XNR err vref tail 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=2 nf=1 m=1
XPD pd pd vdd vdd sky130_fd_pr__pfet_01v8_lvt W=24 L=2 nf=1 m=1
XPM err pd vdd vdd sky130_fd_pr__pfet_01v8_lvt W=24 L=2 nf=1 m=1
XPG vg err vdd vdd sky130_fd_pr__pfet_01v8_lvt W=60 L=2 nf=1 m=1
XNL vg bn 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=10 nf=1 m=1
CC err vg 2p
.ends error_amp_high

.subckt dut iin out vb1 vb2 vb3 vb4

* Reference current enters a diode-connected NMOS drain.
* Its source resistor supplies the NMOS current-sense reference.
XNR iin iin rn 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=10 nf=1 m=1
RNR rn 0 200

* Mirror the reference into a diode-connected PMOS branch.
* The PMOS source resistor supplies the PMOS current-sense reference.
XNM pb iin rm 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=10 nf=1 m=1
RNM rm 0 200
XPR pb pb rp vdd sky130_fd_pr__pfet_01v8_lvt W=300 L=10 nf=1 m=1
RPR vdd rp 200

* Internal-node targets: approximately 0.12 V and 1.08 V.
RBT vdd pref 10k
RBM pref nref 80k
RBB nref 0 10k

* Independently regulate output current and cascode internal voltage.
XAN rn nsense vb4 iin pb error_amp_low
XACN nref nsrc vb3 iin pb error_amp_low
XAP rp psense vb1 iin pb error_amp_high
XACP pref psrc vb2 iin pb error_amp_high

* NMOS cascode current sink.
RNS nsense 0 200
XNMAIN nsrc vb4 nsense 0 sky130_fd_pr__nfet_01v8_lvt W=1000 L=1 nf=1 m=1
XNCAS out vb3 nsrc 0 sky130_fd_pr__nfet_01v8_lvt W=1000 L=1 nf=1 m=1

* PMOS cascode current source.
RPS vdd psense 200
XPMAIN psrc vb1 psense vdd sky130_fd_pr__pfet_01v8_lvt W=3000 L=1 nf=1 m=1
XPCAS out vb2 psrc vdd sky130_fd_pr__pfet_01v8_lvt W=3000 L=1 nf=1 m=1

.ends dut
