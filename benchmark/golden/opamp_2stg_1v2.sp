* opamp_2stg, VDD = 1.2 V
* Verified with benchmark/evaluate.py at all five corners tt ff ss sf fs (27 C, unity-gain follower, VCM = 0.9 V,
* Iref = 20 uA, CL = 1 pF) and with benchmark/golden/audit_golden.py.
* Topology (rev 2, topology change): NMOS-input FOLDED CASCODE first stage (single NMOS tail, PMOS folding sources,
* PMOS cascodes, NMOS low-voltage cascode mirror load), NMOS common-source second stage with a PMOS current-source
* load; Miller Cc = 520 fF with Rz = 2 kOhm.
* Why: VCM = 0.9 V at VDD = 1.2 V rules out a PMOS input (its tail would need 0.9 + Vsg > 1.2 V) and leaves no
* room for a telescopic NMOS stack: rev 1 (NMOS telescopic + PMOS LV-cascode load) passed 1/5 corners with 2-5
* devices in triode (cascode-gate diode stack, input cascodes, PMOS load cascode at -147 mV). Folding puts the
* PMOS sources and cascodes between VDD and the folding node (~0.95 V) and the NMOS mirror below o1 (~0.58 V).
* Bias: Iref -> NMOS LV-cascode reference (vnb, vnc); single NMOS copy at Iref/4 (no cascode: at 1.2 V it had no
* room) -> PMOS LV-cascode reference (vpb, vpc, Rp = 34 kOhm), so the folding sources sit at the reference Vds and
* the folding node tracks the PMOS corner.
* Currents: tail 25 uA, folding sources 30 uA each (17.5 uA per cascode branch), stage 2 95 uA.
* Corners (tt/ff/ss/sf/fs): gain 78.4/78.2/78.5/78.9/77.5 dB (>= 72.71), UGF 81-82 MHz (>= 66.6), PM 68-70 deg,
* GM 13.0-13.5 dB, power 220-227 uW (<= 296.4), rise/fall settle <= 9.8/9.4 ns, overshoot <= 3.9 %,
* min saturation margin 84 mV (PMOS reference cascode at fs). Worst margin: dc gain +6.5 % at fs.
* Gate area ~700 um^2 (rev 1: 2,174).
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
XNT tail vnb 0 0 sky130_fd_pr__nfet_01v8_lvt W=50 L=2 nf=1 m=1
XNI1 fa inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=0.5 nf=1 m=1
XNI2 fb inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=0.5 nf=1 m=1
XPS1 fa vpb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=1 nf=1 m=6
XPS2 fb vpb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=1 nf=1 m=6
XPC1 o1 vpc fa vdd sky130_fd_pr__pfet_01v8_lvt W=70 L=0.5 nf=1 m=1
XPC2 d1 vpc fb vdd sky130_fd_pr__pfet_01v8_lvt W=70 L=0.5 nf=1 m=1
XNL3 d1 vnc nl1 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XNL1 nl1 d1 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XNL4 o1 vnc nl2 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XNL2 nl2 d1 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1
* --- stage 2: NMOS common source + PMOS current-source load; Miller compensation
XN6 out o1 0 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=0.5 nf=1 m=1
XP7 out vpb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=1 nf=1 m=19
Rz o1 cz 2k
Cc cz out 520f
.ends dut
