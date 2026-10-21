.subckt dut iref inp inn out
* ---------------- Bias generator ----------------
* Reference diode: 20 uA, 1.25 uA/um
XMR   iref iref 0    0   sky130_fd_pr__nfet_01v8_lvt W=4   L=0.5 nf=1 m=4
* 7.5 uA branch -> top PMOS gate diode (vbp)
XB1   vbp  iref 0    0   sky130_fd_pr__nfet_01v8_lvt W=6   L=0.5 nf=1 m=1
XPD1  vbp  vbp  vdd  vdd sky130_fd_pr__pfet_01v8_lvt W=7.5 L=0.5 nf=1 m=1
* 10 uA branch -> PMOS cascode bias diode (weak device, ~7x lower W/L per current)
XB2   vbpc iref 0    0   sky130_fd_pr__nfet_01v8_lvt W=8   L=0.5 nf=1 m=1
XPD2  vbpc vbpc vdd  vdd sky130_fd_pr__pfet_01v8_lvt W=3.4 L=1   nf=1 m=1
* 10 uA branch -> NMOS cascode bias diode (weak device, ~7x lower W/L per current)
XPB3  vbnc vbp  vdd  vdd sky130_fd_pr__pfet_01v8_lvt W=10  L=0.5 nf=1 m=1
XND3  vbnc vbnc 0    0   sky130_fd_pr__nfet_01v8_lvt W=1.4 L=1   nf=1 m=1
* ---------------- Folded-cascode OTA ----------------
* Tail: 80 uA (mirror ratio 4 from reference)
XMT   tail iref 0    0   sky130_fd_pr__nfet_01v8_lvt W=4   L=0.5 nf=1 m=16
* NMOS input pair (inp on the mirror-diode side -> non-inverting to out)
XM1   foldl inp  tail 0  sky130_fd_pr__nfet_01v8_lvt W=4   L=0.3 nf=1 m=10
XM2   foldr inn  tail 0  sky130_fd_pr__nfet_01v8_lvt W=4   L=0.3 nf=1 m=10
* Top PMOS current sources: 90 uA each
XPT1  foldl vbp  vdd  vdd sky130_fd_pr__pfet_01v8_lvt W=7.5 L=0.5 nf=1 m=12
XPT2  foldr vbp  vdd  vdd sky130_fd_pr__pfet_01v8_lvt W=7.5 L=0.5 nf=1 m=12
* PMOS folding cascodes: ~50 uA each
XPC1  a    vbpc foldl vdd sky130_fd_pr__pfet_01v8_lvt W=7.5 L=0.5 nf=1 m=8
XPC2  out  vbpc foldr vdd sky130_fd_pr__pfet_01v8_lvt W=7.5 L=0.5 nf=1 m=8
* NMOS low-voltage (wide-swing) cascode mirror load
XNC1  a    vbnc sl   0   sky130_fd_pr__nfet_01v8_lvt W=4   L=0.5 nf=1 m=6
XNC2  out  vbnc sr   0   sky130_fd_pr__nfet_01v8_lvt W=4   L=0.5 nf=1 m=6
XNB1  sl   a    0    0   sky130_fd_pr__nfet_01v8_lvt W=4   L=0.5 nf=1 m=6
XNB2  sr   a    0    0   sky130_fd_pr__nfet_01v8_lvt W=4   L=0.5 nf=1 m=6
.ends dut
