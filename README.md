# HDLBits
This repo contains my personal solutions while working through the problems on
HDLBits as well as some notes on Verilog.

https://hdlbits.01xz.net/


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
* using modules by name or position
* reduction operators
* ternary operators
* casez/casex
* datatypes. integer vs int