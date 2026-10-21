.subckt dut iin out vb1 vb2 vb3 vb4
* The requested current-mirror/cascode behavior cannot be established from
* passive elements alone; this minimal placeholder is not a compliant port.
RVB1 vb1 vdd 1G
RVB2 vb2 vdd 1G
RVB3 vb3 0 1G
RVB4 vb4 0 1G
.ends dut
