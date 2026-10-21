* cm_simple: DUT extracted from ngspice-180n-testbenches/tb_CM_basic/tb_CM_basic.cir
* Technology: TSMC 0.18 um (tsmc18dN / tsmc18dP, BSIM3), VDD = 1.8 V on global node vdd, ground = 0.
* Ports: in (Iref is forced into it), out (current output).
.subckt CM_basic in out
  MN1 in in 0 0 tsmc18dN w=6.66u l=360.0n as=2.997e-12 ad=2.997e-12 ps=14.22u pd=14.22u m=1
  MN0 out in 0 0 tsmc18dN w=6.66u l=360.0n as=2.997e-12 ad=2.997e-12 ps=14.22u pd=14.22u m=1
.ends CM_basic
.subckt dut in out
XI0 in out CM_basic
.ends dut
