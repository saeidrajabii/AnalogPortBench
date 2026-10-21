.subckt dut iin out vb1 vb2 vb3 vb4

* Reference current: enters the drain of a diode-connected NMOS.
XNREF iin iin nr 0 sky130_fd_pr__nfet_01v8_lvt W=200 L=8 nf=1 m=1
RNR nr 0 1k

* Mirrored reference establishes the PMOS reference.
XNPR pg iin npr 0 sky130_fd_pr__nfet_01v8_lvt W=200 L=8 nf=1 m=1
RNPR npr 0 1k
XPREF pg pg pr vdd sky130_fd_pr__pfet_01v8_lvt W=400 L=8 nf=1 m=1
RPR vdd pr 1k

* NMOS cascode bias replica: nominal source voltage 150 mV.
XPNB vb3 pg pnb vdd sky130_fd_pr__pfet_01v8_lvt W=400 L=8 nf=1 m=1
RPNB vdd pnb 1k
XNCB vb3 vb3 ncb 0 sky130_fd_pr__nfet_01v8_lvt W=4000 L=0.5 nf=1 m=1
RNCB ncb 0 7.5k

* PMOS cascode bias replica: nominal source voltage 1.05 V.
XNPB vb2 iin npb 0 sky130_fd_pr__nfet_01v8_lvt W=200 L=8 nf=1 m=1
RNPB npb 0 1k
XPCB vb2 vb2 pcb vdd sky130_fd_pr__pfet_01v8_lvt W=8000 L=0.5 nf=1 m=1
RPCB vdd pcb 7.5k

* Output cascode current sink.
XNSINK nstack vb4 ns 0 sky130_fd_pr__nfet_01v8_lvt W=400 L=1 nf=1 m=1
XNCAS out vb3 nstack 0 sky130_fd_pr__nfet_01v8_lvt W=4000 L=0.5 nf=1 m=1
RNS ns 0 1k

* Output cascode current source.
XPSOURCE pstack vb1 ps vdd sky130_fd_pr__pfet_01v8_lvt W=800 L=1 nf=1 m=1
XPCAS out vb2 pstack vdd sky130_fd_pr__pfet_01v8_lvt W=8000 L=0.5 nf=1 m=1
RPS vdd ps 1k

* Matched resistive level shifting for the sink-current feedback.
RNLREF1 nr nref_cm 10Meg
RNLREF2 vdd nref_cm 10Meg
RNLSNS1 ns nsense_cm 10Meg
RNLSNS2 vdd nsense_cm 10Meg

* Sink-current error amplifier: PMOS input pair, NMOS mirror load.
XPNTAIL ntail pg ntail_supply vdd sky130_fd_pr__pfet_01v8_lvt W=200 L=8 nf=1 m=1
RPNTAIL vdd ntail_supply 2k
XPNIN1 nload nref_cm ntail vdd sky130_fd_pr__pfet_01v8_lvt W=400 L=8 nf=1 m=1
XPNIN2 vb4 nsense_cm ntail vdd sky130_fd_pr__pfet_01v8_lvt W=400 L=8 nf=1 m=1
XNNLOAD1 nload nload 0 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=8 nf=1 m=1
XNNLOAD2 vb4 nload 0 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=8 nf=1 m=1
CNCOMP vb4 0 2p

* Matched resistive level shifting for the source-current feedback.
RPLREF1 pr pref_cm 10Meg
RPLREF2 pref_cm 0 10Meg
RPLSNS1 ps psense_cm 10Meg
RPLSNS2 psense_cm 0 10Meg

* Source-current error amplifier: NMOS input pair, PMOS mirror load.
XNPTAIL ptail iin ptail_ground 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=8 nf=1 m=1
RNPTAIL ptail_ground 0 2k
XNPIN1 pload pref_cm ptail 0 sky130_fd_pr__nfet_01v8_lvt W=200 L=8 nf=1 m=1
XNPIN2 vb1 psense_cm ptail 0 sky130_fd_pr__nfet_01v8_lvt W=200 L=8 nf=1 m=1
XPPLOAD1 pload pload vdd vdd sky130_fd_pr__pfet_01v8_lvt W=200 L=8 nf=1 m=1
XPPLOAD2 vb1 pload vdd vdd sky130_fd_pr__pfet_01v8_lvt W=200 L=8 nf=1 m=1
CPCOMP vb1 vdd 2p

.ends dut
