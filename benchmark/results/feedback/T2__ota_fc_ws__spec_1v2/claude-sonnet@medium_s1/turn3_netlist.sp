.subckt dut iref inp inn out
* bias generation
Xb1 iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=0.5 nf=1 m=1
Xb2 pb iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=0.5 nf=1 m=1
Xp0 pb pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=32 L=1 nf=1 m=1
Xp1 vcp pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=32 L=1 nf=1 m=1
Rcp vcp 0 17k
Xp2 vcn pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=32 L=1 nf=1 m=1
Xn2 vcn vcn 0 0 sky130_fd_pr__nfet_01v8_lvt W=1.5 L=0.5 nf=1 m=1
* tail and input pair
Xt tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=16 L=0.5 nf=1 m=1
Xinl fa inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=0.5 nf=1 m=1
Xinr fb inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=0.5 nf=1 m=1
* pmos current sources and cascodes
Xpa fa pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=32 L=1 nf=1 m=2
Xpb fb pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=32 L=1 nf=1 m=2
Xpca a vcp fa vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=0.5 nf=1 m=4
Xpcb out vcp fb vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=0.5 nf=1 m=4
* wide-swing nfet cascode mirror load
Xmc1 a vcn b 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=0.5 nf=1 m=1
Xm1 b a 0 0 sky130_fd_pr__nfet_01v8_lvt W=24 L=1 nf=1 m=1
Xmc2 out vcn c 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=0.5 nf=1 m=1
Xm2 c a 0 0 sky130_fd_pr__nfet_01v8_lvt W=24 L=1 nf=1 m=1
.ends dut
