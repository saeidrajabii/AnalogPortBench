* opamp_2stg, VDD = 1.2 V golden for HARD spec circuits/opamp_2stg/profiles/hard_2_settle.yaml
* (1 % settling: rise <= 7.28 ns, fall <= 5.93 ns, within the spec.yaml power of 296.4 uW).
* Verified with benchmark/evaluate.py (27 C, same testbench as every other design: unity-gain follower,
* VCM = 0.9 V, Iref = 20 uA, CL = 1 pF) at all five corners tt ff ss sf fs.
* Topology (same as the 1.2 V golden opamp_2stg_1v2.sp; topology change vs the 180 nm source): NMOS-input
* FOLDED CASCODE first stage (single NMOS tail, PMOS folding sources, PMOS cascodes, NMOS low-voltage cascode
* mirror load), NMOS common-source second stage with a PMOS current-source load, Miller Cc + series Rz.
* Why: VCM = 0.9 V at VDD = 1.2 V rules out a PMOS input pair and leaves no room for a telescopic NMOS stack.
* Settling is set by (a) UGF and PM of the small-signal loop and (b) the rising edge, where the class-A
* output only has the PMOS load current to charge CL + Cc and gm2 drops while N6 turns down (rising-edge
* overshoot). Changes vs opamp_2stg_1v2.sp:
*  - UGF 81 -> 120 MHz: tail 26 -> 33 uA, Cc 520 -> 400 fF, input pair W = 20 (moderate inversion: more
*    slew current per unit gm1, Itail/Cc = 82 V/us).
*  - non-dominant poles: stage 2 ~133 uA (m = 29 of W/L = 20/2; the long load also gives back the gain lost
*    elsewhere, 77.9 dB), short gain device XN6 W/L = 40/0.36, short PMOS cascodes W/L = 35/0.35 (one third of
*    the 70/0.5 gate area on the folding nodes), folding sources 36 uA each, NMOS mirror cascodes W/L = 40/1;
*    Rz = 1.6 kOhm (1.5 k: PM 62.9 and rise 7.0 ns; 1.7 k: GM only 10.1 dB at ss).
*  - XP7 (L = 2) mirrors the L = 1 reference XPR1: the ratio is not exact (~4.6 uA per unit instead of 5.2),
*    but it tracks at all five corners (power 277-281 uW).
* Currents: tail 33 uA, folding sources 36 uA each (~20 uA per cascode branch), stage 2 133 uA, bias 25 uA.
* Corners (tt/ff/ss/sf/fs): rise settle 6.91/6.95/6.84/6.82/6.96 ns (<= 7.28), fall 5.63/5.50/5.80/5.75/5.53 ns
* (<= 5.93), gain 77.89/77.76/77.86/78.61/76.53 dB, UGF 119.5-121.0 MHz, PM 63.8-64.4 deg, GM 10.5-11.3 dB,
* power 278.0/277.6/279.1/280.7/277.1 uW (<= 296.4), rise overshoot <= 9.2 % (fall 0 %), min saturation
* margin 84 mV (fs). TT margins: rise +5.1 %, fall +5.1 %, PM +6.8 %, GM +9.0 %, gain +7.1 %, power +6.2 %.
* Fails hard_1_gain_ugf (gain 77.89 < 78.4 dB) and hard_3_lowpower (278 > 169.2 uW).
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
XNT tail vnb 0 0 sky130_fd_pr__nfet_01v8_lvt W=64 L=2 nf=1 m=1
XNI1 fa inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XNI2 fb inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XPS1 fa vpb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=1 nf=1 m=7
XPS2 fb vpb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=1 nf=1 m=7
XPC1 o1 vpc fa vdd sky130_fd_pr__pfet_01v8_lvt W=35 L=0.35 nf=1 m=1
XPC2 d1 vpc fb vdd sky130_fd_pr__pfet_01v8_lvt W=35 L=0.35 nf=1 m=1
XNL3 d1 vnc nl1 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=1 nf=1 m=1
XNL1 nl1 d1 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XNL4 o1 vnc nl2 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=1 nf=1 m=1
XNL2 nl2 d1 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1
* --- stage 2: NMOS common source + PMOS current-source load; Miller compensation
XN6 out o1 0 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=0.36 nf=1 m=1
XP7 out vpb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=2 nf=1 m=29
Rz o1 cz 1.6k
Cc cz out 400f
.ends dut
