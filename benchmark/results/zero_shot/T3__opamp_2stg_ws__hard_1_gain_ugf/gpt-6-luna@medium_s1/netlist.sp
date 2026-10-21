.subckt Cascode_Bias_WS Iin Vbias_1 Vbias_2 Vbias_3 Vbias_4
.ends Cascode_Bias_WS

.subckt Opamp_2stg Vbias_3 Vbias_4 vm vout vp
  * NMOS differential pair; the input assignment gives positive overall gain.
  XMNINN nleft vm tail 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=1.5 nf=1 m=1
  XMNINP nright vp tail 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=1.5 nf=1 m=1
  XMNTAIL tail Vbias_3 0 0 sky130_fd_pr__nfet_01v8_lvt W=160 L=1.5 nf=1 m=1

  * PMOS mirror load for the first stage.
  XMPD nleft nleft vdd vdd sky130_fd_pr__pfet_01v8_lvt W=80 L=1.5 nf=1 m=1
  XMPM nright nleft vdd vdd sky130_fd_pr__pfet_01v8_lvt W=80 L=1.5 nf=1 m=1

  * Second gain stage and Miller compensation.
  XMN2 vout Vbias_4 0 0 sky130_fd_pr__nfet_01v8_lvt W=120 L=1.5 nf=1 m=1
  XMP2 vout Vbias_2 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=120 L=1.5 nf=1 m=1
  RR0 nright ncomp 470
  CC0 ncomp vout 1.5p
.ends Opamp_2stg

.subckt dut iref inp inn out
  * 20-uA reference sink and NMOS current mirrors.
  XMNREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1.5 nf=1 m=1
  XMNTAIL tailbias iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=160 L=1.5 nf=1 m=1
  XMNOUT outbias iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=120 L=1.5 nf=1 m=1

  * PMOS bias reference and mirrored loads.
  XMNBIAS pbias iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1.5 nf=1 m=1
  XMPREF pbias pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1.5 nf=1 m=1
  XMPLOAD1 nleft pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=80 L=1.5 nf=1 m=1
  XMPLOAD2 nright pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=80 L=1.5 nf=1 m=1
  XMPLOAD3 out pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=120 L=1.5 nf=1 m=1

  * Amplifier stages.
  XMNINN nleft inn tailbias 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=1.5 nf=1 m=1
  XMNINP nright inp tailbias 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=1.5 nf=1 m=1
  XMN2 out nright 0 0 sky130_fd_pr__nfet_01v8_lvt W=120 L=1.5 nf=1 m=1
  RR0 nright ncomp 470
  CC0 ncomp out 1.5p
.ends dut
