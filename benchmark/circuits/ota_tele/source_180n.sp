* ota_tele: single-ended telescopic cascode OTA (new circuit, not from ngspice-180n-testbenches)
* Source design written for this benchmark; pending review by a designer.
* Technology: TSMC 0.18 um (tsmc18dN / tsmc18dP, BSIM3), VDD = 1.8 V on global node vdd, ground = 0.
* Ports: iref (20 uA bias current in), inp, inn, out. Tail current 40 uA (2 x Iref).
* Stack from vdd to ground: PMOS load, PMOS cascode, NMOS cascode, NMOS input, NMOS tail (5 devices).
.subckt dut iref inp inn out
* --- bias: NMOS reference diode (vbn), NMOS cascode gate vcn (two stacked diodes, ~2 Vgs),
*     PMOS cascode gate vcp (weak PMOS diode fed by an NMOS copy of Iref)
MB1 iref iref 0 0 tsmc18dN w=6.66u l=0.36u m=1
MB2 vcn vcn nb2 0 tsmc18dN w=1.5u l=0.36u m=1
MB3 nb2 nb2 0 0 tsmc18dN w=6.66u l=0.36u m=1
MB4 vcn vcpref vdd vdd tsmc18dP w=12.195u l=0.36u m=1
MB5 vcpref vcpref vdd vdd tsmc18dP w=12.195u l=0.36u m=1
MB6 vcpref iref 0 0 tsmc18dN w=6.66u l=0.36u m=1
MB7 vcp vcp vdd vdd tsmc18dP w=1.2u l=0.36u m=1
MB8 vcp iref 0 0 tsmc18dN w=6.66u l=0.36u m=1
* --- tail
MT tail iref 0 0 tsmc18dN w=6.66u l=0.36u m=2
* --- input pair and NMOS cascodes
M1 x1 inp tail 0 tsmc18dN w=10u l=0.36u m=1
M2 x2 inn tail 0 tsmc18dN w=10u l=0.36u m=1
M3 d1 vcn x1 0 tsmc18dN w=10u l=0.5u m=1
M4 out vcn x2 0 tsmc18dN w=10u l=0.5u m=1
* --- PMOS low-voltage cascode mirror load (diode side at d1)
M5 d1 vcp y1 vdd tsmc18dP w=12.195u l=0.5u m=1
M6 out vcp y2 vdd tsmc18dP w=12.195u l=0.5u m=1
M7 y1 d1 vdd vdd tsmc18dP w=12.195u l=0.5u m=1
M8 y2 d1 vdd vdd tsmc18dP w=12.195u l=0.5u m=1
.ends dut
