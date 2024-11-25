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

## Resources
[tilk.ue's Verilog circuit viewer](https://digitaljs.tilk.eu/)

[IEEE Standard for SystemVerilog 1800-2009](https://www.google.com/search?q=1800-2009+pdf+-site%3Aieee.org)