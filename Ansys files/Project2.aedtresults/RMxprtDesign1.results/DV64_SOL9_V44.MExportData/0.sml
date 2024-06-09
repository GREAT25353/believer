// BEGIN ANSOFT HEADER
//         Left: A B C N
//        Right: ROT1 ROT2 Pos

// A           : Phase A
// B           : Phase B
// C           : Phase C
// N           : Neutral
// ROT1        : Mechanical plus
// ROT2        : Mechanical minus
// Pos         : Position
// END ANSOFT HEADER

MODELDEF Setup1
{
PORT electrical: A;
PORT electrical: B;
PORT electrical: C;
PORT electrical: N;
PORT ROTATIONAL_V: ROT1;
PORT ROTATIONAL_V: ROT2;
PORT REAL OUT ANGLE[deg]: Pos = VM_Pos.V;
PORT REAL IN ANGLE[deg]: IniPos = 0;

INTERN  R        Ra  N1:=A, N2:=N0_1  ( R:=1.13669 ); 
INTERN  R        Rb  N1:=B, N2:=N0_2  ( R:=1.13669 ); 
INTERN  R        Rc  N1:=C, N2:=N0_3  ( R:=1.13669 ); 
INTERN  L        La  N1:=N0_1, N2:=N0_4  ( L:=0.00163712, I0:=0 ); 
INTERN  L        Lb  N1:=N0_2, N2:=N0_5  ( L:=0.00163712, I0:=0 ); 
INTERN  L        Lc  N1:=N0_3, N2:=N0_6  ( L:=0.00163712, I0:=0 ); 
INTERN  M        Kab  ( L1:= La.L, L2:= Lb.L, K:=-0.087121 ); 
INTERN  M        Kbc  ( L1:= Lb.L, L2:= Lc.L, K:=-0.087121 ); 
INTERN  M        Kca  ( L1:= Lc.L, L2:= La.L, K:=-0.087121 ); 
UMODEL Transformation_3To2 AB0 NAP:=N0_4, NAN:=N, NBP:=N0_5, NBN:=N, NCP:=N0_6, NCN:=N, NALPHA:=alpha, NBETA:=beta, NZERO:=zero () SRC: DLL( File:="Transformation.dll");

INTERN  EV       Speed  N1:=NM_1, N2:=GND  ( QUANT:=Torq.V, FACT:=1 ); 
INTERN  II       Torq  N1:=NM_6, N2:=NM_5  ( QUANT:=Speed.I, FACT:=1 ); 
UMODEL D2D D2D1 N1:=NM_5, N2:=ROT1 ( NATURE_1:="electrical", NATURE_2:="Rotational_V" ) SRC: DLL( File:="Domains.dll");
UMODEL D2D D2D2 N1:=NM_6, N2:=ROT2 ( NATURE_1:="electrical", NATURE_2:="Rotational_V" ) SRC: DLL( File:="Domains.dll");
INTERN  VM       VM_Pos  N1:=NM_2, N2:=GND  ; 
MODEL Setup1_AB0 model1 N_1:=alpha, N_2:=beta, N_3:=zero, N_4:=NM_1, N_5:=NM_2 ( pos0:=IniPos );


// BEGIN ANSOFT HEADER
//         Left: N_1 N_2 N_3
//        Right: N_4 N_5
// END ANSOFT HEADER

MODELDEF Setup1_AB0
{
PORT electrical: N_1;
PORT electrical: N_4;
PORT electrical: N_2;
PORT electrical: N_5;
PORT electrical: N_3;
PORT REAL IN: pos0 = 0;

INTERN  AM       VR1a  N1:=N_1, N2:=N_17  ; 
INTERN  E        BEma  N1:=N_19, N2:=N_17  ( EMF:=N_4.V * N_10.V, PARTDERIV:=1 ); 
INTERN  E        BVa  N1:=N_21, N2:=N_19  ( EMF:=N_23.V*cos(N_8.V) + N_24.V*sin(N_8.V), PARTDERIV:=1 ); 
INTERN  AM       VIa  N1:=N_21, N2:=GND  ; 
INTERN  VM       VM_Ea  N1:=N_17, N2:=GND  ; 
INTERN  AM       VR1b  N1:=N_2, N2:=N_18  ; 
INTERN  E        BEmb  N1:=N_20, N2:=N_18  ( EMF:=N_4.V * N_11.V, PARTDERIV:=1 ); 
INTERN  E        BVb  N1:=N_22, N2:=N_20  ( EMF:=N_23.V*sin(N_8.V) - N_24.V*cos(N_8.V), PARTDERIV:=1 ); 
INTERN  AM       VIb  N1:=N_22, N2:=GND  ; 
INTERN  VM       VM_Eb  N1:=N_18, N2:=GND  ; 
INTERN  AM       VR0  N1:=N_3, N2:=N_14  ; 
INTERN  E        BEm0  N1:=GND, N2:=N_14  ( EMF:=N_4.V * N_12.V, PARTDERIV:=1 ); 
INTERN  I        BI1d  N1:=GND, N2:=N_23  ( IS:=VIa.I*cos(N_8.V) + VIb.I*sin(N_8.V), PARTDERIV:=1 ); 
INTERN  AM       VI1d  N1:=N_23, N2:=N_25  ; 
INTERN  E        BVmd  N1:=N_31, N2:=N_25  ( EMF:=0.0125032 * N_4.V * VImq.I, PARTDERIV:=1 ); 
INTERN  L        Lad  N1:=N_31, N2:=N_33  ( L:=0.00625158, I0:=0 ); 
INTERN  AM       VImd  N1:=N_33, N2:=GND  ; 
INTERN  I        BI1q  N1:=GND, N2:=N_24  ( IS:=VIa.I*sin(N_8.V) - VIb.I*cos(N_8.V), PARTDERIV:=1 ); 
INTERN  AM       VI1q  N1:=N_24, N2:=N_26  ; 
INTERN  E        BVmq  N1:=N_32, N2:=N_26  ( EMF:=-0.0125032 * N_4.V * VImd.I, PARTDERIV:=1 ); 
INTERN  L        Laq  N1:=N_32, N2:=N_34  ( L:=0.00625158, I0:=0 ); 
INTERN  AM       VImq  N1:=N_34, N2:=GND  ; 
INTERN  I        BTm  N1:=GND, N2:=N_4  ( IS:=(VIa.I*N_10.V + VIb.I*N_11.V), PARTDERIV:=1 ); 
INTERN  R        RT  N1:=N_4, N2:=GND  ( R:=1e12 ); 
INTERN  VM       VM_Speed  N1:=N_4, N2:=GND  ; 
INTERN  IV       Gx  N1:=GND, N2:=N_7  ( QUANT:=VM_Speed.V, FACT:=1 ); 
INTERN  C        Cx  N1:=N_7, N2:=GND  ( C:=1, V0:=pos0*0.0174533 ); 
INTERN  VM       VM_Pos  N1:=N_7, N2:=GND  ; 
INTERN  EV       Ex1  N1:=GND, N2:=N_8  ( QUANT:=VM_Pos.V, FACT:=2 ); 
INTERN  VM       VM_Ex1  N1:=N_8, N2:=GND  ; 
INTERN  EV       Ex2  N1:=GND, N2:=N_5  ( QUANT:=VM_Pos.V, FACT:=57.2958 ); 
INTERN  VM       VM_kea  N1:=N_10, N2:=GND  ; 
INTERN  NDSRC    Pkea N0:=N_10, N1:=GND  ( QUANT:={N_8.V}, SRC:={vsrc}, TableData:="\
.MODEL Setup1_kea_table pwl TABLE=( 361, -3.14159, -3.12414, -3.10669,\
 -3.08923, -3.07178, -3.05433, -3.03687, -3.01942, -3.00197, -2.98451,\
 -2.96706, -2.94961, -2.93215, -2.9147, -2.89725, -2.87979, -2.86234, -2.84489,\
 -2.82743, -2.80998, -2.79253, -2.77507, -2.75762, -2.74017, -2.72271,\
 -2.70526, -2.68781, -2.67035, -2.6529, -2.63545, -2.61799, -2.60054, -2.58309,\
 -2.56563, -2.54818, -2.53073, -2.51327, -2.49582, -2.47837, -2.46091,\
 -2.44346, -2.42601, -2.40855, -2.3911, -2.37365, -2.35619, -2.33874, -2.32129,\
 -2.30383, -2.28638, -2.26893, -2.25147, -2.23402, -2.21657, -2.19911,\
 -2.18166, -2.16421, -2.14675, -2.1293, -2.11185, -2.0944, -2.07694, -2.05949,\
 -2.04204, -2.02458, -2.00713, -1.98968, -1.97222, -1.95477, -1.93732,\
 -1.91986, -1.90241, -1.88496, -1.8675, -1.85005, -1.8326, -1.81514, -1.79769,\
 -1.78024, -1.76278, -1.74533, -1.72788, -1.71042, -1.69297, -1.67552,\
 -1.65806, -1.64061, -1.62316, -1.6057, -1.58825, -1.5708, -1.55334, -1.53589,\
 -1.51844, -1.50098, -1.48353, -1.46608, -1.44862, -1.43117, -1.41372,\
 -1.39626, -1.37881, -1.36136, -1.3439, -1.32645, -1.309, -1.29154, -1.27409,\
 -1.25664, -1.23918, -1.22173, -1.20428, -1.18682, -1.16937, -1.15192,\
 -1.13446, -1.11701, -1.09956, -1.0821, -1.06465, -1.0472, -1.02974, -1.01229,\
 -0.994838, -0.977384, -0.959931, -0.942478, -0.925025, -0.907571, -0.890118,\
 -0.872665, -0.855211, -0.837758, -0.820305, -0.802851, -0.785398, -0.767945,\
 -0.750492, -0.733038, -0.715585, -0.698132, -0.680678, -0.663225, -0.645772,\
 -0.628319, -0.610865, -0.593412, -0.575959, -0.558505, -0.541052, -0.523599,\
 -0.506145, -0.488692, -0.471239, -0.453786, -0.436332, -0.418879, -0.401426,\
 -0.383972, -0.366519, -0.349066, -0.331613, -0.314159, -0.296706, -0.279253,\
 -0.261799, -0.244346, -0.226893, -0.20944, -0.191986, -0.174533, -0.15708,\
 -0.139626, -0.122173, -0.10472, -0.0872665, -0.0698132, -0.0523599,\
 -0.0349066, -0.0174533, 0, 0.0174533, 0.0349066, 0.0523599, 0.0698132,\
 0.0872665, 0.10472, 0.122173, 0.139626, 0.15708, 0.174533, 0.191986, 0.20944,\
 0.226893, 0.244346, 0.261799, 0.279253, 0.296706, 0.314159, 0.331613,\
 0.349066, 0.366519, 0.383972, 0.401426, 0.418879, 0.436332, 0.453786,\
 0.471239, 0.488692, 0.506145, 0.523599, 0.541052, 0.558505, 0.575959,\
 0.593412, 0.610865, 0.628319, 0.645772, 0.663225, 0.680678, 0.698132,\
 0.715585, 0.733038, 0.750492, 0.767945, 0.785398, 0.802851, 0.820305,\
 0.837758, 0.855211, 0.872665, 0.890118, 0.907571, 0.925025, 0.942478,\
 0.959931, 0.977384, 0.994838, 1.01229, 1.02974, 1.0472, 1.06465, 1.0821,\
 1.09956, 1.11701, 1.13446, 1.15192, 1.16937, 1.18682, 1.20428, 1.22173,\
 1.23918, 1.25664, 1.27409, 1.29154, 1.309, 1.32645, 1.3439, 1.36136, 1.37881,\
 1.39626, 1.41372, 1.43117, 1.44862, 1.46608, 1.48353, 1.50098, 1.51844,\
 1.53589, 1.55334, 1.5708, 1.58825, 1.6057, 1.62316, 1.64061, 1.65806, 1.67552,\
 1.69297, 1.71042, 1.72788, 1.74533, 1.76278, 1.78024, 1.79769, 1.81514,\
 1.8326, 1.85005, 1.8675, 1.88496, 1.90241, 1.91986, 1.93732, 1.95477, 1.97222,\
 1.98968, 2.00713, 2.02458, 2.04204, 2.05949, 2.07694, 2.0944, 2.11185, 2.1293,\
 2.14675, 2.16421, 2.18166, 2.19911, 2.21657, 2.23402, 2.25147, 2.26893,\
 2.28638, 2.30383, 2.32129, 2.33874, 2.35619, 2.37365, 2.3911, 2.40855,\
 2.42601, 2.44346, 2.46091, 2.47837, 2.49582, 2.51327, 2.53073, 2.54818,\
 2.56563, 2.58309, 2.60054, 2.61799, 2.63545, 2.6529, 2.67035, 2.68781,\
 2.70526, 2.72271, 2.74017, 2.75762, 2.77507, 2.79253, 2.80998, 2.82743,\
 2.84489, 2.86234, 2.87979, 2.89725, 2.9147, 2.93215, 2.94961, 2.96706,\
 2.98451, 3.00197, 3.01942, 3.03687, 3.05433, 3.07178, 3.08923, 3.10669,\
 3.12414, 3.14159, 1, 0, -0.0142682, -0.0352214, -0.0652977, -0.0947934,\
 -0.113783, -0.123816, -0.129263, -0.132567, -0.134775, -0.136351, -0.137534,\
 -0.138464, -0.139233, -0.139913, -0.140558, -0.141222, -0.141956, -0.142825,\
 -0.143908, -0.145321, -0.147239, -0.149964, -0.154098, -0.161012, -0.17393,\
 -0.198629, -0.237091, -0.27594, -0.301945, -0.317683, -0.330473, -0.346365,\
 -0.367659, -0.388176, -0.401443, -0.408574, -0.412532, -0.414979, -0.416636,\
 -0.417828, -0.418725, -0.419428, -0.420007, -0.420512, -0.420984, -0.421462,\
 -0.421982, -0.422591, -0.423347, -0.424329, -0.425665, -0.427573, -0.430492,\
 -0.435434, -0.444792, -0.462861, -0.491068, -0.519273, -0.537335, -0.54668,\
 -0.551603, -0.554495, -0.556366, -0.557655, -0.558575, -0.55925, -0.559755,\
 -0.56014, -0.56044, -0.560681, -0.560881, -0.561055, -0.561216, -0.561374,\
 -0.561543, -0.561734, -0.561963, -0.562253, -0.562633, -0.563149, -0.563875,\
 -0.564943, -0.56663, -0.569586, -0.575374, -0.586805, -0.60475, -0.622304,\
 -0.632417, -0.635366, -0.632417, -0.622304, -0.60475, -0.586805, -0.575374,\
 -0.569586, -0.56663, -0.564943, -0.563875, -0.563149, -0.562633, -0.562253,\
 -0.561963, -0.561734, -0.561543, -0.561374, -0.561216, -0.561055, -0.560881,\
 -0.560681, -0.56044, -0.56014, -0.559755, -0.55925, -0.558575, -0.557655,\
 -0.556366, -0.554495, -0.551603, -0.54668, -0.537335, -0.519273, -0.491068,\
 -0.462861, -0.444792, -0.435434, -0.430492, -0.427573, -0.425665, -0.424329,\
 -0.423347, -0.422591, -0.421982, -0.421462, -0.420984, -0.420512, -0.420007,\
 -0.419428, -0.418725, -0.417828, -0.416636, -0.414979, -0.412532, -0.408574,\
 -0.401443, -0.388176, -0.367659, -0.346365, -0.330473, -0.317683, -0.301945,\
 -0.27594, -0.237091, -0.198629, -0.17393, -0.161012, -0.154098, -0.149964,\
 -0.147239, -0.145321, -0.143908, -0.142825, -0.141956, -0.141222, -0.140558,\
 -0.139913, -0.139233, -0.138464, -0.137534, -0.136351, -0.134775, -0.132567,\
 -0.129263, -0.123816, -0.113783, -0.0947934, -0.0652977, -0.0352214,\
 -0.0142682, 0, 0.0142682, 0.0352214, 0.0652977, 0.0947934, 0.113783, 0.123816,\
 0.129263, 0.132567, 0.134775, 0.136351, 0.137534, 0.138464, 0.139233,\
 0.139913, 0.140558, 0.141222, 0.141956, 0.142825, 0.143908, 0.145321,\
 0.147239, 0.149964, 0.154098, 0.161012, 0.17393, 0.198629, 0.237091, 0.27594,\
 0.301945, 0.317683, 0.330473, 0.346365, 0.367659, 0.388176, 0.401443,\
 0.408574, 0.412532, 0.414979, 0.416636, 0.417828, 0.418725, 0.419428,\
 0.420007, 0.420512, 0.420984, 0.421462, 0.421982, 0.422591, 0.423347,\
 0.424329, 0.425665, 0.427573, 0.430492, 0.435434, 0.444792, 0.462861,\
 0.491068, 0.519273, 0.537335, 0.54668, 0.551603, 0.554495, 0.556366, 0.557655,\
 0.558575, 0.55925, 0.559755, 0.56014, 0.56044, 0.560681, 0.560881, 0.561055,\
 0.561216, 0.561374, 0.561543, 0.561734, 0.561963, 0.562253, 0.562633,\
 0.563149, 0.563875, 0.564943, 0.56663, 0.569586, 0.575374, 0.586805, 0.60475,\
 0.622304, 0.632417, 0.635366, 0.632417, 0.622304, 0.60475, 0.586805, 0.575374,\
 0.569586, 0.56663, 0.564943, 0.563875, 0.563149, 0.562633, 0.562253, 0.561963,\
 0.561734, 0.561543, 0.561374, 0.561216, 0.561055, 0.560881, 0.560681, 0.56044,\
 0.56014, 0.559755, 0.55925, 0.558575, 0.557655, 0.556366, 0.554495, 0.551603,\
 0.54668, 0.537335, 0.519273, 0.491068, 0.462861, 0.444792, 0.435434, 0.430492,\
 0.427573, 0.425665, 0.424329, 0.423347, 0.422591, 0.421982, 0.421462,\
 0.420984, 0.420512, 0.420007, 0.419428, 0.418725, 0.417828, 0.416636,\
 0.414979, 0.412532, 0.408574, 0.401443, 0.388176, 0.367659, 0.346365,\
 0.330473, 0.317683, 0.301945, 0.27594, 0.237091, 0.198629, 0.17393, 0.161012,\
 0.154098, 0.149964, 0.147239, 0.145321, 0.143908, 0.142825, 0.141956,\
 0.141222, 0.140558, 0.139913, 0.139233, 0.138464, 0.137534, 0.136351,\
 0.134775, 0.132567, 0.129263, 0.123816, 0.113783, 0.0947934, 0.0652977,\
 0.0352214, 0.0142682, 0) PERIODIC NOSPLINE" );
INTERN  VM       VM_keb  N1:=N_11, N2:=GND  ; 
INTERN  NDSRC    Pkeb N0:=N_11, N1:=GND  ( QUANT:={N_8.V}, SRC:={vsrc}, TableData:="\
.MODEL Setup1_keb_table pwl TABLE=( 361, -3.14159, -3.12414, -3.10669,\
 -3.08923, -3.07178, -3.05433, -3.03687, -3.01942, -3.00197, -2.98451,\
 -2.96706, -2.94961, -2.93215, -2.9147, -2.89725, -2.87979, -2.86234, -2.84489,\
 -2.82743, -2.80998, -2.79253, -2.77507, -2.75762, -2.74017, -2.72271,\
 -2.70526, -2.68781, -2.67035, -2.6529, -2.63545, -2.61799, -2.60054, -2.58309,\
 -2.56563, -2.54818, -2.53073, -2.51327, -2.49582, -2.47837, -2.46091,\
 -2.44346, -2.42601, -2.40855, -2.3911, -2.37365, -2.35619, -2.33874, -2.32129,\
 -2.30383, -2.28638, -2.26893, -2.25147, -2.23402, -2.21657, -2.19911,\
 -2.18166, -2.16421, -2.14675, -2.1293, -2.11185, -2.0944, -2.07694, -2.05949,\
 -2.04204, -2.02458, -2.00713, -1.98968, -1.97222, -1.95477, -1.93732,\
 -1.91986, -1.90241, -1.88496, -1.8675, -1.85005, -1.8326, -1.81514, -1.79769,\
 -1.78024, -1.76278, -1.74533, -1.72788, -1.71042, -1.69297, -1.67552,\
 -1.65806, -1.64061, -1.62316, -1.6057, -1.58825, -1.5708, -1.55334, -1.53589,\
 -1.51844, -1.50098, -1.48353, -1.46608, -1.44862, -1.43117, -1.41372,\
 -1.39626, -1.37881, -1.36136, -1.3439, -1.32645, -1.309, -1.29154, -1.27409,\
 -1.25664, -1.23918, -1.22173, -1.20428, -1.18682, -1.16937, -1.15192,\
 -1.13446, -1.11701, -1.09956, -1.0821, -1.06465, -1.0472, -1.02974, -1.01229,\
 -0.994838, -0.977384, -0.959931, -0.942478, -0.925025, -0.907571, -0.890118,\
 -0.872665, -0.855211, -0.837758, -0.820305, -0.802851, -0.785398, -0.767945,\
 -0.750492, -0.733038, -0.715585, -0.698132, -0.680678, -0.663225, -0.645772,\
 -0.628319, -0.610865, -0.593412, -0.575959, -0.558505, -0.541052, -0.523599,\
 -0.506145, -0.488692, -0.471239, -0.453786, -0.436332, -0.418879, -0.401426,\
 -0.383972, -0.366519, -0.349066, -0.331613, -0.314159, -0.296706, -0.279253,\
 -0.261799, -0.244346, -0.226893, -0.20944, -0.191986, -0.174533, -0.15708,\
 -0.139626, -0.122173, -0.10472, -0.0872665, -0.0698132, -0.0523599,\
 -0.0349066, -0.0174533, 0, 0.0174533, 0.0349066, 0.0523599, 0.0698132,\
 0.0872665, 0.10472, 0.122173, 0.139626, 0.15708, 0.174533, 0.191986, 0.20944,\
 0.226893, 0.244346, 0.261799, 0.279253, 0.296706, 0.314159, 0.331613,\
 0.349066, 0.366519, 0.383972, 0.401426, 0.418879, 0.436332, 0.453786,\
 0.471239, 0.488692, 0.506145, 0.523599, 0.541052, 0.558505, 0.575959,\
 0.593412, 0.610865, 0.628319, 0.645772, 0.663225, 0.680678, 0.698132,\
 0.715585, 0.733038, 0.750492, 0.767945, 0.785398, 0.802851, 0.820305,\
 0.837758, 0.855211, 0.872665, 0.890118, 0.907571, 0.925025, 0.942478,\
 0.959931, 0.977384, 0.994838, 1.01229, 1.02974, 1.0472, 1.06465, 1.0821,\
 1.09956, 1.11701, 1.13446, 1.15192, 1.16937, 1.18682, 1.20428, 1.22173,\
 1.23918, 1.25664, 1.27409, 1.29154, 1.309, 1.32645, 1.3439, 1.36136, 1.37881,\
 1.39626, 1.41372, 1.43117, 1.44862, 1.46608, 1.48353, 1.50098, 1.51844,\
 1.53589, 1.55334, 1.5708, 1.58825, 1.6057, 1.62316, 1.64061, 1.65806, 1.67552,\
 1.69297, 1.71042, 1.72788, 1.74533, 1.76278, 1.78024, 1.79769, 1.81514,\
 1.8326, 1.85005, 1.8675, 1.88496, 1.90241, 1.91986, 1.93732, 1.95477, 1.97222,\
 1.98968, 2.00713, 2.02458, 2.04204, 2.05949, 2.07694, 2.0944, 2.11185, 2.1293,\
 2.14675, 2.16421, 2.18166, 2.19911, 2.21657, 2.23402, 2.25147, 2.26893,\
 2.28638, 2.30383, 2.32129, 2.33874, 2.35619, 2.37365, 2.3911, 2.40855,\
 2.42601, 2.44346, 2.46091, 2.47837, 2.49582, 2.51327, 2.53073, 2.54818,\
 2.56563, 2.58309, 2.60054, 2.61799, 2.63545, 2.6529, 2.67035, 2.68781,\
 2.70526, 2.72271, 2.74017, 2.75762, 2.77507, 2.79253, 2.80998, 2.82743,\
 2.84489, 2.86234, 2.87979, 2.89725, 2.9147, 2.93215, 2.94961, 2.96706,\
 2.98451, 3.00197, 3.01942, 3.03687, 3.05433, 3.07178, 3.08923, 3.10669,\
 3.12414, 3.14159, 1, 0.631252, 0.628699, 0.61994, 0.604737, 0.589195,\
 0.579295, 0.574281, 0.571719, 0.570256, 0.569328, 0.568696, 0.568244,\
 0.567909, 0.56765, 0.567441, 0.567262, 0.5671, 0.566941, 0.566774, 0.566587,\
 0.566368, 0.566098, 0.565758, 0.565319, 0.564741, 0.563966, 0.562905, 0.56142,\
 0.559261, 0.555925, 0.550243, 0.539454, 0.518601, 0.486037, 0.45347, 0.432611,\
 0.421811, 0.416112, 0.412752, 0.410562, 0.409036, 0.407922, 0.407077,\
 0.406408, 0.405851, 0.405358, 0.404888, 0.404404, 0.403867, 0.40323, 0.402432,\
 0.401382, 0.399934, 0.397805, 0.394369, 0.388187, 0.376691, 0.358918,\
 0.340473, 0.326706, 0.315626, 0.301993, 0.279467, 0.245819, 0.212504,\
 0.191108, 0.179913, 0.173914, 0.170322, 0.167946, 0.166264, 0.165014,\
 0.164041, 0.163245, 0.162552, 0.161904, 0.161248, 0.160533, 0.159697,\
 0.158665, 0.157332, 0.155536, 0.153006, 0.149207, 0.14293, 0.131355, 0.109435,\
 0.0753834, 0.0406601, 0.0164706, 0, -0.0164706, -0.0406601, -0.0753834,\
 -0.109435, -0.131355, -0.14293, -0.149207, -0.153006, -0.155536, -0.157332,\
 -0.158665, -0.159697, -0.160533, -0.161248, -0.161904, -0.162552, -0.163245,\
 -0.164041, -0.165014, -0.166264, -0.167946, -0.170322, -0.173914, -0.179913,\
 -0.191108, -0.212504, -0.245819, -0.279467, -0.301993, -0.315626, -0.326706,\
 -0.340473, -0.358918, -0.376691, -0.388187, -0.394369, -0.397805, -0.399934,\
 -0.401382, -0.402432, -0.40323, -0.403867, -0.404404, -0.404888, -0.405358,\
 -0.405851, -0.406408, -0.407077, -0.407922, -0.409036, -0.410562, -0.412752,\
 -0.416112, -0.421811, -0.432611, -0.45347, -0.486037, -0.518601, -0.539454,\
 -0.550243, -0.555925, -0.559261, -0.56142, -0.562905, -0.563966, -0.564741,\
 -0.565319, -0.565758, -0.566098, -0.566368, -0.566587, -0.566774, -0.566941,\
 -0.5671, -0.567262, -0.567441, -0.56765, -0.567909, -0.568244, -0.568696,\
 -0.569328, -0.570256, -0.571719, -0.574281, -0.579295, -0.589195, -0.604737,\
 -0.61994, -0.628699, -0.631252, -0.628699, -0.61994, -0.604737, -0.589195,\
 -0.579295, -0.574281, -0.571719, -0.570256, -0.569328, -0.568696, -0.568244,\
 -0.567909, -0.56765, -0.567441, -0.567262, -0.5671, -0.566941, -0.566774,\
 -0.566587, -0.566368, -0.566098, -0.565758, -0.565319, -0.564741, -0.563966,\
 -0.562905, -0.56142, -0.559261, -0.555925, -0.550243, -0.539454, -0.518601,\
 -0.486037, -0.45347, -0.432611, -0.421811, -0.416112, -0.412752, -0.410562,\
 -0.409036, -0.407922, -0.407077, -0.406408, -0.405851, -0.405358, -0.404888,\
 -0.404404, -0.403867, -0.40323, -0.402432, -0.401382, -0.399934, -0.397805,\
 -0.394369, -0.388187, -0.376691, -0.358918, -0.340473, -0.326706, -0.315626,\
 -0.301993, -0.279467, -0.245819, -0.212504, -0.191108, -0.179913, -0.173914,\
 -0.170322, -0.167946, -0.166264, -0.165014, -0.164041, -0.163245, -0.162552,\
 -0.161904, -0.161248, -0.160533, -0.159697, -0.158665, -0.157332, -0.155536,\
 -0.153006, -0.149207, -0.14293, -0.131355, -0.109435, -0.0753834, -0.0406601,\
 -0.0164706, 0, 0.0164706, 0.0406601, 0.0753834, 0.109435, 0.131355, 0.14293,\
 0.149207, 0.153006, 0.155536, 0.157332, 0.158665, 0.159697, 0.160533,\
 0.161248, 0.161904, 0.162552, 0.163245, 0.164041, 0.165014, 0.166264,\
 0.167946, 0.170322, 0.173914, 0.179913, 0.191108, 0.212504, 0.245819,\
 0.279467, 0.301993, 0.315626, 0.326706, 0.340473, 0.358918, 0.376691,\
 0.388187, 0.394369, 0.397805, 0.399934, 0.401382, 0.402432, 0.40323, 0.403867,\
 0.404404, 0.404888, 0.405358, 0.405851, 0.406408, 0.407077, 0.407922,\
 0.409036, 0.410562, 0.412752, 0.416112, 0.421811, 0.432611, 0.45347, 0.486037,\
 0.518601, 0.539454, 0.550243, 0.555925, 0.559261, 0.56142, 0.562905, 0.563966,\
 0.564741, 0.565319, 0.565758, 0.566098, 0.566368, 0.566587, 0.566774,\
 0.566941, 0.5671, 0.567262, 0.567441, 0.56765, 0.567909, 0.568244, 0.568696,\
 0.569328, 0.570256, 0.571719, 0.574281, 0.579295, 0.589195, 0.604737, 0.61994,\
 0.628699, 0.631252) PERIODIC NOSPLINE" );
INTERN  VM       VM_ke0  N1:=N_12, N2:=GND  ; 
INTERN  NDSRC    Pke0 N0:=N_12, N1:=GND  ( QUANT:={N_8.V}, SRC:={vsrc}, TableData:="\
.MODEL Setup1_ke0_table pwl TABLE=( 361, -3.14159, -3.12414, -3.10669,\
 -3.08923, -3.07178, -3.05433, -3.03687, -3.01942, -3.00197, -2.98451,\
 -2.96706, -2.94961, -2.93215, -2.9147, -2.89725, -2.87979, -2.86234, -2.84489,\
 -2.82743, -2.80998, -2.79253, -2.77507, -2.75762, -2.74017, -2.72271,\
 -2.70526, -2.68781, -2.67035, -2.6529, -2.63545, -2.61799, -2.60054, -2.58309,\
 -2.56563, -2.54818, -2.53073, -2.51327, -2.49582, -2.47837, -2.46091,\
 -2.44346, -2.42601, -2.40855, -2.3911, -2.37365, -2.35619, -2.33874, -2.32129,\
 -2.30383, -2.28638, -2.26893, -2.25147, -2.23402, -2.21657, -2.19911,\
 -2.18166, -2.16421, -2.14675, -2.1293, -2.11185, -2.0944, -2.07694, -2.05949,\
 -2.04204, -2.02458, -2.00713, -1.98968, -1.97222, -1.95477, -1.93732,\
 -1.91986, -1.90241, -1.88496, -1.8675, -1.85005, -1.8326, -1.81514, -1.79769,\
 -1.78024, -1.76278, -1.74533, -1.72788, -1.71042, -1.69297, -1.67552,\
 -1.65806, -1.64061, -1.62316, -1.6057, -1.58825, -1.5708, -1.55334, -1.53589,\
 -1.51844, -1.50098, -1.48353, -1.46608, -1.44862, -1.43117, -1.41372,\
 -1.39626, -1.37881, -1.36136, -1.3439, -1.32645, -1.309, -1.29154, -1.27409,\
 -1.25664, -1.23918, -1.22173, -1.20428, -1.18682, -1.16937, -1.15192,\
 -1.13446, -1.11701, -1.09956, -1.0821, -1.06465, -1.0472, -1.02974, -1.01229,\
 -0.994838, -0.977384, -0.959931, -0.942478, -0.925025, -0.907571, -0.890118,\
 -0.872665, -0.855211, -0.837758, -0.820305, -0.802851, -0.785398, -0.767945,\
 -0.750492, -0.733038, -0.715585, -0.698132, -0.680678, -0.663225, -0.645772,\
 -0.628319, -0.610865, -0.593412, -0.575959, -0.558505, -0.541052, -0.523599,\
 -0.506145, -0.488692, -0.471239, -0.453786, -0.436332, -0.418879, -0.401426,\
 -0.383972, -0.366519, -0.349066, -0.331613, -0.314159, -0.296706, -0.279253,\
 -0.261799, -0.244346, -0.226893, -0.20944, -0.191986, -0.174533, -0.15708,\
 -0.139626, -0.122173, -0.10472, -0.0872665, -0.0698132, -0.0523599,\
 -0.0349066, -0.0174533, 0, 0.0174533, 0.0349066, 0.0523599, 0.0698132,\
 0.0872665, 0.10472, 0.122173, 0.139626, 0.15708, 0.174533, 0.191986, 0.20944,\
 0.226893, 0.244346, 0.261799, 0.279253, 0.296706, 0.314159, 0.331613,\
 0.349066, 0.366519, 0.383972, 0.401426, 0.418879, 0.436332, 0.453786,\
 0.471239, 0.488692, 0.506145, 0.523599, 0.541052, 0.558505, 0.575959,\
 0.593412, 0.610865, 0.628319, 0.645772, 0.663225, 0.680678, 0.698132,\
 0.715585, 0.733038, 0.750492, 0.767945, 0.785398, 0.802851, 0.820305,\
 0.837758, 0.855211, 0.872665, 0.890118, 0.907571, 0.925025, 0.942478,\
 0.959931, 0.977384, 0.994838, 1.01229, 1.02974, 1.0472, 1.06465, 1.0821,\
 1.09956, 1.11701, 1.13446, 1.15192, 1.16937, 1.18682, 1.20428, 1.22173,\
 1.23918, 1.25664, 1.27409, 1.29154, 1.309, 1.32645, 1.3439, 1.36136, 1.37881,\
 1.39626, 1.41372, 1.43117, 1.44862, 1.46608, 1.48353, 1.50098, 1.51844,\
 1.53589, 1.55334, 1.5708, 1.58825, 1.6057, 1.62316, 1.64061, 1.65806, 1.67552,\
 1.69297, 1.71042, 1.72788, 1.74533, 1.76278, 1.78024, 1.79769, 1.81514,\
 1.8326, 1.85005, 1.8675, 1.88496, 1.90241, 1.91986, 1.93732, 1.95477, 1.97222,\
 1.98968, 2.00713, 2.02458, 2.04204, 2.05949, 2.07694, 2.0944, 2.11185, 2.1293,\
 2.14675, 2.16421, 2.18166, 2.19911, 2.21657, 2.23402, 2.25147, 2.26893,\
 2.28638, 2.30383, 2.32129, 2.33874, 2.35619, 2.37365, 2.3911, 2.40855,\
 2.42601, 2.44346, 2.46091, 2.47837, 2.49582, 2.51327, 2.53073, 2.54818,\
 2.56563, 2.58309, 2.60054, 2.61799, 2.63545, 2.6529, 2.67035, 2.68781,\
 2.70526, 2.72271, 2.74017, 2.75762, 2.77507, 2.79253, 2.80998, 2.82743,\
 2.84489, 2.86234, 2.87979, 2.89725, 2.9147, 2.93215, 2.94961, 2.96706,\
 2.98451, 3.00197, 3.01942, 3.03687, 3.05433, 3.07178, 3.08923, 3.10669,\
 3.12414, 3.14159, 1, 0, -8.24904e-06, -1.6987e-05, -2.67332e-05, -3.80693e-05,\
 -5.16767e-05, -6.83807e-05, -8.92061e-05, -0.000115449, -0.000148769,\
 -0.000191324, -0.00024594, -0.000316361, -0.000407611, -0.000526505,\
 -0.000682429, -0.000888508, -0.00116342, -0.0015343, -0.00204158, -0.00274777,\
 -0.00375562, -0.00525172, -0.00762529, -0.0117977, -0.0199758, -0.0361369,\
 -0.0615112, -0.086335, -0.100636, -0.104804, -0.100636, -0.086335, -0.0615112,\
 -0.0361369, -0.0199758, -0.0117977, -0.00762529, -0.00525172, -0.00375562,\
 -0.00274777, -0.00204158, -0.0015343, -0.00116342, -0.000888508, -0.000682429,\
 -0.000526505, -0.000407611, -0.000316361, -0.00024594, -0.000191324,\
 -0.000148769, -0.000115449, -8.92061e-05, -6.83807e-05, -5.16767e-05,\
 -3.80693e-05, -2.67332e-05, -1.6987e-05, -8.24904e-06, 0, 8.24904e-06,\
 1.6987e-05, 2.67332e-05, 3.80693e-05, 5.16767e-05, 6.83807e-05, 8.92061e-05,\
 0.000115449, 0.000148769, 0.000191324, 0.00024594, 0.000316361, 0.000407611,\
 0.000526505, 0.000682429, 0.000888508, 0.00116342, 0.0015343, 0.00204158,\
 0.00274777, 0.00375562, 0.00525172, 0.00762529, 0.0117977, 0.0199758,\
 0.0361369, 0.0615112, 0.086335, 0.100636, 0.104804, 0.100636, 0.086335,\
 0.0615112, 0.0361369, 0.0199758, 0.0117977, 0.00762529, 0.00525172,\
 0.00375562, 0.00274777, 0.00204158, 0.0015343, 0.00116342, 0.000888508,\
 0.000682429, 0.000526505, 0.000407611, 0.000316361, 0.00024594, 0.000191324,\
 0.000148769, 0.000115449, 8.92061e-05, 6.83807e-05, 5.16767e-05, 3.80693e-05,\
 2.67332e-05, 1.6987e-05, 8.24904e-06, 0, -8.24904e-06, -1.6987e-05,\
 -2.67332e-05, -3.80693e-05, -5.16767e-05, -6.83807e-05, -8.92061e-05,\
 -0.000115449, -0.000148769, -0.000191324, -0.00024594, -0.000316361,\
 -0.000407611, -0.000526505, -0.000682429, -0.000888508, -0.00116342,\
 -0.0015343, -0.00204158, -0.00274777, -0.00375562, -0.00525172, -0.00762529,\
 -0.0117977, -0.0199758, -0.0361369, -0.0615112, -0.086335, -0.100636,\
 -0.104804, -0.100636, -0.086335, -0.0615112, -0.0361369, -0.0199758,\
 -0.0117977, -0.00762529, -0.00525172, -0.00375562, -0.00274777, -0.00204158,\
 -0.0015343, -0.00116342, -0.000888508, -0.000682429, -0.000526505,\
 -0.000407611, -0.000316361, -0.00024594, -0.000191324, -0.000148769,\
 -0.000115449, -8.92061e-05, -6.83807e-05, -5.16767e-05, -3.80693e-05,\
 -2.67332e-05, -1.6987e-05, -8.24904e-06, 0, 8.24904e-06, 1.6987e-05,\
 2.67332e-05, 3.80693e-05, 5.16767e-05, 6.83807e-05, 8.92061e-05, 0.000115449,\
 0.000148769, 0.000191324, 0.00024594, 0.000316361, 0.000407611, 0.000526505,\
 0.000682429, 0.000888508, 0.00116342, 0.0015343, 0.00204158, 0.00274777,\
 0.00375562, 0.00525172, 0.00762529, 0.0117977, 0.0199758, 0.0361369,\
 0.0615112, 0.086335, 0.100636, 0.104804, 0.100636, 0.086335, 0.0615112,\
 0.0361369, 0.0199758, 0.0117977, 0.00762529, 0.00525172, 0.00375562,\
 0.00274777, 0.00204158, 0.0015343, 0.00116342, 0.000888508, 0.000682429,\
 0.000526505, 0.000407611, 0.000316361, 0.00024594, 0.000191324, 0.000148769,\
 0.000115449, 8.92061e-05, 6.83807e-05, 5.16767e-05, 3.80693e-05, 2.67332e-05,\
 1.6987e-05, 8.24904e-06, 0, -8.24904e-06, -1.6987e-05, -2.67332e-05,\
 -3.80693e-05, -5.16767e-05, -6.83807e-05, -8.92061e-05, -0.000115449,\
 -0.000148769, -0.000191324, -0.00024594, -0.000316361, -0.000407611,\
 -0.000526505, -0.000682429, -0.000888508, -0.00116342, -0.0015343,\
 -0.00204158, -0.00274777, -0.00375562, -0.00525172, -0.00762529, -0.0117977,\
 -0.0199758, -0.0361369, -0.0615112, -0.086335, -0.100636, -0.104804,\
 -0.100636, -0.086335, -0.0615112, -0.0361369, -0.0199758, -0.0117977,\
 -0.00762529, -0.00525172, -0.00375562, -0.00274777, -0.00204158, -0.0015343,\
 -0.00116342, -0.000888508, -0.000682429, -0.000526505, -0.000407611,\
 -0.000316361, -0.00024594, -0.000191324, -0.000148769, -0.000115449,\
 -8.92061e-05, -6.83807e-05, -5.16767e-05, -3.80693e-05, -2.67332e-05,\
 -1.6987e-05, -8.24904e-06, 0, 8.24904e-06, 1.6987e-05, 2.67332e-05,\
 3.80693e-05, 5.16767e-05, 6.83807e-05, 8.92061e-05, 0.000115449, 0.000148769,\
 0.000191324, 0.00024594, 0.000316361, 0.000407611, 0.000526505, 0.000682429,\
 0.000888508, 0.00116342, 0.0015343, 0.00204158, 0.00274777, 0.00375562,\
 0.00525172, 0.00762529, 0.0117977, 0.0199758, 0.0361369, 0.0615112, 0.086335,\
 0.100636, 0.104804, 0.100636, 0.086335, 0.0615112, 0.0361369, 0.0199758,\
 0.0117977, 0.00762529, 0.00525172, 0.00375562, 0.00274777, 0.00204158,\
 0.0015343, 0.00116342, 0.000888508, 0.000682429, 0.000526505, 0.000407611,\
 0.000316361, 0.00024594, 0.000191324, 0.000148769, 0.000115449, 8.92061e-05,\
 6.83807e-05, 5.16767e-05, 3.80693e-05, 2.67332e-05, 1.6987e-05, 8.24904e-06, 0)\
 PERIODIC NOSPLINE" );
}

}
