* Two-stage OTA with mirrored bias and series-R Miller compensation.
* Device dimensions are in micrometres.
* Nominal mirrored currents:
*   bias translation: 4 uA
*   input-pair tail:  16 uA
*   output stage:     28 uA
* Including the 20 uA reference, nominal supply current is 68 uA.
* Performance and operating regions require model-based verification.

.subckt dut iref inp inn out

* Reference-current mirror. The reference enters a drain/gate node.
XMNREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
XMNBIAS pbias iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1

* PMOS bias reference and mirrored current sources.
XMPREF pbias pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=1.5 nf=1 m=1
XMPTAIL tail pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=48 L=1.5 nf=1 m=1
XMPOUT out pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=84 L=1.5 nf=1 m=1

* PMOS differential pair with NMOS current-mirror load.
* A positive change at inp lowers stage1 and raises out.
XMPINP mirror inp tail vdd sky130_fd_pr__pfet_01v8_lvt W=80 L=2 nf=1 m=1
XMPINN stage1 inn tail vdd sky130_fd_pr__pfet_01v8_lvt W=80 L=2 nf=1 m=1
XMNLOAD1 mirror mirror 0 0 sky130_fd_pr__nfet_01v8_lvt W=32 L=2 nf=1 m=1
XMNLOAD2 stage1 mirror 0 0 sky130_fd_pr__nfet_01v8_lvt W=32 L=2 nf=1 m=1

* Common-source second stage.
* Its geometry scales the nominal 8 uA mirror-load current to 28 uA.
XMNOUT out stage1 0 0 sky130_fd_pr__nfet_01v8_lvt W=112 L=2 nf=1 m=1

* Miller compensation with a series zero-setting resistor.
RCOMP stage1 comp 10k
CCOMP comp out 0.75p

.ends dut
