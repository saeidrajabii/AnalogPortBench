.subckt dut iin out vb1 vb2 vb3 vb4
* tie bias port vb4 to the reference node (unloaded, no DC current)
R0 iin vb4 1

* ---- NMOS reference: cascoded replica of the output sink ----
XNI2 iin vb3 ni vdd_dummy_never sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=20
.ends dut
