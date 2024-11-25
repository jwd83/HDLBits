# HDLBits
This repo contains my personal solutions to to HDLBits as well
as some notes on Verilog


## Blocking vs. Non-Blocking Assignment

There are three types of assignments in Verilog:

* **Continuous** assignments (assign x = y;). Can only be used when **not** inside a procedure ("always block").
* Procedural **blocking** assignment: (x = y;). Can only be used inside a procedure.
* Procedural **non-blocking** assignment: (x <= y;). Can only be used inside a procedure.

## Avoid creating latches
* See 32-AlwaysIf2
* https://hdlbits.01xz.net/wiki/Always_if2
* "Watch out for Warning (10240): ... inferring latch(es)" messages. Unless the latch was intentional, it almost always indicates a bug"



## TODO

* Notes on concatenation
* Notes on wire vs reg
* Notes on creating a module
* Notes on using modules by name or position
* Notes on sign extension
