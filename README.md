# HDLBits
This repo contains my personal solutions to to HDLBits as well
as some notes on Verilog


## Blocking vs. Non-Blocking Assignment

There are three types of assignments in Verilog:

* **Continuous** assignments (assign x = y;). Can only be used when **not** inside a procedure ("always block").
* Procedural **blocking** assignment: (x = y;). Can only be used inside a procedure.
* Procedural **non-blocking** assignment: (x <= y;). Can only be used inside a procedure.

## TODO

* Notes on concatenation
* Notes on wire vs reg
* Notes on using modules by name or position
* Notes on creating a module
