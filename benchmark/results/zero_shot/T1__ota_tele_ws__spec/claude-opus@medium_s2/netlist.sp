.subckt dut iref inp inn out
* ---------------- bias generation ----------------
* reference diode, 20 uA (unit NMOS 4/1 at 10 uA)
XMR   iref iref 0    0   sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=2
* tail current source, 50 uA (mirrored from iref)
XMT   net8 iref 0    0   sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=5
* 10 uA sink for PMOS cascode bias branch
XMS   vbp  iref 0    0   sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1
* PMOS cascode bias: Vbp = (VDD - 20uA*Ry) - Vsg(replica of MP1/MP3 density)
Ry    vdd  ny   14k
XMPD  vbp  vbp  ny   vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=0.8 nf=1 m=2
* 10 uA PMOS source feeding the NMOS cascode bias
XMPE  vbn  vbp  ny   vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=0.8 nf=1 m=2
* NMOS cascode bias: Vbn = 10uA*Rz + Vgs(replica of MN0/MN2 density)
XMCD  vbn  vbn  nz   0   sky130_fd_pr__nfet_01v8_lvt W=4 L=0.8 nf=1 m=1
Rz    nz   0    62k
* ---------------- telescopic OTA ----------------
* input pair (25 uA each, weak/moderate inversion)
XMN1  n074 inp  net8 0   sky130_fd_pr__nfet_01v8_lvt W=5 L=0.5 nf=1 m=15
XMN3  n030 inn  net8 0   sky130_fd_pr__nfet_01v8_lvt W=5 L=0.5 nf=1 m=15
* NMOS cascodes
XMN0  n082 vbn  n074 0   sky130_fd_pr__nfet_01v8_lvt W=5 L=0.8 nf=1 m=2
XMN2  out  vbn  n030 0   sky130_fd_pr__nfet_01v8_lvt W=5 L=0.8 nf=1 m=2
* PMOS wide-swing cascode mirror load
XMP1  n082 vbp  n0100 vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=0.8 nf=1 m=5
XMP0  n0100 n082 vdd  vdd sky130_fd_pr__pfet_01v8_lvt W=9 L=0.7 nf=1 m=2
XMP3  out  vbp  n097 vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=0.8 nf=1 m=5
XMP2  n097 n082 vdd  vdd sky130_fd_pr__pfet_01v8_lvt W=9 L=0.7 nf=1 m=2
.ends dut
