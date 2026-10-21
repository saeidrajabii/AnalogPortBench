* opamp_2stg: DUT extracted from ngspice-180n-testbenches/tb_Opamp_2stg_stb/tb_Opamp_2stg_stb.cir
* Technology: TSMC 0.18 um (tsmc18dN / tsmc18dP, BSIM3), VDD = 1.8 V on global node vdd, ground = 0.
* Ports: iref (20 uA bias current in), inp, inn, out.
.subckt Cascode_Bias Iin Vbias_1 Vbias_2 Vbias_3 Vbias_4
  MN1 Vbias_4 Vbias_4 0 0 tsmc18dN w=6.66u l=360.0n as=2.997e-12 ad=2.997e-12 ps=14.22u pd=14.22u m=1
  MN0 net4 Vbias_4 0 0 tsmc18dN w=6.66u l=360.0n as=2.997e-12 ad=2.997e-12 ps=14.22u pd=14.22u m=1
  MN3 Vbias_3 Vbias_3 Vbias_4 0 tsmc18dN w=6.66u l=360.0n as=2.997e-12 ad=2.997e-12 ps=14.22u pd=14.22u m=1
  MN2 Vbias_2 Vbias_3 net4 0 tsmc18dN w=6.66u l=360.0n as=2.997e-12 ad=2.997e-12 ps=14.22u pd=14.22u m=1
  MP1 Vbias_1 Vbias_1 vdd vdd tsmc18dP w=12.195u l=360.0n as=5.48775e-12 ad=5.48775e-12 ps=25.29u pd=25.29u m=1
  MP0 Vbias_2 Vbias_2 Vbias_1 vdd tsmc18dP w=12.195u l=360.0n as=5.48775e-12 ad=5.48775e-12 ps=25.29u pd=25.29u m=1
  RR0 Iin Vbias_3 1
.ends Cascode_Bias
.subckt Opamp_2stg Vbias_3 Vbias_4 vm vout vp
  CC0 net012 vout 500f m=1
  RR0 net08 net012 3k m=1
  MP2 vout net08 vdd vdd tsmc18dP w=12.195u l=360.0n as=5.48775e-12 ad=5.48775e-12 ps=25.29u pd=25.29u m=3
  MP0 net08 net9 vdd vdd tsmc18dP w=12.195u l=360.0n as=5.48775e-12 ad=5.48775e-12 ps=25.29u pd=25.29u m=1
  MP1 net9 net9 vdd vdd tsmc18dP w=12.195u l=360.0n as=5.48775e-12 ad=5.48775e-12 ps=25.29u pd=25.29u m=1
  MN5 vout Vbias_3 net1 0 tsmc18dN w=6.66u l=360.0n as=2.997e-12 ad=2.997e-12 ps=14.22u pd=14.22u m=3
  MN4 net1 Vbias_4 0 0 tsmc18dN w=6.66u l=360.0n as=2.997e-12 ad=2.997e-12 ps=14.22u pd=14.22u m=3
  MN2 net9 vm net10 0 tsmc18dN w=6.66u l=360.0n as=2.997e-12 ad=2.997e-12 ps=14.22u pd=14.22u m=1
  MN1 net08 vp net10 0 tsmc18dN w=6.66u l=360.0n as=2.997e-12 ad=2.997e-12 ps=14.22u pd=14.22u m=1
  MN3 net12 Vbias_4 0 0 tsmc18dN w=6.66u l=360.0n as=2.997e-12 ad=2.997e-12 ps=14.22u pd=14.22u m=2
  MN0 net10 Vbias_3 net12 0 tsmc18dN w=6.66u l=360.0n as=2.997e-12 ad=2.997e-12 ps=14.22u pd=14.22u m=2
.ends Opamp_2stg
.subckt dut iref inp inn out
XI0 iref vb1 vb2 vb3 vb4 Cascode_Bias
XI1 vb3 vb4 inn out inp Opamp_2stg
.ends dut
