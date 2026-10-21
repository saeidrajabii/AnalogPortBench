* ota_5t, hard spec point hard_1_gain (circuits/ota_5t/profiles/hard_1_gain.yaml), VDD = 1.2 V
* Topology change: single-stage, single-ended telescopic OTA = the PMOS-input 5T of ota_5t_1v2.sp with a PMOS cascode on
* each input device and a low-voltage NMOS cascode mirror load (gain ~ gm * (Rcas,p || Rcas,n) instead of gm * ro/2).
* Bias: Iref -> NMOS diode XNB -> 5 uA PMOS reference XPB -> tail XPT (15 uA) and two 5 uA legs:
*   vbp = 5 uA * RBP (60k, ~0.34 V) on the PMOS cascode gates. The cascodes have their bulk at their source and the same
*   current density as the input devices, so the input Vsd = VCM - vbp + (VSG,in - VSG,cas) ~ 0.2 V at every corner
*   (a diode-based bias would move with the 0.3 V spread of the LVT PMOS threshold over the corners);
*   rn = VGS(XNBN) + 5 uA * RBN (36k) on the NMOS cascode gates: the mirror bottoms sit at Vds 0.17-0.18 V.
* Why these sizes: at VDD = 1.2 V with the inputs at 0.5 V the stack is tight at two corners:
*   sf (in these models: high PMOS |Vth|, low NMOS Vth): VSG,in ~ 0.59 V leaves the tail 0.11 V -> tail W/L 600 at L = 2 (Vdsat
*     0.052 V) and input W/L 120 (W=240 L=2);
*   fs: input + PMOS cascode share only 0.5 + VSG,in - Vout ~ 0.35 V -> NMOS mirror bottoms W/L 160 (W=80 L=0.5) pull
*     Vout (= VGS of the bottoms) down to 0.47 V.
*   Phase margin: the PMOS cascode source node is the main non-dominant pole; cascode W=48 L=0.6 (W/L 80, small Cgs)
*     instead of 80/1 raised PM from 57 to 66 deg at the cost of ~1 dB.
* Corners (tt ff ss sf fs): gain 54.93 / 53.37 / 56.02 / 56.60 / 48.29 dB (limit 48), UGB 19.6 / 20.2 / 18.8 / 17.9 /
* 20.2 MHz (limit 16.16), PM 64.5 / 63.9 / 65.0 / 65.3 / 63.8 deg (limit 60), power 61.2 / 62.7 / 59.7 / 58.7 / 63.3 uW
* (limit 66); no device in triode; min saturation margin 127 / 125 / 110 / 59 (tail, sf) / 73 mV.
* TT margins: gain +14 %, UGB +21 %, PM +7.5 %, power +7.2 %. Gate area ~6,000 um^2. Worst corner for gain is fs (the
* squeezed input/cascode Vsd lowers the PMOS-side output resistance).
.subckt dut iref inp inn out
XNB iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=2 nf=1 m=4
XNB2 pb iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=2 nf=1 m=1
XPB pb pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=100 L=2 nf=1 m=4
XPT tail pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=75 L=2 nf=1 m=16
XPB3 vbp pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=100 L=2 nf=1 m=4
RBP vbp 0 60k
XPB4 rn pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=100 L=2 nf=1 m=4
RBN rn vbn 36k
XNBN vbn vbn 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
XPI1 d1 inp tail tail sky130_fd_pr__pfet_01v8_lvt W=240 L=2 nf=1 m=1
XPI2 d2 inn tail tail sky130_fd_pr__pfet_01v8_lvt W=240 L=2 nf=1 m=1
XPC1 nd vbp d1 d1 sky130_fd_pr__pfet_01v8_lvt W=40 L=0.5 nf=1 m=1
XPC2 out vbp d2 d2 sky130_fd_pr__pfet_01v8_lvt W=40 L=0.5 nf=1 m=1
XNC1 nd rn a1 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
XNC2 out rn a2 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
XNL1 a1 nd 0 0 sky130_fd_pr__nfet_01v8_lvt W=80 L=0.5 nf=1 m=1
XNL2 a2 nd 0 0 sky130_fd_pr__nfet_01v8_lvt W=80 L=0.5 nf=1 m=1
.ends dut
