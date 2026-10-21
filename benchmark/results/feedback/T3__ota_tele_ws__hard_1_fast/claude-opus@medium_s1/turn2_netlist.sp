.subckt dut iref inp inn out
* ---------------- bias generator ----------------
* reference diode 20 uA (unit W=8 L=0.5 -> 10 uA); node iref = vbn
XMR   iref iref 0    0   sky130_fd_pr__nfet_01v8_lvt W=8 L=0.5 nf=1 m=2
XMS1  vbp  iref 0    0   sky130_fd_pr__nfet_01v8_lvt W=8 L=0.5 nf=1 m=1
XMS2  vcp  iref 0    0   sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1
* vbp: low-voltage cascoded replica of OTA PMOS source (10 uA unit)
XPR1  y1   vbp  vdd  vdd sky130_fd_pr__pfet_01v8_lvt W=16 L=1 nf=1 m=1
XPR2  vbp  vcp  y1   vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=0.6 nf=1 m=1
* vcp: weak diode (5 uA)
XPD   vcp  vcp  vdd  vdd sky130_fd_pr__pfet_01v8_lvt W=1 L=0.9 nf=1 m=1
* vcn: 5 uA into weak NMOS diode
XPS3  vcn  vbp  vdd  vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=1 nf=1 m=1
XND   vcn  vcn  0    0   sky130_fd_pr__nfet_01v8_lvt W=0.7 L=1 nf=1 m=1
* ---------------- folded-cascode OTA ----------------
* tail 80 uA
XMT   tail iref 0    0   sky130_fd_pr__nfet_01v8_lvt W=8 L=0.5 nf=1 m=8
* input pair
XM1   foldL inp tail 0   sky130_fd_pr__nfet_01v8_lvt W=12 L=0.45 nf=1 m=14
XM2   foldR inn tail 0   sky130_fd_pr__nfet_01v8_lvt W=12 L=0.45 nf=1 m=14
* PMOS sources 90 uA each
XP1   foldL vbp vdd  vdd sky130_fd_pr__pfet_01v8_lvt W=16 L=1 nf=1 m=9
XP2   foldR vbp vdd  vdd sky130_fd_pr__pfet_01v8_lvt W=16 L=1 nf=1 m=9
* PMOS cascodes (~50 uA each)
XP3   nA   vcp  foldL vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=0.6 nf=1 m=4
XP4   out  vcp  foldR vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=0.6 nf=1 m=4
* NMOS wide-swing cascode mirror
XN3   nA   vcn  nl   0   sky130_fd_pr__nfet_01v8_lvt W=7 L=0.7 nf=1 m=4
XN4   out  vcn  nr   0   sky130_fd_pr__nfet_01v8_lvt W=7 L=0.7 nf=1 m=4
XN5   nl   nA   0    0   sky130_fd_pr__nfet_01v8_lvt W=7 L=0.7 nf=1 m=4
XN6   nr   nA   0    0   sky130_fd_pr__nfet_01v8_lvt W=7 L=0.7 nf=1 m=4
.ends dut
