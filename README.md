# HDLBits
This repo contains my personal
solutions
while working through the [problems on
HDLBits](https://hdlbits.01xz.net/wiki/Problem_sets) as well as some notes on
Verilog. ([see my stats](https://hdlbits.01xz.net/wiki/Special:VlgStats/5CBCEE65CFD17EBB))

## Blocking vs. Non-Blocking Assignment

There are three types of assignments in Verilog:

* **Continuous** assignments (assign x = y;). Can only be used when **not**
  inside a procedure ("always block").
* Procedural **blocking** assignment: (x = y;). Can only be used inside a
  procedure.
* Procedural **non-blocking** assignment: (x <= y;). Can only be used inside a
  procedure.

## Avoid creating latches
* See 32-AlwaysIf2
* https://hdlbits.01xz.net/wiki/Always_if2
* "Watch out for Warning (10240): ... inferring latch(es)" messages. Unless the
  latch was intentional, it almost always indicates a bug"



## TODO
Expand notes on...
* creating variables
* concatenation & sign extension
* wire vs reg
* creating a module
* out vs reg module types
* using modules by name or position
* reduction operators
* ternary operators
* casez/casex
* datatypes. integer vs int
* ++ operator (allowed in loop controls, but not everywhere. 4o claimed it
  should not be used on signals that are part of the design's interface (e.g.,
  output signals) as it can lead to synthesis issues.)
* generate blocks
* types of always blocks
  * always @(*) and always_comb are equivalent in SystemVerilog but always_comb is preferred per H&H
* Verilog vs SystemVerilog

## Resources & Further Reading
[HDLBits course on Verilog](https://hdlbits.01xz.net/wiki/)

[Digital Design and Computer Architecture: RISC-V Edition by David Harris and Sarah L. Harris](https://pages.hmc.edu/harris/ddca/ddcarv.html)

[Introduction to Computing Systems by Yale N. Patt and Sanjay J. Patel](https://www.amazon.com/Introduction-Computing-Systems-Gates-Beyond/dp/0072467509)

[Introduction to VLSI Systems by Lynn Conway and Carver Mead](https://www.amazon.com/Introduction-VLSI-Systems-Carver-Mead/dp/0201043580)

[tilk.ue's Verilog circuit viewer](https://digitaljs.tilk.eu/)

[IEEE Standard for SystemVerilog 1800-2009](https://www.google.com/search?q=1800-2009+pdf+-site%3Aieee.org)

[PicoRV32 - A Size-Optimized RISC-V CPU in Verilog](https://github.com/YosysHQ/picorv32)
