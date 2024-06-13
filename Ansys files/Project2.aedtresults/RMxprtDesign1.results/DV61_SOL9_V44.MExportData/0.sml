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

INTERN  R        Ra  N1:=A, N2:=N0_1  ( R:=1.10508 ); 
INTERN  R        Rb  N1:=B, N2:=N0_2  ( R:=1.10508 ); 
INTERN  R        Rc  N1:=C, N2:=N0_3  ( R:=1.10508 ); 
INTERN  L        La  N1:=N0_1, N2:=N0_4  ( L:=0.0015506, I0:=0 ); 
INTERN  L        Lb  N1:=N0_2, N2:=N0_5  ( L:=0.0015506, I0:=0 ); 
INTERN  L        Lc  N1:=N0_3, N2:=N0_6  ( L:=0.0015506, I0:=0 ); 
INTERN  M        Kab  ( L1:= La.L, L2:= Lb.L, K:=-0.0843167 ); 
INTERN  M        Kbc  ( L1:= Lb.L, L2:= Lc.L, K:=-0.0843167 ); 
INTERN  M        Kca  ( L1:= Lc.L, L2:= La.L, K:=-0.0843167 ); 
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
INTERN  E        BVmd  N1:=N_31, N2:=N_25  ( EMF:=0.0114894 * N_4.V * VImq.I, PARTDERIV:=1 ); 
INTERN  L        Lad  N1:=N_31, N2:=N_33  ( L:=0.00574469, I0:=0 ); 
INTERN  AM       VImd  N1:=N_33, N2:=GND  ; 
INTERN  I        BI1q  N1:=GND, N2:=N_24  ( IS:=VIa.I*sin(N_8.V) - VIb.I*cos(N_8.V), PARTDERIV:=1 ); 
INTERN  AM       VI1q  N1:=N_24, N2:=N_26  ; 
INTERN  E        BVmq  N1:=N_32, N2:=N_26  ( EMF:=-0.0114894 * N_4.V * VImd.I, PARTDERIV:=1 ); 
INTERN  L        Laq  N1:=N_32, N2:=N_34  ( L:=0.00574469, I0:=0 ); 
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
 3.12414, 3.14159, 1, 0, -0.0132191, -0.0326318, -0.0604967, -0.0878236,\
 -0.105417, -0.114713, -0.119759, -0.12282, -0.124865, -0.126326, -0.127422,\
 -0.128283, -0.128996, -0.129626, -0.130224, -0.130838, -0.131519, -0.132323,\
 -0.133327, -0.134637, -0.136414, -0.138938, -0.142768, -0.149174, -0.161142,\
 -0.184024, -0.219659, -0.255651, -0.279744, -0.294325, -0.306174, -0.320898,\
 -0.340626, -0.359635, -0.371927, -0.378533, -0.3822, -0.384467, -0.386002,\
 -0.387107, -0.387938, -0.38859, -0.389126, -0.389594, -0.390031, -0.390473,\
 -0.390956, -0.39152, -0.39222, -0.39313, -0.394368, -0.396136, -0.398839,\
 -0.403418, -0.412089, -0.428829, -0.454962, -0.481093, -0.497827, -0.506485,\
 -0.511046, -0.513725, -0.515459, -0.516653, -0.517506, -0.518131, -0.518598,\
 -0.518955, -0.519233, -0.519457, -0.519642, -0.519803, -0.519952, -0.520099,\
 -0.520255, -0.520432, -0.520645, -0.520913, -0.521265, -0.521744, -0.522416,\
 -0.523406, -0.524968, -0.527707, -0.533069, -0.54366, -0.560285, -0.576549,\
 -0.585919, -0.58865, -0.585919, -0.576549, -0.560285, -0.54366, -0.533069,\
 -0.527707, -0.524968, -0.523406, -0.522416, -0.521744, -0.521265, -0.520913,\
 -0.520645, -0.520432, -0.520255, -0.520099, -0.519952, -0.519803, -0.519642,\
 -0.519457, -0.519233, -0.518955, -0.518598, -0.518131, -0.517506, -0.516653,\
 -0.515459, -0.513725, -0.511046, -0.506485, -0.497827, -0.481093, -0.454962,\
 -0.428829, -0.412089, -0.403418, -0.398839, -0.396136, -0.394368, -0.39313,\
 -0.39222, -0.39152, -0.390956, -0.390473, -0.390031, -0.389594, -0.389126,\
 -0.38859, -0.387938, -0.387107, -0.386002, -0.384467, -0.3822, -0.378533,\
 -0.371927, -0.359635, -0.340626, -0.320898, -0.306174, -0.294325, -0.279744,\
 -0.255651, -0.219659, -0.184024, -0.161142, -0.149174, -0.142768, -0.138938,\
 -0.136414, -0.134637, -0.133327, -0.132323, -0.131519, -0.130838, -0.130224,\
 -0.129626, -0.128996, -0.128283, -0.127422, -0.126326, -0.124865, -0.12282,\
 -0.119759, -0.114713, -0.105417, -0.0878236, -0.0604967, -0.0326318,\
 -0.0132191, 0, 0.0132191, 0.0326318, 0.0604967, 0.0878236, 0.105417, 0.114713,\
 0.119759, 0.12282, 0.124865, 0.126326, 0.127422, 0.128283, 0.128996, 0.129626,\
 0.130224, 0.130838, 0.131519, 0.132323, 0.133327, 0.134637, 0.136414,\
 0.138938, 0.142768, 0.149174, 0.161142, 0.184024, 0.219659, 0.255651,\
 0.279744, 0.294325, 0.306174, 0.320898, 0.340626, 0.359635, 0.371927,\
 0.378533, 0.3822, 0.384467, 0.386002, 0.387107, 0.387938, 0.38859, 0.389126,\
 0.389594, 0.390031, 0.390473, 0.390956, 0.39152, 0.39222, 0.39313, 0.394368,\
 0.396136, 0.398839, 0.403418, 0.412089, 0.428829, 0.454962, 0.481093,\
 0.497827, 0.506485, 0.511046, 0.513725, 0.515459, 0.516653, 0.517506,\
 0.518131, 0.518598, 0.518955, 0.519233, 0.519457, 0.519642, 0.519803,\
 0.519952, 0.520099, 0.520255, 0.520432, 0.520645, 0.520913, 0.521265,\
 0.521744, 0.522416, 0.523406, 0.524968, 0.527707, 0.533069, 0.54366, 0.560285,\
 0.576549, 0.585919, 0.58865, 0.585919, 0.576549, 0.560285, 0.54366, 0.533069,\
 0.527707, 0.524968, 0.523406, 0.522416, 0.521744, 0.521265, 0.520913,\
 0.520645, 0.520432, 0.520255, 0.520099, 0.519952, 0.519803, 0.519642,\
 0.519457, 0.519233, 0.518955, 0.518598, 0.518131, 0.517506, 0.516653,\
 0.515459, 0.513725, 0.511046, 0.506485, 0.497827, 0.481093, 0.454962,\
 0.428829, 0.412089, 0.403418, 0.398839, 0.396136, 0.394368, 0.39313, 0.39222,\
 0.39152, 0.390956, 0.390473, 0.390031, 0.389594, 0.389126, 0.38859, 0.387938,\
 0.387107, 0.386002, 0.384467, 0.3822, 0.378533, 0.371927, 0.359635, 0.340626,\
 0.320898, 0.306174, 0.294325, 0.279744, 0.255651, 0.219659, 0.184024,\
 0.161142, 0.149174, 0.142768, 0.138938, 0.136414, 0.134637, 0.133327,\
 0.132323, 0.131519, 0.130838, 0.130224, 0.129626, 0.128996, 0.128283,\
 0.127422, 0.126326, 0.124865, 0.12282, 0.119759, 0.114713, 0.105417,\
 0.0878236, 0.0604967, 0.0326318, 0.0132191, 0) PERIODIC NOSPLINE" );
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
 3.12414, 3.14159, 1, 0.584839, 0.582473, 0.574359, 0.560273, 0.545874,\
 0.536702, 0.532057, 0.529683, 0.528328, 0.527468, 0.526882, 0.526464,\
 0.526153, 0.525913, 0.525719, 0.525554, 0.525403, 0.525256, 0.525102,\
 0.524929, 0.524725, 0.524476, 0.524161, 0.523754, 0.523218, 0.5225, 0.521518,\
 0.520142, 0.518141, 0.51505, 0.509786, 0.499791, 0.480471, 0.450301, 0.420129,\
 0.400803, 0.390797, 0.385517, 0.382404, 0.380375, 0.378961, 0.377929,\
 0.377146, 0.376527, 0.376011, 0.375554, 0.375119, 0.37467, 0.374173, 0.373582,\
 0.372843, 0.371871, 0.370529, 0.368556, 0.365372, 0.359645, 0.348995,\
 0.332528, 0.315439, 0.302685, 0.292419, 0.279788, 0.258919, 0.227745, 0.19688,\
 0.177057, 0.166684, 0.161127, 0.157799, 0.155598, 0.154039, 0.152881, 0.15198,\
 0.151242, 0.1506, 0.15, 0.149393, 0.14873, 0.147955, 0.146999, 0.145764,\
 0.1441, 0.141756, 0.138237, 0.132421, 0.121697, 0.101389, 0.0698408,\
 0.0376705, 0.0152595, 0, -0.0152595, -0.0376705, -0.0698408, -0.101389,\
 -0.121697, -0.132421, -0.138237, -0.141756, -0.1441, -0.145764, -0.146999,\
 -0.147955, -0.14873, -0.149393, -0.15, -0.1506, -0.151242, -0.15198,\
 -0.152881, -0.154039, -0.155598, -0.157799, -0.161127, -0.166684, -0.177057,\
 -0.19688, -0.227745, -0.258919, -0.279788, -0.292419, -0.302685, -0.315439,\
 -0.332528, -0.348995, -0.359645, -0.365372, -0.368556, -0.370529, -0.371871,\
 -0.372843, -0.373582, -0.374173, -0.37467, -0.375119, -0.375554, -0.376011,\
 -0.376527, -0.377146, -0.377929, -0.378961, -0.380375, -0.382404, -0.385517,\
 -0.390797, -0.400803, -0.420129, -0.450301, -0.480471, -0.499791, -0.509786,\
 -0.51505, -0.518141, -0.520142, -0.521518, -0.5225, -0.523218, -0.523754,\
 -0.524161, -0.524476, -0.524725, -0.524929, -0.525102, -0.525256, -0.525403,\
 -0.525554, -0.525719, -0.525913, -0.526153, -0.526464, -0.526882, -0.527468,\
 -0.528328, -0.529683, -0.532057, -0.536702, -0.545874, -0.560273, -0.574359,\
 -0.582473, -0.584839, -0.582473, -0.574359, -0.560273, -0.545874, -0.536702,\
 -0.532057, -0.529683, -0.528328, -0.527468, -0.526882, -0.526464, -0.526153,\
 -0.525913, -0.525719, -0.525554, -0.525403, -0.525256, -0.525102, -0.524929,\
 -0.524725, -0.524476, -0.524161, -0.523754, -0.523218, -0.5225, -0.521518,\
 -0.520142, -0.518141, -0.51505, -0.509786, -0.499791, -0.480471, -0.450301,\
 -0.420129, -0.400803, -0.390797, -0.385517, -0.382404, -0.380375, -0.378961,\
 -0.377929, -0.377146, -0.376527, -0.376011, -0.375554, -0.375119, -0.37467,\
 -0.374173, -0.373582, -0.372843, -0.371871, -0.370529, -0.368556, -0.365372,\
 -0.359645, -0.348995, -0.332528, -0.315439, -0.302685, -0.292419, -0.279788,\
 -0.258919, -0.227745, -0.19688, -0.177057, -0.166684, -0.161127, -0.157799,\
 -0.155598, -0.154039, -0.152881, -0.15198, -0.151242, -0.1506, -0.15,\
 -0.149393, -0.14873, -0.147955, -0.146999, -0.145764, -0.1441, -0.141756,\
 -0.138237, -0.132421, -0.121697, -0.101389, -0.0698408, -0.0376705,\
 -0.0152595, 0, 0.0152595, 0.0376705, 0.0698408, 0.101389, 0.121697, 0.132421,\
 0.138237, 0.141756, 0.1441, 0.145764, 0.146999, 0.147955, 0.14873, 0.149393,\
 0.15, 0.1506, 0.151242, 0.15198, 0.152881, 0.154039, 0.155598, 0.157799,\
 0.161127, 0.166684, 0.177057, 0.19688, 0.227745, 0.258919, 0.279788, 0.292419,\
 0.302685, 0.315439, 0.332528, 0.348995, 0.359645, 0.365372, 0.368556,\
 0.370529, 0.371871, 0.372843, 0.373582, 0.374173, 0.37467, 0.375119, 0.375554,\
 0.376011, 0.376527, 0.377146, 0.377929, 0.378961, 0.380375, 0.382404,\
 0.385517, 0.390797, 0.400803, 0.420129, 0.450301, 0.480471, 0.499791,\
 0.509786, 0.51505, 0.518141, 0.520142, 0.521518, 0.5225, 0.523218, 0.523754,\
 0.524161, 0.524476, 0.524725, 0.524929, 0.525102, 0.525256, 0.525403,\
 0.525554, 0.525719, 0.525913, 0.526153, 0.526464, 0.526882, 0.527468,\
 0.528328, 0.529683, 0.532057, 0.536702, 0.545874, 0.560273, 0.574359,\
 0.582473, 0.584839) PERIODIC NOSPLINE" );
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
 3.12414, 3.14159, 1, 0, -7.64252e-06, -1.57381e-05, -2.47676e-05,\
 -3.52702e-05, -4.78771e-05, -6.3353e-05, -8.26472e-05, -0.00010696,\
 -0.000137831, -0.000177257, -0.000227857, -0.000293101, -0.000377641,\
 -0.000487793, -0.000632253, -0.00082318, -0.00107788, -0.00142149,\
 -0.00189147, -0.00254574, -0.00347948, -0.00486559, -0.00706464, -0.0109302,\
 -0.018507, -0.0334799, -0.0569885, -0.0799872, -0.0932364, -0.0970985,\
 -0.0932364, -0.0799872, -0.0569885, -0.0334799, -0.018507, -0.0109302,\
 -0.00706464, -0.00486559, -0.00347948, -0.00254574, -0.00189147, -0.00142149,\
 -0.00107788, -0.00082318, -0.000632253, -0.000487793, -0.000377641,\
 -0.000293101, -0.000227857, -0.000177257, -0.000137831, -0.00010696,\
 -8.26472e-05, -6.3353e-05, -4.78771e-05, -3.52702e-05, -2.47676e-05,\
 -1.57381e-05, -7.64252e-06, 0, 7.64252e-06, 1.57381e-05, 2.47676e-05,\
 3.52702e-05, 4.78771e-05, 6.3353e-05, 8.26472e-05, 0.00010696, 0.000137831,\
 0.000177257, 0.000227857, 0.000293101, 0.000377641, 0.000487793, 0.000632253,\
 0.00082318, 0.00107788, 0.00142149, 0.00189147, 0.00254574, 0.00347948,\
 0.00486559, 0.00706464, 0.0109302, 0.018507, 0.0334799, 0.0569885, 0.0799872,\
 0.0932364, 0.0970985, 0.0932364, 0.0799872, 0.0569885, 0.0334799, 0.018507,\
 0.0109302, 0.00706464, 0.00486559, 0.00347948, 0.00254574, 0.00189147,\
 0.00142149, 0.00107788, 0.00082318, 0.000632253, 0.000487793, 0.000377641,\
 0.000293101, 0.000227857, 0.000177257, 0.000137831, 0.00010696, 8.26472e-05,\
 6.3353e-05, 4.78771e-05, 3.52702e-05, 2.47676e-05, 1.57381e-05, 7.64252e-06,\
 0, -7.64252e-06, -1.57381e-05, -2.47676e-05, -3.52702e-05, -4.78771e-05,\
 -6.3353e-05, -8.26472e-05, -0.00010696, -0.000137831, -0.000177257,\
 -0.000227857, -0.000293101, -0.000377641, -0.000487793, -0.000632253,\
 -0.00082318, -0.00107788, -0.00142149, -0.00189147, -0.00254574, -0.00347948,\
 -0.00486559, -0.00706464, -0.0109302, -0.018507, -0.0334799, -0.0569885,\
 -0.0799872, -0.0932364, -0.0970985, -0.0932364, -0.0799872, -0.0569885,\
 -0.0334799, -0.018507, -0.0109302, -0.00706464, -0.00486559, -0.00347948,\
 -0.00254574, -0.00189147, -0.00142149, -0.00107788, -0.00082318, -0.000632253,\
 -0.000487793, -0.000377641, -0.000293101, -0.000227857, -0.000177257,\
 -0.000137831, -0.00010696, -8.26472e-05, -6.3353e-05, -4.78771e-05,\
 -3.52702e-05, -2.47676e-05, -1.57381e-05, -7.64252e-06, 0, 7.64252e-06,\
 1.57381e-05, 2.47676e-05, 3.52702e-05, 4.78771e-05, 6.3353e-05, 8.26472e-05,\
 0.00010696, 0.000137831, 0.000177257, 0.000227857, 0.000293101, 0.000377641,\
 0.000487793, 0.000632253, 0.00082318, 0.00107788, 0.00142149, 0.00189147,\
 0.00254574, 0.00347948, 0.00486559, 0.00706464, 0.0109302, 0.018507,\
 0.0334799, 0.0569885, 0.0799872, 0.0932364, 0.0970985, 0.0932364, 0.0799872,\
 0.0569885, 0.0334799, 0.018507, 0.0109302, 0.00706464, 0.00486559, 0.00347948,\
 0.00254574, 0.00189147, 0.00142149, 0.00107788, 0.00082318, 0.000632253,\
 0.000487793, 0.000377641, 0.000293101, 0.000227857, 0.000177257, 0.000137831,\
 0.00010696, 8.26472e-05, 6.3353e-05, 4.78771e-05, 3.52702e-05, 2.47676e-05,\
 1.57381e-05, 7.64252e-06, 0, -7.64252e-06, -1.57381e-05, -2.47676e-05,\
 -3.52702e-05, -4.78771e-05, -6.3353e-05, -8.26472e-05, -0.00010696,\
 -0.000137831, -0.000177257, -0.000227857, -0.000293101, -0.000377641,\
 -0.000487793, -0.000632253, -0.00082318, -0.00107788, -0.00142149,\
 -0.00189147, -0.00254574, -0.00347948, -0.00486559, -0.00706464, -0.0109302,\
 -0.018507, -0.0334799, -0.0569885, -0.0799872, -0.0932364, -0.0970985,\
 -0.0932364, -0.0799872, -0.0569885, -0.0334799, -0.018507, -0.0109302,\
 -0.00706464, -0.00486559, -0.00347948, -0.00254574, -0.00189147, -0.00142149,\
 -0.00107788, -0.00082318, -0.000632253, -0.000487793, -0.000377641,\
 -0.000293101, -0.000227857, -0.000177257, -0.000137831, -0.00010696,\
 -8.26472e-05, -6.3353e-05, -4.78771e-05, -3.52702e-05, -2.47676e-05,\
 -1.57381e-05, -7.64252e-06, 0, 7.64252e-06, 1.57381e-05, 2.47676e-05,\
 3.52702e-05, 4.78771e-05, 6.3353e-05, 8.26472e-05, 0.00010696, 0.000137831,\
 0.000177257, 0.000227857, 0.000293101, 0.000377641, 0.000487793, 0.000632253,\
 0.00082318, 0.00107788, 0.00142149, 0.00189147, 0.00254574, 0.00347948,\
 0.00486559, 0.00706464, 0.0109302, 0.018507, 0.0334799, 0.0569885, 0.0799872,\
 0.0932364, 0.0970985, 0.0932364, 0.0799872, 0.0569885, 0.0334799, 0.018507,\
 0.0109302, 0.00706464, 0.00486559, 0.00347948, 0.00254574, 0.00189147,\
 0.00142149, 0.00107788, 0.00082318, 0.000632253, 0.000487793, 0.000377641,\
 0.000293101, 0.000227857, 0.000177257, 0.000137831, 0.00010696, 8.26472e-05,\
 6.3353e-05, 4.78771e-05, 3.52702e-05, 2.47676e-05, 1.57381e-05, 7.64252e-06, 0)\
 PERIODIC NOSPLINE" );
}

}