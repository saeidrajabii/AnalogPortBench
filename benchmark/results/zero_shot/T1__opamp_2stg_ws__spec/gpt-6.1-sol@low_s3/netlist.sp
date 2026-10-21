* Two-stage amplifier with mirrored reference bias,
* cascoded output sink, and series-R Miller compensation.
* Candidate sizing; performance requires verification with the TT models.

.subckt dut iref inp inn out

* Reference-current mirror.
XMNREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1

* PMOS bias mirror.
XMNBP pbias iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
XMPREF pbias pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=1 nf=1 m=1

* Elevated gate bias for the output NMOS cascode.
XMPBC vbcas pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=1 nf=1 m=1
XMNBC vbcas vbcas 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=1 nf=1 m=1

* NMOS differential input stage, nominal 56-uA tail current.
XMTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=28 L=1 nf=1 m=1
XMINN mirror inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=1 nf=1 m=1
XMINP stage1 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=1 nf=1 m=1

* PMOS active load.
XMPD mirror mirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=0.8 nf=1 m=1
XMPL stage1 mirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=0.8 nf=1 m=1

* Common-source second stage, nominal 112-uA sink current.
XMPOUT out stage1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=160 L=1 nf=1 m=1
XMNOUT out vbcas sink 0 sky130_fd_pr__nfet_01v8_lvt W=56 L=1 nf=1 m=1
XMNSINK sink iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=56 L=1 nf=1 m=1

* Miller compensation and zero control.
RZERO stage1 comp 1k
CCOMP comp out 900f

.ends dut
