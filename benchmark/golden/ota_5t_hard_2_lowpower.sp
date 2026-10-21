* ota_5t, hard spec point hard_2_lowpower (circuits/ota_5t/profiles/hard_2_lowpower.yaml), VDD = 1.2 V
* Topology: 5-transistor OTA with NMOS input (as the 180 nm source) and a PMOS mirror load, but the cascode bias generator
* is removed: the tail is a plain 1:2 mirror of the Iref diode (XNB W/L 800, XNT W/L 400 -> 9.2 uA).
* Why: the power floor is VDD * Iref = 24 uW (Iref is drawn from the supply); every other uA costs 1.2 uW. The source's
* cascode bias generator and the PMOS reference leg of ota_5t_1v2.sp (5 uA) are dropped, and the tail current goes into
* the input pair with the best gm/Id: the Sky130 LVT NMOS pair reaches gm/Id ~ 21 /V where the LVT PMOS pair of the
* 1v2 golden reaches ~ 15-16 /V (measured from UGB = gm/(2 pi CL)), so 9.2 uA gives 17 MHz.
* Headroom: the 1v2 golden avoided NMOS inputs because the tail sits at Vds = 0.5 - VGS(in). Here the input (W/L 600,
* W=150 L=0.5 m=2) and the tail (W/L 400 at 9 uA, Vdsat 0.039 V) are in deep weak inversion: tail Vds >= 0.094 V
* (fs) -> margin >= 56 mV. The Iref diode runs at the same current density as the tail (W/L 800 at 20 uA) so the mirror
* ratio holds with Vds 0.1 vs 0.35 V. The input L = 0.5 (not 1-2) keeps its gate area (and the tail-node capacitance
* that cost 20 deg of PM with W/L 400 at L = 1) small; the PMOS load W=20 L=1 keeps the mirror pole above 3x UGB.
* Accepted trade: DC gain 32.3 dB (the hard point asks >= 30 dB, below the 31.47 dB of spec.yaml).
* Corners (tt ff ss sf fs): gain 32.33 / 32.32 / 32.19 / 31.66 / 32.35 dB (limit 30), UGB 17.0 / 17.3 / 16.7 / 17.4 /
* 16.5 MHz (limit 16.16), PM 69.5 / 69.7 / 69.1 / 70.7 / 67.9 deg (limit 60), power 35.01 / 35.20 / 34.80 / 35.26 /
* 34.72 uW (limit 37.0); no device in triode; min saturation margin 82 / 102 / 61 / 108 / 56 mV (tail).
* TT margins: power +5.4 %, UGB +5.2 %, gain +7.8 %, PM +16 %. Gate area ~5,100 um^2.
.subckt dut iref inp inn out
XNB iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=2 nf=1 m=16
XNT tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=2 nf=1 m=8
XNI1 nd inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=150 L=0.5 nf=1 m=2
XNI2 out inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=150 L=0.5 nf=1 m=2
XPL1 nd nd vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1 nf=1 m=1
XPL2 out nd vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1 nf=1 m=1
.ends dut
