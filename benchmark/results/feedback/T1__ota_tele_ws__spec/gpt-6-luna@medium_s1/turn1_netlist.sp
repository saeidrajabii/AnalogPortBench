.subckt dut iref inp inn out
* NMOS reference and mirrored tail current
XMREFN iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1.2 nf=1 m=1
XMTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=1.2 nf=1 m=1

* PMOS reference branch and mirrored loads
XMNPMREF pref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1.2 nf=1 m=1
XMPREF pref pref vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=1.2 nf=1 m=1

* Differential pair; the inn branch drives the output for negative feedback
XMINP nintp inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=1.2 nf=1 m=1
XMINN nintn inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=1.2 nf=1 m=1

* NMOS cascodes
XMNCASP nintp bncas out 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=1.2 nf=1 m=1
XMNCASN nintn bncas out 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=1.2 nf=1 m=1

* PMOS current-source loads and cascodes
XMPLOADP ptop pref vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1.2 nf=1 m=1
XMPLOADN ptopn pref vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1.2 nf=1 m=1
XMPCASP out bpcas ptop vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1.2 nf=1 m=1
XMPCASN out bpcas ptopn vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1.2 nf=1 m=1

* Gate-bias dividers
RNT vdd bnt 1.9032258meg
RNB bnt 0 1meg
RNC vdd bncas 636.36k
RNCB bncas 0 1meg
RPC vdd bpcas 1.6470588meg
RPCB bpcas 0 1meg
.ends dut
