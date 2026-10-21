.subckt dut iref inp inn out
* Reference: NMOS diode at iref. The 20 uA reference current enters iref and
* returns through this device to ground, so no reference current enters a source.
XMR iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
* PMOS tail (~10 uA), gate biased from iref so Vsg is about 1.2 V - Vgs(ref)
XMT tail iref vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=1 nf=1 m=1
* PMOS input pair (about 5 uA each). inp feeds the mirror-diode side, so the
* output is non-inverting with respect to inp.
XMP1 net9 inp tail vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=0.5 nf=1 m=1
XMP2 out inn tail vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=0.5 nf=1 m=1
* NMOS current-mirror active load
XMN3 net9 net9 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
XMN4 out net9 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
.ends dut
