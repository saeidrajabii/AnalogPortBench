* ota_5t, VDD = 1.8 V (same design at both supplies)
* Verified with benchmark/evaluate.py (TT, 27 C, same testbench and spec as every other design).
* Design (topology change): PMOS-input 5T OTA. The test holds the inputs at VCM = 0.5 V, which leaves an
* NMOS input pair's tail in triode; PMOS inputs sit comfortably below VDD at 1.8 V and 1.2 V. Long-channel
* input devices (L = 2 um) and load (L = 2 um) for gain; 30 uA tail from a 5 uA bias branch keeps power low.
.subckt dut iref inp inn out
XNB iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=2 nf=1 m=4
XNB2 pb iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=2 nf=1 m=1
XPB pb pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=16 L=1 nf=1 m=1
XPT tail pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=16 L=1 nf=1 m=6
XPI1 nd inp tail vdd sky130_fd_pr__pfet_01v8_lvt W=120 L=2 nf=1 m=1
XPI2 out inn tail vdd sky130_fd_pr__pfet_01v8_lvt W=120 L=2 nf=1 m=1
XNL1 nd nd 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=2 nf=1 m=1
XNL2 out nd 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=2 nf=1 m=1
.ends dut
