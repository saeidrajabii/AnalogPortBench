* opamp_2stg, VDD = 1.2 V golden for HARD spec circuits/opamp_2stg/profiles/hard_3_lowpower.yaml
* (spec.yaml performance at <= 169.2 uW; spec.yaml allows 296.4 uW).
* Verified with benchmark/evaluate.py (27 C, same testbench as every other design: unity-gain follower,
* VCM = 0.9 V, Iref = 20 uA, CL = 1 pF) at all five corners tt ff ss sf fs.
* Topology (same as the 1.2 V golden opamp_2stg_1v2.sp; topology change vs the 180 nm source): NMOS-input
* FOLDED CASCODE first stage (single NMOS tail, PMOS folding sources, PMOS cascodes, NMOS low-voltage cascode
* mirror load), NMOS common-source second stage with a PMOS current-source load, Miller Cc + series Rz.
* Why: VCM = 0.9 V at VDD = 1.2 V rules out a PMOS input pair and leaves no room for a telescopic NMOS stack.
* Changes vs opamp_2stg_1v2.sp (223.5 uW -> 160.7 uW):
*  - stage 2 95 -> 67 uA (m = 13): the largest current; its floor is the rising edge (class-A pull-up must
*    exceed Itail*(1 + CL/Cc) = 14*4.3 = 62 uA, otherwise overshoot > 10 % and rise settling > 12 ns).
*  - tail 26 -> 14 uA with the input pair kept in weak inversion (W/L = 40/0.5, gm/Id ~ 25) and Cc 520 -> 300 fF,
*    so UGF stays at 83 MHz; folding sources 31 -> 21 uA each (1.4 x the tail, the cascodes never cut off).
*  - phase: short gain device XN6 W/L = 40/0.36 (low C at o1), PMOS cascodes W = 35, Rz = 4 kOhm: the LHP zero
*    1/(Cc*(Rz - 1/gm2)) ~ 170 MHz gives PM 65 deg (Rz = 2 k: PM 56; 4.7 k: GM 10.1 dB).
* Currents from VDD: folding sources 21 uA each (they also carry the 14 uA tail), stage 2 67 uA, bias 25 uA
* (Iref 20 uA + Iref/4 copy): 134 uA.
* Corners (tt/ff/ss/sf/fs): power 160.7/163.1/158.2/158.2/163.0 uW (<= 169.2), gain 77.29/77.10/77.37/77.73/76.42 dB
* (>= 72.71), UGF 82.8/83.5/81.9/82.9/82.4 MHz (>= 66.6), PM 65.0/65.4/64.5/64.7/65.1 deg, GM 10.7-11.2 dB,
* rise settle 10.93/10.76/11.12/11.11/10.79 ns (<= 12.24), fall settle <= 9.9 ns (<= 26.73), rise overshoot
* <= 8.5 %, min saturation margin 84 mV (fs). TT margins: power +5.0 %, gain +6.3 %, UGF +24 %, PM +8.3 %,
* GM +10 %, rise +10.7 %.
* Fails hard_1_gain_ugf (gain 77.29 < 78.4 dB, UGF 82.8 < 89 MHz) and hard_2_settle (rise 10.93 > 7.28 ns).
.subckt dut iref inp inn out
* --- bias: NMOS low-voltage cascode reference (Iref enters vnc): vnb = NMOS source gate, vnc = NMOS cascode gate
R0 iref vnc 1
Rn vnc vnb 13k
XNR3 vnb vnc nr1 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XNR1 nr1 vnb 0 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=2 nf=1 m=1
* --- bias: NMOS copy (Iref/4) into a PMOS low-voltage cascode reference: vpb = PMOS source gate, vpc = PMOS cascode gate
XNS1 vpc vnb 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=2 nf=1 m=1
Rp vpb vpc 34k
XPR3 vpb vpc pr1 vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XPR1 pr1 vpb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=1 nf=1 m=1
* --- stage 1: NMOS input pair folded into PMOS cascodes, NMOS low-voltage cascode mirror load
XNT tail vnb 0 0 sky130_fd_pr__nfet_01v8_lvt W=28 L=2 nf=1 m=1
XNI1 fa inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=0.5 nf=1 m=1
XNI2 fb inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=0.5 nf=1 m=1
XPS1 fa vpb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=1 nf=1 m=4
XPS2 fb vpb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=1 nf=1 m=4
XPC1 o1 vpc fa vdd sky130_fd_pr__pfet_01v8_lvt W=35 L=0.5 nf=1 m=1
XPC2 d1 vpc fb vdd sky130_fd_pr__pfet_01v8_lvt W=35 L=0.5 nf=1 m=1
XNL3 d1 vnc nl1 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XNL1 nl1 d1 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XNL4 o1 vnc nl2 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XNL2 nl2 d1 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1
* --- stage 2: NMOS common source + PMOS current-source load; Miller compensation
XN6 out o1 0 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=0.36 nf=1 m=1
XP7 out vpb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=1 nf=1 m=13
Rz o1 cz 4k
Cc cz out 300f
.ends dut
