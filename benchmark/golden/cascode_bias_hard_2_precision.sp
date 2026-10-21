* cascode_bias, hard spec point hard_2_precision (circuits/cascode_bias/profiles/hard_2_precision.yaml), VDD = 1.2 V
* Topology: same as cascode_bias_1v2.sp (self-biased LV-cascode references on both sides, cascoded NMOS copy feeding the
* PMOS reference, NMOS LV-cascode sink, PMOS LV-cascode source); only sizes and the two resistors change.
* Why (most accurate currents, flattest output at 0.9 V): the 1v2 golden's errors (+0.2 % sink, -0.24 % source at sf)
* come from the bottom devices sitting near the weak-inversion saturation edge (Vds 0.13-0.15 V), where a few mV of
* reference/output Vds difference (set by the different cascode Vds) changes the current. Fixes:
*   NMOS: R1 7.5k -> 12k puts the bottoms at Vds = 0.20 V (exp(-Vds/Vt) term < 0.05 %), L 2 -> 4 at W/L 200
*     (W=100 L=4 m=8) lowers gds; reference and output bottoms then differ by 2 mV -> Isink +0.05 %;
*   PMOS: L 2 -> 8 at W/L 200 (W=100 L=8 m=16) for the mirror and the cascodes: at Vo = 0.9 V the output cascode sees
*     Vsd 0.15 V while the reference cascode sees 0.20-0.47 V over the corners; with L = 8 the bottom drains then stay
*     within 1 mV (Isource -0.01..-0.04 %). R2 = 9.5k splits the 0.3 V PMOS headroom 0.153 / 0.148 V.
*   Moderate inversion (W/L 200 instead of 800) keeps VSG large enough that the self-biased PMOS reference cascode
*     stays in saturation at fs (its Vsd = VSG(bottom) - Vsd(bottom)).
* Cost: matched range 0.99 V instead of 1.02 V (bottoms 0.2 V above ground); gate area 70,400 um^2.
* Results (tt ff ss sf fs): Isink +0.05 % at every corner, Isource -0.03 / -0.02 / -0.04 / -0.04 / -0.01 % (limit 0.06);
* mismatch at 0.9 V -15.8 / -13.5 / -17.8 / -19.3 / -10.6 nA (limit 22); range 0.99 / 0.98 / 0.99 / 0.99 / 0.98 V
* (limit 0.94); no device in triode; min saturation margin 73 / 69 / 77 / 79 / 66 mV.
* TT margins: Isink +17 %, Isource +50 %, mismatch +28 %, range +5.3 %.
.subckt dut iin out vb1 vb2 vb3 vb4
R0 iin vb3 1
R1 vb3 vb4 12k
XN3 vb4 vb3 n1 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=4 nf=1 m=8
XN1 n1 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=4 nf=1 m=8
XN5 vb2 vb3 n2 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=4 nf=1 m=8
XN4 n2 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=4 nf=1 m=8
R2 vb1 vb2 9.5k
XP3 vb1 vb2 p1 vdd sky130_fd_pr__pfet_01v8_lvt W=100 L=8 nf=1 m=16
XP1 p1 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=100 L=8 nf=1 m=16
XN0 nsrc vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=4 nf=1 m=8
XN2 out vb3 nsrc 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=4 nf=1 m=8
XP1O psrc vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=100 L=8 nf=1 m=16
XP0O out vb2 psrc vdd sky130_fd_pr__pfet_01v8_lvt W=100 L=8 nf=1 m=16
.ends dut
