.subckt dut iref inp inn out
* ---- Bias generation (vb4 = iref node) ----
* Reference diode: iref drives drain and gate, source to ground
XMref iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=1 nf=1 m=1

* vb3: NMOS diode fed from vdd through 43k (about 20 uA, Vgs about 0.94 V)
XMb3 vb3 vb3 0 0 sky130_fd_pr__nfet_01v8_lvt W=1 L=1 nf=1 m=1
Rb3 vdd vb3 43k

* vb2: PMOS diode from vdd, pulled to ground through 31k (about 20 uA, about 0.62 V)
XMb2 vb2 vb2 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=1.5 L=1 nf=1 m=1
Rb2 vb2 0 31k

* ---- OTA core ----
* Tail current source (about 3.5x the reference, about 70 uA)
XMtail tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=7 L=1 nf=1 m=1

* NMOS input pair
XMin_p nl inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=3.5 L=0.5 nf=1 m=1
XMin_n nr inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=3.5 L=0.5 nf=1 m=1

* Left branch: PMOS current sources with cascode, NMOS cascode and sink
XMP4 fn vb2 nl vdd sky130_fd_pr__pfet_01v8_lvt W=6 L=0.5 nf=1 m=1
XMP0 nl fn vdd vdd sky130_fd_pr__pfet_01v8_lvt W=6 L=0.5 nf=1 m=1
XMP1 nl fn vdd vdd sky130_fd_pr__pfet_01v8_lvt W=6 L=0.5 nf=1 m=1
XMN6 fn vb3 nb 0 sky130_fd_pr__nfet_01v8_lvt W=3.5 L=0.5 nf=1 m=1
XMN7 nb iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=3.5 L=1 nf=1 m=1

* Right branch: PMOS current sources, PMOS cascode to output, NMOS cascode and sink
XMP2 nr fn vdd vdd sky130_fd_pr__pfet_01v8_lvt W=6 L=0.5 nf=1 m=1
XMP3 nr fn vdd vdd sky130_fd_pr__pfet_01v8_lvt W=6 L=0.5 nf=1 m=1
XMP5 out vb2 nr vdd sky130_fd_pr__pfet_01v8_lvt W=6 L=0.5 nf=1 m=1
XMN9 out vb3 nc 0 sky130_fd_pr__nfet_01v8_lvt W=3.5 L=0.5 nf=1 m=1
XMN8 nc iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=3.5 L=1 nf=1 m=1
.ends dut
