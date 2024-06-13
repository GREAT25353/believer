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

INTERN  R        Ra  N1:=A, N2:=N0_1  ( R:=1.44235 ); 
INTERN  R        Rb  N1:=B, N2:=N0_2  ( R:=1.44235 ); 
INTERN  R        Rc  N1:=C, N2:=N0_3  ( R:=1.44235 ); 
INTERN  L        La  N1:=N0_1, N2:=N0_4  ( L:=0.00247343, I0:=0 ); 
INTERN  L        Lb  N1:=N0_2, N2:=N0_5  ( L:=0.00247343, I0:=0 ); 
INTERN  L        Lc  N1:=N0_3, N2:=N0_6  ( L:=0.00247343, I0:=0 ); 
INTERN  M        Kab  ( L1:= La.L, L2:= Lb.L, K:=-0.104115 ); 
INTERN  M        Kbc  ( L1:= Lb.L, L2:= Lc.L, K:=-0.104115 ); 
INTERN  M        Kca  ( L1:= Lc.L, L2:= La.L, K:=-0.104115 ); 
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
INTERN  E        BVmd  N1:=N_31, N2:=N_25  ( EMF:=0.0223029 * N_4.V * VImq.I, PARTDERIV:=1 ); 
INTERN  L        Lad  N1:=N_31, N2:=N_33  ( L:=0.0111515, I0:=0 ); 
INTERN  AM       VImd  N1:=N_33, N2:=GND  ; 
INTERN  I        BI1q  N1:=GND, N2:=N_24  ( IS:=VIa.I*sin(N_8.V) - VIb.I*cos(N_8.V), PARTDERIV:=1 ); 
INTERN  AM       VI1q  N1:=N_24, N2:=N_26  ; 
INTERN  E        BVmq  N1:=N_32, N2:=N_26  ( EMF:=-0.0223029 * N_4.V * VImd.I, PARTDERIV:=1 ); 
INTERN  L        Laq  N1:=N_32, N2:=N_34  ( L:=0.0111515, I0:=0 ); 
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
 3.12414, 3.14159, 1, 0, -0.0206783, -0.0510451, -0.0946335, -0.13738,\
 -0.164902, -0.179442, -0.187336, -0.192124, -0.195324, -0.197609, -0.199323,\
 -0.20067, -0.201786, -0.20277, -0.203706, -0.204667, -0.205732, -0.20699,\
 -0.208561, -0.210609, -0.213389, -0.217338, -0.223328, -0.233349, -0.25207,\
 -0.287865, -0.343607, -0.399909, -0.437597, -0.460406, -0.478941, -0.501973,\
 -0.532834, -0.562569, -0.581797, -0.592131, -0.597867, -0.601413, -0.603814,\
 -0.605542, -0.606842, -0.607861, -0.6087, -0.609432, -0.610116, -0.610808,\
 -0.611563, -0.612446, -0.61354, -0.614964, -0.616901, -0.619665, -0.623895,\
 -0.631058, -0.64462, -0.670807, -0.711687, -0.752563, -0.778739, -0.792282,\
 -0.799417, -0.803608, -0.80632, -0.808188, -0.809522, -0.8105, -0.811231,\
 -0.811789, -0.812224, -0.812573, -0.812863, -0.813116, -0.813348, -0.813578,\
 -0.813822, -0.814099, -0.814432, -0.814852, -0.815403, -0.816151, -0.817203,\
 -0.818751, -0.821195, -0.825479, -0.833867, -0.850434, -0.876441, -0.901882,\
 -0.916539, -0.920811, -0.916539, -0.901882, -0.876441, -0.850434, -0.833867,\
 -0.825479, -0.821195, -0.818751, -0.817203, -0.816151, -0.815403, -0.814852,\
 -0.814432, -0.814099, -0.813822, -0.813578, -0.813348, -0.813116, -0.812863,\
 -0.812573, -0.812224, -0.811789, -0.811231, -0.8105, -0.809522, -0.808188,\
 -0.80632, -0.803608, -0.799417, -0.792282, -0.778739, -0.752563, -0.711687,\
 -0.670807, -0.64462, -0.631058, -0.623895, -0.619665, -0.616901, -0.614964,\
 -0.61354, -0.612446, -0.611563, -0.610808, -0.610116, -0.609432, -0.6087,\
 -0.607861, -0.606842, -0.605542, -0.603814, -0.601413, -0.597867, -0.592131,\
 -0.581797, -0.562569, -0.532834, -0.501973, -0.478941, -0.460406, -0.437597,\
 -0.399909, -0.343607, -0.287865, -0.25207, -0.233349, -0.223328, -0.217338,\
 -0.213389, -0.210609, -0.208561, -0.20699, -0.205732, -0.204667, -0.203706,\
 -0.20277, -0.201786, -0.20067, -0.199323, -0.197609, -0.195324, -0.192124,\
 -0.187336, -0.179442, -0.164902, -0.13738, -0.0946335, -0.0510451, -0.0206783,\
 0, 0.0206783, 0.0510451, 0.0946335, 0.13738, 0.164902, 0.179442, 0.187336,\
 0.192124, 0.195324, 0.197609, 0.199323, 0.20067, 0.201786, 0.20277, 0.203706,\
 0.204667, 0.205732, 0.20699, 0.208561, 0.210609, 0.213389, 0.217338, 0.223328,\
 0.233349, 0.25207, 0.287865, 0.343607, 0.399909, 0.437597, 0.460406, 0.478941,\
 0.501973, 0.532834, 0.562569, 0.581797, 0.592131, 0.597867, 0.601413,\
 0.603814, 0.605542, 0.606842, 0.607861, 0.6087, 0.609432, 0.610116, 0.610808,\
 0.611563, 0.612446, 0.61354, 0.614964, 0.616901, 0.619665, 0.623895, 0.631058,\
 0.64462, 0.670807, 0.711687, 0.752563, 0.778739, 0.792282, 0.799417, 0.803608,\
 0.80632, 0.808188, 0.809522, 0.8105, 0.811231, 0.811789, 0.812224, 0.812573,\
 0.812863, 0.813116, 0.813348, 0.813578, 0.813822, 0.814099, 0.814432,\
 0.814852, 0.815403, 0.816151, 0.817203, 0.818751, 0.821195, 0.825479,\
 0.833867, 0.850434, 0.876441, 0.901882, 0.916539, 0.920811, 0.916539,\
 0.901882, 0.876441, 0.850434, 0.833867, 0.825479, 0.821195, 0.818751,\
 0.817203, 0.816151, 0.815403, 0.814852, 0.814432, 0.814099, 0.813822,\
 0.813578, 0.813348, 0.813116, 0.812863, 0.812573, 0.812224, 0.811789,\
 0.811231, 0.8105, 0.809522, 0.808188, 0.80632, 0.803608, 0.799417, 0.792282,\
 0.778739, 0.752563, 0.711687, 0.670807, 0.64462, 0.631058, 0.623895, 0.619665,\
 0.616901, 0.614964, 0.61354, 0.612446, 0.611563, 0.610808, 0.610116, 0.609432,\
 0.6087, 0.607861, 0.606842, 0.605542, 0.603814, 0.601413, 0.597867, 0.592131,\
 0.581797, 0.562569, 0.532834, 0.501973, 0.478941, 0.460406, 0.437597,\
 0.399909, 0.343607, 0.287865, 0.25207, 0.233349, 0.223328, 0.217338, 0.213389,\
 0.210609, 0.208561, 0.20699, 0.205732, 0.204667, 0.203706, 0.20277, 0.201786,\
 0.20067, 0.199323, 0.197609, 0.195324, 0.192124, 0.187336, 0.179442, 0.164902,\
 0.13738, 0.0946335, 0.0510451, 0.0206783, 0) PERIODIC NOSPLINE" );
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
 3.12414, 3.14159, 1, 0.914849, 0.911149, 0.898455, 0.876422, 0.853898,\
 0.839549, 0.832284, 0.82857, 0.826451, 0.825106, 0.824189, 0.823534, 0.823048,\
 0.822673, 0.82237, 0.822111, 0.821876, 0.821646, 0.821404, 0.821133, 0.820815,\
 0.820425, 0.819932, 0.819296, 0.818458, 0.817334, 0.815797, 0.813645,\
 0.810516, 0.805681, 0.797446, 0.781811, 0.751589, 0.704395, 0.657197,\
 0.626966, 0.611315, 0.603055, 0.598186, 0.595012, 0.5928, 0.591186, 0.589961,\
 0.588992, 0.588185, 0.58747, 0.586789, 0.586088, 0.585309, 0.584386, 0.583229,\
 0.581708, 0.579609, 0.576523, 0.571543, 0.562584, 0.545924, 0.520166,\
 0.493434, 0.473482, 0.457424, 0.437666, 0.405021, 0.356256, 0.307974,\
 0.276966, 0.26074, 0.252047, 0.246841, 0.243398, 0.24096, 0.239148, 0.237739,\
 0.236585, 0.235581, 0.234641, 0.233691, 0.232654, 0.231443, 0.229948,\
 0.228015, 0.225412, 0.221746, 0.21624, 0.207143, 0.190368, 0.1586, 0.10925,\
 0.0589271, 0.0238701, 0, -0.0238701, -0.0589271, -0.10925, -0.1586, -0.190368,\
 -0.207143, -0.21624, -0.221746, -0.225412, -0.228015, -0.229948, -0.231443,\
 -0.232654, -0.233691, -0.234641, -0.235581, -0.236585, -0.237739, -0.239148,\
 -0.24096, -0.243398, -0.246841, -0.252047, -0.26074, -0.276966, -0.307974,\
 -0.356256, -0.405021, -0.437666, -0.457424, -0.473482, -0.493434, -0.520166,\
 -0.545924, -0.562584, -0.571543, -0.576523, -0.579609, -0.581708, -0.583229,\
 -0.584386, -0.585309, -0.586088, -0.586789, -0.58747, -0.588185, -0.588992,\
 -0.589961, -0.591186, -0.5928, -0.595012, -0.598186, -0.603055, -0.611315,\
 -0.626966, -0.657197, -0.704395, -0.751589, -0.781811, -0.797446, -0.805681,\
 -0.810516, -0.813645, -0.815797, -0.817334, -0.818458, -0.819296, -0.819932,\
 -0.820425, -0.820815, -0.821133, -0.821404, -0.821646, -0.821876, -0.822111,\
 -0.82237, -0.822673, -0.823048, -0.823534, -0.824189, -0.825106, -0.826451,\
 -0.82857, -0.832284, -0.839549, -0.853898, -0.876422, -0.898455, -0.911149,\
 -0.914849, -0.911149, -0.898455, -0.876422, -0.853898, -0.839549, -0.832284,\
 -0.82857, -0.826451, -0.825106, -0.824189, -0.823534, -0.823048, -0.822673,\
 -0.82237, -0.822111, -0.821876, -0.821646, -0.821404, -0.821133, -0.820815,\
 -0.820425, -0.819932, -0.819296, -0.818458, -0.817334, -0.815797, -0.813645,\
 -0.810516, -0.805681, -0.797446, -0.781811, -0.751589, -0.704395, -0.657197,\
 -0.626966, -0.611315, -0.603055, -0.598186, -0.595012, -0.5928, -0.591186,\
 -0.589961, -0.588992, -0.588185, -0.58747, -0.586789, -0.586088, -0.585309,\
 -0.584386, -0.583229, -0.581708, -0.579609, -0.576523, -0.571543, -0.562584,\
 -0.545924, -0.520166, -0.493434, -0.473482, -0.457424, -0.437666, -0.405021,\
 -0.356256, -0.307974, -0.276966, -0.26074, -0.252047, -0.246841, -0.243398,\
 -0.24096, -0.239148, -0.237739, -0.236585, -0.235581, -0.234641, -0.233691,\
 -0.232654, -0.231443, -0.229948, -0.228015, -0.225412, -0.221746, -0.21624,\
 -0.207143, -0.190368, -0.1586, -0.10925, -0.0589271, -0.0238701, 0, 0.0238701,\
 0.0589271, 0.10925, 0.1586, 0.190368, 0.207143, 0.21624, 0.221746, 0.225412,\
 0.228015, 0.229948, 0.231443, 0.232654, 0.233691, 0.234641, 0.235581,\
 0.236585, 0.237739, 0.239148, 0.24096, 0.243398, 0.246841, 0.252047, 0.26074,\
 0.276966, 0.307974, 0.356256, 0.405021, 0.437666, 0.457424, 0.473482,\
 0.493434, 0.520166, 0.545924, 0.562584, 0.571543, 0.576523, 0.579609,\
 0.581708, 0.583229, 0.584386, 0.585309, 0.586088, 0.586789, 0.58747, 0.588185,\
 0.588992, 0.589961, 0.591186, 0.5928, 0.595012, 0.598186, 0.603055, 0.611315,\
 0.626966, 0.657197, 0.704395, 0.751589, 0.781811, 0.797446, 0.805681,\
 0.810516, 0.813645, 0.815797, 0.817334, 0.818458, 0.819296, 0.819932,\
 0.820425, 0.820815, 0.821133, 0.821404, 0.821646, 0.821876, 0.822111, 0.82237,\
 0.822673, 0.823048, 0.823534, 0.824189, 0.825106, 0.826451, 0.82857, 0.832284,\
 0.839549, 0.853898, 0.876422, 0.898455, 0.911149, 0.914849) PERIODIC NOSPLINE" );
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
 3.12414, 3.14159, 1, 0, -1.1955e-05, -2.46187e-05, -3.87434e-05, -5.51723e-05,\
 -7.48931e-05, -9.91016e-05, -0.000129283, -0.000167315, -0.000215606,\
 -0.000277279, -0.000356431, -0.00045849, -0.000590734, -0.000763043,\
 -0.000989018, -0.00128768, -0.0016861, -0.00222361, -0.00295878, -0.00398224,\
 -0.00544287, -0.00761112, -0.011051, -0.0170979, -0.0289501, -0.0523718,\
 -0.0891458, -0.125122, -0.145847, -0.151889, -0.145847, -0.125122, -0.0891458,\
 -0.0523718, -0.0289501, -0.0170979, -0.011051, -0.00761112, -0.00544287,\
 -0.00398224, -0.00295878, -0.00222361, -0.0016861, -0.00128768, -0.000989018,\
 -0.000763043, -0.000590734, -0.00045849, -0.000356431, -0.000277279,\
 -0.000215606, -0.000167315, -0.000129283, -9.91016e-05, -7.48931e-05,\
 -5.51723e-05, -3.87434e-05, -2.46187e-05, -1.1955e-05, 0, 1.1955e-05,\
 2.46187e-05, 3.87434e-05, 5.51723e-05, 7.48931e-05, 9.91016e-05, 0.000129283,\
 0.000167315, 0.000215606, 0.000277279, 0.000356431, 0.00045849, 0.000590734,\
 0.000763043, 0.000989018, 0.00128768, 0.0016861, 0.00222361, 0.00295878,\
 0.00398224, 0.00544287, 0.00761112, 0.011051, 0.0170979, 0.0289501, 0.0523718,\
 0.0891458, 0.125122, 0.145847, 0.151889, 0.145847, 0.125122, 0.0891458,\
 0.0523718, 0.0289501, 0.0170979, 0.011051, 0.00761112, 0.00544287, 0.00398224,\
 0.00295878, 0.00222361, 0.0016861, 0.00128768, 0.000989018, 0.000763043,\
 0.000590734, 0.00045849, 0.000356431, 0.000277279, 0.000215606, 0.000167315,\
 0.000129283, 9.91016e-05, 7.48931e-05, 5.51723e-05, 3.87434e-05, 2.46187e-05,\
 1.1955e-05, 0, -1.1955e-05, -2.46187e-05, -3.87434e-05, -5.51723e-05,\
 -7.48931e-05, -9.91016e-05, -0.000129283, -0.000167315, -0.000215606,\
 -0.000277279, -0.000356431, -0.00045849, -0.000590734, -0.000763043,\
 -0.000989018, -0.00128768, -0.0016861, -0.00222361, -0.00295878, -0.00398224,\
 -0.00544287, -0.00761112, -0.011051, -0.0170979, -0.0289501, -0.0523718,\
 -0.0891458, -0.125122, -0.145847, -0.151889, -0.145847, -0.125122, -0.0891458,\
 -0.0523718, -0.0289501, -0.0170979, -0.011051, -0.00761112, -0.00544287,\
 -0.00398224, -0.00295878, -0.00222361, -0.0016861, -0.00128768, -0.000989018,\
 -0.000763043, -0.000590734, -0.00045849, -0.000356431, -0.000277279,\
 -0.000215606, -0.000167315, -0.000129283, -9.91016e-05, -7.48931e-05,\
 -5.51723e-05, -3.87434e-05, -2.46187e-05, -1.1955e-05, 0, 1.1955e-05,\
 2.46187e-05, 3.87434e-05, 5.51723e-05, 7.48931e-05, 9.91016e-05, 0.000129283,\
 0.000167315, 0.000215606, 0.000277279, 0.000356431, 0.00045849, 0.000590734,\
 0.000763043, 0.000989018, 0.00128768, 0.0016861, 0.00222361, 0.00295878,\
 0.00398224, 0.00544287, 0.00761112, 0.011051, 0.0170979, 0.0289501, 0.0523718,\
 0.0891458, 0.125122, 0.145847, 0.151889, 0.145847, 0.125122, 0.0891458,\
 0.0523718, 0.0289501, 0.0170979, 0.011051, 0.00761112, 0.00544287, 0.00398224,\
 0.00295878, 0.00222361, 0.0016861, 0.00128768, 0.000989018, 0.000763043,\
 0.000590734, 0.00045849, 0.000356431, 0.000277279, 0.000215606, 0.000167315,\
 0.000129283, 9.91016e-05, 7.48931e-05, 5.51723e-05, 3.87434e-05, 2.46187e-05,\
 1.1955e-05, 0, -1.1955e-05, -2.46187e-05, -3.87434e-05, -5.51723e-05,\
 -7.48931e-05, -9.91016e-05, -0.000129283, -0.000167315, -0.000215606,\
 -0.000277279, -0.000356431, -0.00045849, -0.000590734, -0.000763043,\
 -0.000989018, -0.00128768, -0.0016861, -0.00222361, -0.00295878, -0.00398224,\
 -0.00544287, -0.00761112, -0.011051, -0.0170979, -0.0289501, -0.0523718,\
 -0.0891458, -0.125122, -0.145847, -0.151889, -0.145847, -0.125122, -0.0891458,\
 -0.0523718, -0.0289501, -0.0170979, -0.011051, -0.00761112, -0.00544287,\
 -0.00398224, -0.00295878, -0.00222361, -0.0016861, -0.00128768, -0.000989018,\
 -0.000763043, -0.000590734, -0.00045849, -0.000356431, -0.000277279,\
 -0.000215606, -0.000167315, -0.000129283, -9.91016e-05, -7.48931e-05,\
 -5.51723e-05, -3.87434e-05, -2.46187e-05, -1.1955e-05, 0, 1.1955e-05,\
 2.46187e-05, 3.87434e-05, 5.51723e-05, 7.48931e-05, 9.91016e-05, 0.000129283,\
 0.000167315, 0.000215606, 0.000277279, 0.000356431, 0.00045849, 0.000590734,\
 0.000763043, 0.000989018, 0.00128768, 0.0016861, 0.00222361, 0.00295878,\
 0.00398224, 0.00544287, 0.00761112, 0.011051, 0.0170979, 0.0289501, 0.0523718,\
 0.0891458, 0.125122, 0.145847, 0.151889, 0.145847, 0.125122, 0.0891458,\
 0.0523718, 0.0289501, 0.0170979, 0.011051, 0.00761112, 0.00544287, 0.00398224,\
 0.00295878, 0.00222361, 0.0016861, 0.00128768, 0.000989018, 0.000763043,\
 0.000590734, 0.00045849, 0.000356431, 0.000277279, 0.000215606, 0.000167315,\
 0.000129283, 9.91016e-05, 7.48931e-05, 5.51723e-05, 3.87434e-05, 2.46187e-05,\
 1.1955e-05, 0) PERIODIC NOSPLINE" );
}

}