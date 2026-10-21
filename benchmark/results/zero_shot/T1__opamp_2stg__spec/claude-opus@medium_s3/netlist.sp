* Cascode bias generator. The 20 uA reference flows into the drain of a
* stack of three diode-connected NFETs (it never enters a source):
*   vb4 = VGS1, vb3 = VGS1 + VGS2, vcn = vb3 + VGS3
* A 5 uA mirror branch into a narrow PMOS diode generates vcp.
.subckt Cascode_Bias iref vb4 vb3 vcn vcp
XMD3 iref iref vb3 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=2
XMD2 vb3 vb3 vb4 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=0.5 nf=1 m=4
XMD1 vb4 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=0.5 nf=1 m=4
XMB vcp vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=0.5 nf=1 m=1
XPB vcp vcp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=0.6 L=0.75 nf=1 m=1
.ends Cascode_Bias

* Two-stage op-amp. Stage 1: telescopic NMOS input pair with NMOS cascodes
* and a low-voltage PMOS cascode mirror. Stage 2: PMOS common-source stage
* with a cascoded NMOS current sink. Miller compensation with a nulling resistor.
.subckt Opamp_2stg vb4 vb3 vcn vcp vm vout vp
* tail current source, 40 uA
XT tail vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=0.5 nf=1 m=8
* input pair
XIN1 dx vm tail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XIN2 dy vp tail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
* NMOS cascodes
XC1 x vcn dx 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=2
XC2 y vcn dy 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=2
* PMOS low-voltage cascode mirror
XPC1 x vcp sx vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XPC2 y vcp sy vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XPA1 sx x vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XPA2 sy x vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=0.5 nf=1 m=1
* second stage, 95 uA
XP2 vout y vdd vdd sky130_fd_pr__pfet_01v8_lvt W=16 L=0.35 nf=1 m=4
XN5 vout vb3 n1 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=0.5 nf=1 m=19
XN4 n1 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=0.5 nf=1 m=19
* compensation
RC y cz 3.2k
CC cz vout 0.6p
.ends Opamp_2stg

.subckt dut iref inp inn out
XI0 iref vb4 vb3 vcn vcp Cascode_Bias
XI1 vb4 vb3 vcn vcp inn out inp Opamp_2stg
.ends dut
