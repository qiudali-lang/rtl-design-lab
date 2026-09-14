* CMOS inverter transient smoke test.
.include models.inc
.include cells.sp
VDD VDD 0 1.0
VIN A 0 PULSE(0 1 0 20p 20p 2n 4n)
XINV A Y VDD 0 INV
CLOAD Y 0 20f
.tran 5p 12n
.measure tran TPHL trig v(A) val=0.5 rise=1 targ v(Y) val=0.5 fall=1
.measure tran TPLH trig v(A) val=0.5 fall=1 targ v(Y) val=0.5 rise=1
.end

