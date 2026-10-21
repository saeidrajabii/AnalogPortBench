Port the analog circuit below from a TSMC 0.18 µm CMOS process to the SkyWater SKY130 process.
The ported circuit will be simulated in ngspice and must meet the specifications listed below.
You may change device sizes, biasing and circuit topology, as long as the interface and test conditions are kept.

## Source design (TSMC 0.18 µm)
Transistor models: tsmc18dN (NMOS) and tsmc18dP (PMOS), BSIM3. Supply VDD = 1.8 V on the global
node `vdd`; ground is node `0`.

```spice
$SOURCE_NETLIST
```

## Target technology (SKY130)
- Use only the transistors sky130_fd_pr__nfet_01v8_lvt and sky130_fd_pr__pfet_01v8_lvt.
- They are subcircuits. Instantiate them with an X prefix and the terminals in the order drain gate source
  bulk, followed by the parameters W, L, nf and m, each written as name=value and separated by spaces.
- W is the total gate width and L the gate length, both in micrometres, written as plain numbers without
  unit suffixes. Minimum L: 0.15 µm for nfet_01v8_lvt, 0.35 µm for pfet_01v8_lvt. Minimum W: 0.42 µm.
- Always use nf=1. For a wider transistor, increase W, or use m=k to connect k identical transistors in parallel.
- Sky130 W and L are plain numbers in µm; R and C values keep their SI suffixes (e.g. 2p, 10k).
  The m parameter means the same in both netlists.
- Resistors and capacitors may be ideal SPICE R and C elements.
- Supply: VDD = $VDD V on the global node `vdd`; ground is node `0`. Both are available inside every
  subcircuit without being ports.
- The ideal reference current must be mirrored: it may not flow directly into the source of a transistor.
  No element may connect `inp` directly to `out`.
- The testbench includes the model library and provides all sources and analyses. Do not add
  `.lib`, `.include`, `.option`, sources or analysis statements.

## Netlist format example
This example only illustrates the syntax; it is not a suggested design.

```spice
.subckt example a b c
XM1 a b 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=0.5 nf=1 m=1
XM2 a c vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=0.5 nf=1 m=2
.ends example
```

## Interface
The netlist must define the subcircuit `.subckt dut $PORTS`, with exactly these ports in this order.
$PORT_DESCRIPTION

## Test conditions (TT corner, 27 °C)
$TEST_CONDITIONS

## Specifications
$SPEC_NOTE
| Metric | Definition | Requirement | Source design (180 nm, VDD 1.8 V) |
|---|---|---|---|
$SPEC_TABLE

## Output format
Reply with exactly one ```spice code block containing the complete netlist: every .subckt the
design needs, including `dut`. You may add a short explanation outside the code block.
If you conclude that the specifications cannot all be met in SKY130 at this supply, add a line outside the
code block that starts with `INFEASIBLE:` followed by the reason, state the smallest change to the
specifications that would make them achievable, and still give your best design.
