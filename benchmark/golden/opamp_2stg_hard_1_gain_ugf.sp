* opamp_2stg, VDD = 1.2 V golden for HARD spec circuits/opamp_2stg/profiles/hard_1_gain_ugf.yaml
* (loop gain >= 78.4 dB at UGF >= 89 MHz, PM >= 60 deg, within the spec.yaml power of 296.4 uW).
* Verified with benchmark/evaluate.py (27 C, same testbench as every other design: unity-gain follower,
* VCM = 0.9 V, Iref = 20 uA, CL = 1 pF) at all five corners tt ff ss sf fs.
* Topology (same as the 1.2 V golden opamp_2stg_1v2.sp; topology change vs the 180 nm source): NMOS-input
* FOLDED CASCODE first stage (single NMOS tail, PMOS folding sources, PMOS cascodes, NMOS low-voltage cascode
* mirror load), NMOS common-source second stage with a PMOS current-source load, Miller Cc + series Rz.
* Why: VCM = 0.9 V at VDD = 1.2 V rules out a PMOS input pair and leaves no room for a telescopic NMOS stack;
* the naive port of the source (5T stage 1 + PMOS CS stage 2, L = 0.36) has far too little gain in Sky130.
* Changes vs opamp_2stg_1v2.sp (gain AND bandwidth at once):
*  - gain: long-L current sources where the output resistance is set: PMOS folding sources and the stage-2
*    load at L = 2 (reference XPR1 also W/L = 20/2 so the mirror ratios stay exact), NMOS mirror cascodes
*    at L = 1 (W = 40). 78.4 -> 82.4 dB.
*  - bandwidth: stage 2 raised to ~140 uA (m = 27) for a higher output pole gm2/CL, short gain device
*    XN6 (W/L = 40/0.36, half the gate area of 40/0.5) so the Rz*C(o1) pole stays high, Cc 520 -> 450 fF
*    (UGF 81 -> 94 MHz), PMOS cascodes W = 70 -> 35 (less capacitance on the folding nodes),
*    Rz = 1.5 kOhm (2 kOhm gave PM 68 but gain margin < 10 dB; 1.2 kOhm gave PM 59).
* Currents: tail 26 uA, folding sources 31 uA each (18 uA per cascode branch), stage 2 140 uA, bias 25 uA.
* Corners (tt/ff/ss/sf/fs): gain 82.39/82.30/82.32/83.13/80.93 dB (>= 78.4), UGF 93.8/94.4/93.0/94.0/93.1 MHz
* (>= 89), PM 64.2/64.7/63.6/63.7/64.3 deg, GM 10.7/10.9/10.5/10.9/10.5 dB, power 271/275/267/267/275 uW
* (<= 296.4), rise/fall settle <= 8.23/6.82 ns, overshoot <= 3.2 %, min saturation margin 87 mV (fs).
* TT margins: gain +5.1 %, UGF +5.3 %, PM +7.0 %, GM +7.0 %, power +8.5 %.
* Fails hard_2_settle (rise 8.07 > 7.28 ns, fall 6.75 > 5.93 ns) and hard_3_lowpower (271 > 169.2 uW).
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
XPR1 pr1 vpb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=2 nf=1 m=1
* --- stage 1: NMOS input pair folded into PMOS cascodes, NMOS low-voltage cascode mirror load
XNT tail vnb 0 0 sky130_fd_pr__nfet_01v8_lvt W=50 L=2 nf=1 m=1
XNI1 fa inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=0.5 nf=1 m=1
XNI2 fb inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=0.5 nf=1 m=1
XPS1 fa vpb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=2 nf=1 m=6
XPS2 fb vpb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=2 nf=1 m=6
XPC1 o1 vpc fa vdd sky130_fd_pr__pfet_01v8_lvt W=35 L=0.5 nf=1 m=1
XPC2 d1 vpc fb vdd sky130_fd_pr__pfet_01v8_lvt W=35 L=0.5 nf=1 m=1
XNL3 d1 vnc nl1 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=1 nf=1 m=1
XNL1 nl1 d1 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XNL4 o1 vnc nl2 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=1 nf=1 m=1
XNL2 nl2 d1 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1
* --- stage 2: NMOS common source + PMOS current-source load; Miller compensation
XN6 out o1 0 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=0.36 nf=1 m=1
XP7 out vpb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=2 nf=1 m=27
Rz o1 cz 1.5k
Cc cz out 450f
.ends dut
