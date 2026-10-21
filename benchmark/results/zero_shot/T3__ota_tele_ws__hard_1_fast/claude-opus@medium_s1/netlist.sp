.subckt dut iref inp inn out
* ---------------- bias generator (all currents derived from iref) ----------------
* reference diode: 20 uA, sets vbn (= node iref); unit device W=8 L=0.5 -> 10 uA
XMR   iref iref 0    0   sky130_fd_pr__nfet_01v8_lvt W=8 L=0.5 nf=1 m=2
* 10 uA sinks for the PMOS bias branches
XMS1  vbp  iref 0    0   sky130_fd_pr__nfet_01v8_lvt W=8 L=0.5 nf=1 m=1
XMS2  vcp  iref 0    0   sky130_fd_pr__nfet_01v8_lvt W=8 L=0.5 nf=1 m=1
* vbp: low-voltage cascoded replica of the OTA PMOS current source (matched Vds)
XPR1  y1   vbp  vdd  vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=0.5 nf=1 m=1
XPR2  vbp  vcp  y1   vdd sky130_fd_pr__pfet_01v8_lvt W=5.5 L=0.35 nf=1 m=1
* vcp: weak (about 6x current density) diode-connected PMOS -> PMOS cascode gate
XPD   vcp  vcp  vdd  vdd sky130_fd_pr__pfet_01v8_lvt W=1.9 L=0.7 nf=1 m=1
* vcn: 10 uA into a weak diode-connected NMOS -> NMOS cascode gate
XPS3  vcn  vbp  vdd  vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=0.5 nf=1 m=1
XND   vcn  vcn  0    0   sky130_fd_pr__nfet_01v8_lvt W=1.4 L=1 nf=1 m=1
* ---------------- folded-cascode OTA ----------------
* tail current source: 100 uA
XMT   tail iref 0    0   sky130_fd_pr__nfet_01v8_lvt W=8 L=0.5 nf=1 m=10
* NMOS input pair (weak/moderate inversion, high gm/Id)
XM1   foldL inp tail 0   sky130_fd_pr__nfet_01v8_lvt W=12 L=0.4 nf=1 m=8
XM2   foldR inn tail 0   sky130_fd_pr__nfet_01v8_lvt W=12 L=0.4 nf=1 m=8
* PMOS current sources at the folding nodes: 90 uA each
XP1   foldL vbp vdd  vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=0.5 nf=1 m=9
XP2   foldR vbp vdd  vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=0.5 nf=1 m=9
* PMOS cascodes: about 40 uA each
XP3   nA   vcp  foldL vdd sky130_fd_pr__pfet_01v8_lvt W=11 L=0.35 nf=1 m=2
XP4   out  vcp  foldR vdd sky130_fd_pr__pfet_01v8_lvt W=11 L=0.35 nf=1 m=2
* NMOS wide-swing cascode current mirror (single-ended conversion)
XN3   nA   vcn  nl   0   sky130_fd_pr__nfet_01v8_lvt W=8 L=0.5 nf=1 m=2
XN4   out  vcn  nr   0   sky130_fd_pr__nfet_01v8_lvt W=8 L=0.5 nf=1 m=2
XN5   nl   nA   0    0   sky130_fd_pr__nfet_01v8_lvt W=8 L=0.5 nf=1 m=2
XN6   nr   nA   0    0   sky130_fd_pr__nfet_01v8_lvt W=8 L=0.5 nf=1 m=2
.ends dut
