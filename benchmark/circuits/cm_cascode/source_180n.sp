* cm_cascode: DUT extracted from ngspice-180n-testbenches/tb_CM_N_cascode/tb_CM_N_cascode.cir
* Technology: TSMC 0.18 um (tsmc18dN / tsmc18dP, BSIM3), VDD = 1.8 V on global node vdd, ground = 0.
* Ports: in (Iref is forced into it), out (current output).
.subckt CM_N_cascode in out
  MN3 in in net1 net1 tsmc18dN w=6.66u l=360.0n as=2.997e-12 ad=2.997e-12 ps=14.22u pd=14.22u m=1
  MN2 out in net2 net2 tsmc18dN w=6.66u l=360.0n as=2.997e-12 ad=2.997e-12 ps=14.22u pd=14.22u m=1
  MN1 net1 net1 0 0 tsmc18dN w=6.66u l=360.0n as=2.997e-12 ad=2.997e-12 ps=14.22u pd=14.22u m=1
  MN0 net2 net1 0 0 tsmc18dN w=6.66u l=360.0n as=2.997e-12 ad=2.997e-12 ps=14.22u pd=14.22u m=1
.ends CM_N_cascode
.subckt dut in out
XI0 in out CM_N_cascode
.ends dut
