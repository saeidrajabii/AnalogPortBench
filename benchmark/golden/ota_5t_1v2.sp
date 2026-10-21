* ota_5t, VDD = 1.2 V
* Verified with benchmark/evaluate.py at all five corners tt ff ss sf fs (27 C, open loop, VCM = 0.5 V, CL = 1 pF)
* and with benchmark/golden/audit_golden.py.
* Design (topology change vs the 180 nm source): PMOS-input 5T OTA. The test holds the inputs at VCM = 0.5 V, which
* leaves an NMOS input pair's tail in triode; PMOS inputs fit below VDD.
* Rev 2: at 1.2 V the tail sees Vds = 0.7 V - Vsg(input), and Vsg spans 0.30 V (fs) to 0.57 V (sf) because the
* LVT PMOS threshold moves 0.31-0.62 V over the corners. Rev 1 (W/L = 120/2 input) left the tail in triode at ss/sf
* (-51 mV) and the input pair at Vds 0.21-0.24 V at fs (gain 30.8 dB < 31.47). Fixes: input pair at W/L = 400/2,
* bulk = tail (weak inversion: lower Vsg; the Sky130 PMOS Vth hardly depends on L, so L = 2 costs only ~15 mV of Vsg
* against L = 1 but halves gds); wide, low-density tail (W/L = 160/1, Vdsat 0.075 V); tail 20 uA; NMOS load at
* W/L = 30/2.5 (lower Vgs, so more input-pair Vds at fs, and lower gds).
* Corners (tt/ff/ss/sf/fs): gain 35.2/35.0/35.3/35.2/33.7 dB (>= 31.47), UGB 18.7-23.5 MHz (>= 16.16), PM 61-65 deg,
* power 49-56 uW (<= 112.8), no device in triode; min saturation margin 58 mV (tail at sf).
* Worst margin: dc gain +6.9 % at fs. The input pair dominates the gate area (~2,030 um^2 in total): a smaller pair
* needs more Vsg, which the tail cannot give at sf.
.subckt dut iref inp inn out
XNB iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=2 nf=1 m=4
XNB2 pb iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=2 nf=1 m=1
XPB pb pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=1 nf=1 m=1
XPT tail pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=1 nf=1 m=4
XPI1 nd inp tail tail sky130_fd_pr__pfet_01v8_lvt W=400 L=2 nf=1 m=1
XPI2 out inn tail tail sky130_fd_pr__pfet_01v8_lvt W=400 L=2 nf=1 m=1
XNL1 nd nd 0 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=2.5 nf=1 m=1
XNL2 out nd 0 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=2.5 nf=1 m=1
.ends dut
