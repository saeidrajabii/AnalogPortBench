* cascode_bias: DUT extracted from ngspice-180n-testbenches/tb_Cascode_Bias/tb_Cascode_Bias.cir
* Technology: TSMC 0.18 um (tsmc18dN / tsmc18dP, BSIM3), VDD = 1.8 V on global node vdd, ground = 0.
* Ports: iin (Iref in), out (node between the PMOS cascode source and NMOS cascode sink), vb1..vb4.
* NOTE: in this testbench MN3/MN2 inside Cascode_Bias have source-tied bulks; the copies inside the
* OTA testbenches tie them to 0 (see AUDIT.md).
.subckt Cascode_Bias Iin Vbias_1 Vbias_2 Vbias_3 Vbias_4
  MN1 Vbias_4 Vbias_4 0 0 tsmc18dN w=6.66u l=360.0n as=2.997e-12 ad=2.997e-12 ps=14.22u pd=14.22u m=1
  MN0 net4 Vbias_4 0 0 tsmc18dN w=6.66u l=360.0n as=2.997e-12 ad=2.997e-12 ps=14.22u pd=14.22u m=1
  MN3 Vbias_3 Vbias_3 Vbias_4 Vbias_4 tsmc18dN w=6.66u l=360.0n as=2.997e-12 ad=2.997e-12 ps=14.22u pd=14.22u m=1
  MN2 Vbias_2 Vbias_3 net4 net4 tsmc18dN w=6.66u l=360.0n as=2.997e-12 ad=2.997e-12 ps=14.22u pd=14.22u m=1
  MP1 Vbias_1 Vbias_1 vdd vdd tsmc18dP w=12.195u l=360.0n as=5.48775e-12 ad=5.48775e-12 ps=25.29u pd=25.29u m=1
  MP0 Vbias_2 Vbias_2 Vbias_1 vdd tsmc18dP w=12.195u l=360.0n as=5.48775e-12 ad=5.48775e-12 ps=25.29u pd=25.29u m=1
  RR0 Iin Vbias_3 1
.ends Cascode_Bias
.subckt dut iin out vb1 vb2 vb3 vb4
XI0 iin vb1 vb2 vb3 vb4 Cascode_Bias
MN0 nsrc vb4 0 0 tsmc18dN w=6.66u l=360.0n as=2.997e-12 ad=2.997e-12 ps=14.22u pd=14.22u m=1
MN2 out vb3 nsrc 0 tsmc18dN w=6.66u l=360.0n as=2.997e-12 ad=2.997e-12 ps=14.22u pd=14.22u m=1
MP1 psrc vb1 vdd vdd tsmc18dP w=12.195u l=360.0n as=5.48775e-12 ad=5.48775e-12 ps=25.29u pd=25.29u m=1
MP0 out vb2 psrc vdd tsmc18dP w=12.195u l=360.0n as=5.48775e-12 ad=5.48775e-12 ps=25.29u pd=25.29u m=1
.ends dut
