# VDD Peripheral Core (VDD)
set VDD_PIO {A2  A8  A19 A25 B1  B26 C6  C13 C14 C21 \
             E11 E16 F3  F24 H1  H26 K5  K22 M3  M24 \
             N3  N24 P5  P22 S1  S26 U3  U24 V11 V16 \
             X6  X13 X14 X21 Y1  Y26 Z2  Z8  Z19 Z25}

# VDD Peripheral IO (DVDD)
set DVDD_PIO {A21 A6  B2  B25 C11 C12 C15 C16 C24 C3  \
              F1  F26 K24 K3  L24 L3  O24 O3  P24 P3  \
              U1  U26 X11 X12 X15 X16 X24 X3  Y2  Y25 \
              Z21  Z6 }

# VSS Peripheral Core (VSS)
set VSS_PIO {A5  A10 A13 A14 A17 A22 B3  B24 C2  C25 \
             D9  D18 E1  E26 I4  I23 J1  J26 M1  M26 \
             N1  N26 Q1  Q26 R4  R23 V1  V26 W9  W18 \
             X2  X25 Y3  Y24 Z5  Z10 Z13 Z14 Z17 Z22}

# VSS Peripheral IO (DVSS)
set DVSS_PIO {B11 B12 B15 B16 C7  C20 D4  D23 E5  E22 \
              G3  G24 K2  K25 L2  L25 O2  O25 P2  P25 \
              T3  T24 V5  V22 W4  W23 X7  X20 Y11 Y12 \
              Y15 Y16}

set VDD1 {F8  F12 G8  G12 H6  H8  H10 H12 I6  I8  \
          I10 I12 J6  J8  J10 J12}
set VDD2 {K6  K10 L6  L10 M6  M8  M10 M12 N6  N8  \
          N10 N12 O6  O10 P6  P10}
set VDD3 {Q6  Q8  Q10 Q12 R6  R8  R10 R12 S6  S8  \
          S10 S12 T8  T12 U8  U12}
set VDD4 {F15 F19 G15 G19 H15 H17 H19 H21 I15 I17 \
          I19 I21 J15 J17 J19 J21}
set VDD5 {K17 K21 L17 L21 M15 M17 M19 M21 N15 N17 \
          N19 N21 O17 O21 P17 P21}
set VDD6 {Q15 Q17 Q19 Q21 R15 R17 R19 R21 S15 S17 \
          S19 S21 T15 T19 U15 U19}

set VDDG {F6  F10 F17 F21 G6  G10 G17 G21 K8  K12 \
          K15 K19 L8  L12 L15 L19 O8  O12 O15 O19 \
          P8  P12 P15 P19 T6  T10 T17 T21 U6  U10 \
          U17 U21}

# VSS Core
set VSS_Core {F7  G7  H7  I7  J7  K7  L7  M7  N7  O7  \
              P7  Q7  R7  S7  T7  U7  F9  G9  H9  I9  \
              J9  K9  L9  M9  N9  O9  P9  Q9  R9  S9  \
              T9  U9  F11 G11 H11 I11 J11 K11 L11 M11 \
              N11 O11 P11 Q11 R11 S11 T11 U11 F13 G13 \
              H13 I13 J13 K13 L13 M13 N13 O13 P13 Q13 \
              R13 S13 T13 U13 F14 G14 H14 I14 J14 K14 \
              L14 M14 N14 O14 P14 Q14 R14 S14 T14 U14 \
              F16 G16 H16 I16 J16 K16 L16 M16 N16 O16 \
              P16 Q16 R16 S16 T16 U16 F18 G18 H18 I18 \
              J18 K18 L18 M18 N18 O18 P18 Q18 R18 S18 \
              T18 U18 F20 G20 H20 I20 J20 K20 L20 M20 \
              N20 O20 P20 Q20 R20 S20 T20 U20}

# VDD Core
set VDD_Core "$VDDG $VDD1 $VDD2 $VDD3 $VDD4 $VDD5 $VDD6"
