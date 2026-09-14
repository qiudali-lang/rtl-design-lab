* Independent portable CMOS cells.

.subckt INV A Y VDD VSS
MP0 Y A VDD VDD PMOS W=1.0u L=0.10u
MN0 Y A VSS VSS NMOS W=0.5u L=0.10u
.ends INV

.subckt TG A Y EN ENB VDD VSS
MP0 Y ENB A VDD PMOS W=1.0u L=0.10u
MN0 Y EN  A VSS NMOS W=0.5u L=0.10u
.ends TG

* Active-high transparent D latch using input and feedback transmission gates.
.subckt DLATCH D Q EN ENB VDD VSS
XTGIN D N1 EN ENB VDD VSS TG
XINV0 N1 QB VDD VSS INV
XINV1 QB Q VDD VSS INV
XTGFB Q N1 ENB EN VDD VSS TG
.ends DLATCH

* Six-transistor SRAM cell. BL/BLB are bidirectional bitlines; WL is active high.
.subckt SRAM6T BL BLB WL Q QB VDD VSS
MP0 Q  QB VDD VDD PMOS W=1.0u L=0.10u
MN0 Q  QB VSS VSS NMOS W=0.5u L=0.10u
MP1 QB Q  VDD VDD PMOS W=1.0u L=0.10u
MN1 QB Q  VSS VSS NMOS W=0.5u L=0.10u
MN2 BL  WL Q  VSS NMOS W=0.35u L=0.10u
MN3 BLB WL QB VSS NMOS W=0.35u L=0.10u
.ends SRAM6T

