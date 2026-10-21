* ota_fc_ws, VDD = 1.2 V (VCM = 0.6 V)
* Verified with benchmark/evaluate.py --vdd 1.2 (TT, 27 C, spec.yaml unchanged); passes at tt ff ss sf fs.
* Design (topology change): two stages. Stage 1 is a symmetrical (current-mirror) OTA: NMOS input pair with a single
* NMOS tail, PMOS diode loads mirrored 1:1 to the output node and, through an NMOS mirror, back to it. Stage 2 is an NMOS
* common source with a PMOS current-source load, Miller-compensated with Rz + Cc. Simple NMOS/PMOS mirrors from Iref.
* Why the advisor's folded cascode cannot be kept at 1.2 V:
*  - swing: its output must stay inside NMOS sink + cascode at the bottom and PMOS source + cascode at the top, about
*    0.3 V wide at 1.2 V (spec 0.82 V); only a common-source output stage swings ~0.85 V.
*  - VCM = 0.6 V: NMOS input Vgs ~0.46 V leaves ~0.14 V for the tail, so the cascoded tail must go (single sink,
*    input pair in weak inversion, W = 160 per 18 uA).
*  - the output device must be NMOS: a PMOS common source fast enough for PM (L <= 0.75) has Vdsat ~0.2 V and kills
*    the swing; Sky130 PMOS |Vth| also moves +-0.13 V across corners against +-0.03 V for NMOS. The symmetrical first
*    stage puts its output at an NMOS Vgs, so the NMOS common source is a ratioed copy of the NMOS mirror and the
*    open-loop output sits mid-rail at every corner.
*  - Overshoot (was 12.5..14.4 % on the rise step): the rising edge starts from VCM - 0.1 V and slews; the PMOS
*    diode nodes x/y (input-pair drains) starve and recover slowly, and the x/y pole sat at ~70..90 MHz against a
*    ~51 MHz UGB (PM 60..64 deg). The input-pair drain capacitance (overlap + gate-edge junction, ~W) sets that pole,
*    so the pair keeps W = 160 (needed for headroom, below) but is drawn with nf = 4 (shared drains), and the
*    Miller zero is moved down: Rz 1.5k -> 2.2k, Cc 1.2p -> 1.3p (zero ~1/(Cc(Rz - 1/gm7)) ~ 70 MHz), giving
*    PM 72..75 deg and rise overshoot <= 9.1 %, fall 0 %.
*  - Tail saturation (was 45 mV at fs): at VCM = 0.6 V the tail Vds is 0.6 V - Vgs(input) ~0.115 V at fs/ss.
*    The input needs W/L >= 160 at L >= 1 (Sky130 LVT Vth rises at short L: W=80 L=0.5 costs +26 mV of Vgs),
*    so the margin comes from the tail device: XMT 80 -> 160 (and XMB 40 -> 80, XMBP 20 -> 40, same currents)
*    lowers its weak-inversion Vdsat from 70 to ~58 mV: tail margin >= 57 mV at every corner.
*  - Swing (was +2.7 % at fs): output PMOS M8 W 400 -> 720 (MPB 40 -> 72, same 100 uA) lowers its Vdsat,
*    upper swing limit +15 mV: swing margin >= +5.5 % at every corner.
*   corner   gain dB  UGB MHz  PM deg  OS rise/fall %   swing V  min sat mV  power uW
*   tt       61.9     58.0     74.0    7.3 / 0          0.879    80          252
*   ff       61.8     61.1     74.1    5.7 / 0          0.871    98          260
*   ss       62.0     54.8     73.6    9.1 / 0          0.882    62          243
*   sf       61.3     58.5     75.1    8.2 / 0          0.887    103         248
*   fs       62.2     56.4     72.3    7.7 / 0          0.867    57          255
.subckt dut iref inp inn out
XMB iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=80 L=1 nf=1 ad=23.2 as=23.2 pd=160.6 ps=160.6 m=1
XMT tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=160 L=1 nf=1 ad=46.4 as=46.4 pd=320.6 ps=320.6 m=1
XMBP pb iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=1 nf=1 ad=11.6 as=11.6 pd=80.58 ps=80.58 m=1
XMPB pb pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=72 L=1 nf=1 ad=20.88 as=20.88 pd=144.58 ps=144.58 m=1
XM1 y inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=160 L=1 nf=4 ad=23.2 as=34.8 pd=1.16 ps=81.74 m=1
XM2 x inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=160 L=1 nf=4 ad=23.2 as=34.8 pd=1.16 ps=81.74 m=1
XMPY y y vdd vdd sky130_fd_pr__pfet_01v8_lvt W=15 L=0.75 nf=1 ad=4.35 as=4.35 pd=30.58 ps=30.58 m=1
XMPX x x vdd vdd sky130_fd_pr__pfet_01v8_lvt W=15 L=0.75 nf=1 ad=4.35 as=4.35 pd=30.58 ps=30.58 m=1
XMPY2 nd y vdd vdd sky130_fd_pr__pfet_01v8_lvt W=15 L=0.75 nf=1 ad=4.35 as=4.35 pd=30.58 ps=30.58 m=1
XMPX2 o1 x vdd vdd sky130_fd_pr__pfet_01v8_lvt W=15 L=0.75 nf=1 ad=4.35 as=4.35 pd=30.58 ps=30.58 m=1
XMN1 nd nd 0 0 sky130_fd_pr__nfet_01v8_lvt W=28 L=0.35 nf=1 ad=8.12 as=8.12 pd=56.58 ps=56.58 m=1
XMN2 o1 nd 0 0 sky130_fd_pr__nfet_01v8_lvt W=28 L=0.35 nf=1 ad=8.12 as=8.12 pd=56.58 ps=56.58 m=1
XM7 out o1 0 0 sky130_fd_pr__nfet_01v8_lvt W=154 L=0.35 nf=1 ad=44.66 as=44.66 pd=308.6 ps=308.6 m=1
XM8 out pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=720 L=1 nf=1 ad=208.8 as=208.8 pd=1440.6 ps=1440.6 m=1
Rz o1 cz 2.2k
Cc cz out 1.3p
.ends dut
