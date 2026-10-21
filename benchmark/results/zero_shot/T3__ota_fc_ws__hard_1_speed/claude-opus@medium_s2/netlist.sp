.subckt dut iref inp inn out
* ---------------- Bias generator ----------------
* Wide-swing cascoded reference: iref node = NMOS sink/tail gate (vb4)
XNR1 iref vb3 n10 0 sky130_fd_pr__nfet_01v8_lvt W=6 L=0.5 nf=1 m=2
XNR2 n10 iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=6 L=0.5 nf=1 m=4
* PMOS cascode gate (vb2): 5 uA into weak PMOS diode
XNA vb2 iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=6 L=0.5 nf=1 m=1
XPA vb2 vb2 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=0.55 L=0.5 nf=1 m=1
* PMOS mirror supplying the vb3 diode (5 uA)
XNB vbp iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=6 L=0.5 nf=1 m=1
XPB vbp vbp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=3.7 L=0.5 nf=1 m=1
XPC vb3 vbp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=3.7 L=0.5 nf=1 m=1
* NMOS cascode gate (vb3): weak NMOS diode
XNC vb3 vb3 0 0 sky130_fd_pr__nfet_01v8_lvt W=0.42 L=1.2 nf=1 m=1
* ---------------- Folded-cascode OTA ----------------
* NMOS input pair (inp on mirror side -> non-inverting to out)
XNIP n010 inp ntail 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.3 nf=1 m=6
XNIM n016 inn ntail 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.3 nf=1 m=6
* Tail 100 uA
XNT ntail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=6 L=0.5 nf=1 m=20
* Top PMOS sources, self-biased from n1 (~90 uA each)
XPT1 n010 n1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=0.35 nf=1 m=5
XPT2 n016 n1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=0.35 nf=1 m=5
* PMOS cascodes
XPC1 n1 vb2 n010 vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=0.35 nf=1 m=3
XPC2 out vb2 n016 vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=0.35 nf=1 m=3
* NMOS cascoded current sinks (40 uA each)
XNC1 n1 vb3 ns1 0 sky130_fd_pr__nfet_01v8_lvt W=6 L=0.5 nf=1 m=4
XNC2 out vb3 ns2 0 sky130_fd_pr__nfet_01v8_lvt W=6 L=0.5 nf=1 m=4
XNS1 ns1 iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=6 L=0.5 nf=1 m=8
XNS2 ns2 iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=6 L=0.5 nf=1 m=8
.ends dut
