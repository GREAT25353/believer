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

INTERN  R        Ra  N1:=A, N2:=N0_1  ( R:=1.12615 ); 
INTERN  R        Rb  N1:=B, N2:=N0_2  ( R:=1.12615 ); 
INTERN  R        Rc  N1:=C, N2:=N0_3  ( R:=1.12615 ); 
INTERN  L        La  N1:=N0_1, N2:=N0_4  ( L:=0.00160828, I0:=0 ); 
INTERN  L        Lb  N1:=N0_2, N2:=N0_5  ( L:=0.00160828, I0:=0 ); 
INTERN  L        Lc  N1:=N0_3, N2:=N0_6  ( L:=0.00160828, I0:=0 ); 
INTERN  M        Kab  ( L1:= La.L, L2:= Lb.L, K:=-0.0862198 ); 
INTERN  M        Kbc  ( L1:= Lb.L, L2:= Lc.L, K:=-0.0862198 ); 
INTERN  M        Kca  ( L1:= Lc.L, L2:= La.L, K:=-0.0862198 ); 
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
INTERN  E        BVmd  N1:=N_31, N2:=N_25  ( EMF:=0.0121652 * N_4.V * VImq.I, PARTDERIV:=1 ); 
INTERN  L        Lad  N1:=N_31, N2:=N_33  ( L:=0.00608262, I0:=0 ); 
INTERN  AM       VImd  N1:=N_33, N2:=GND  ; 
INTERN  I        BI1q  N1:=GND, N2:=N_24  ( IS:=VIa.I*sin(N_8.V) - VIb.I*cos(N_8.V), PARTDERIV:=1 ); 
INTERN  AM       VI1q  N1:=N_24, N2:=N_26  ; 
INTERN  E        BVmq  N1:=N_32, N2:=N_26  ( EMF:=-0.0121652 * N_4.V * VImd.I, PARTDERIV:=1 ); 
INTERN  L        Laq  N1:=N_32, N2:=N_34  ( L:=0.00608262, I0:=0 ); 
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
 3.12414, 3.14159, 1, 0, -0.013927, -0.0343793, -0.0637365, -0.092527,\
 -0.111063, -0.120856, -0.126173, -0.129397, -0.131552, -0.133091, -0.134246,\
 -0.135153, -0.135904, -0.136568, -0.137198, -0.137845, -0.138562, -0.13941,\
 -0.140468, -0.141847, -0.143719, -0.146379, -0.150413, -0.157162, -0.169772,\
 -0.19388, -0.231422, -0.269342, -0.294726, -0.310087, -0.322571, -0.338084,\
 -0.358868, -0.378895, -0.391845, -0.398805, -0.402669, -0.405057, -0.406674,\
 -0.407838, -0.408714, -0.4094, -0.409965, -0.410458, -0.410919, -0.411385,\
 -0.411893, -0.412488, -0.413225, -0.414184, -0.415488, -0.41735, -0.420199,\
 -0.425023, -0.434158, -0.451795, -0.479327, -0.506858, -0.524488, -0.533609,\
 -0.538415, -0.541237, -0.543064, -0.544322, -0.54522, -0.545879, -0.546372,\
 -0.546747, -0.54704, -0.547276, -0.547471, -0.547641, -0.547798, -0.547952,\
 -0.548117, -0.548303, -0.548527, -0.54881, -0.549181, -0.549685, -0.550394,\
 -0.551436, -0.553082, -0.555968, -0.561617, -0.572775, -0.590291, -0.607426,\
 -0.617297, -0.620175, -0.617297, -0.607426, -0.590291, -0.572775, -0.561617,\
 -0.555968, -0.553082, -0.551436, -0.550394, -0.549685, -0.549181, -0.54881,\
 -0.548527, -0.548303, -0.548117, -0.547952, -0.547798, -0.547641, -0.547471,\
 -0.547276, -0.54704, -0.546747, -0.546372, -0.545879, -0.54522, -0.544322,\
 -0.543064, -0.541237, -0.538415, -0.533609, -0.524488, -0.506858, -0.479327,\
 -0.451795, -0.434158, -0.425023, -0.420199, -0.41735, -0.415488, -0.414184,\
 -0.413225, -0.412488, -0.411893, -0.411385, -0.410919, -0.410458, -0.409965,\
 -0.4094, -0.408714, -0.407838, -0.406674, -0.405057, -0.402669, -0.398805,\
 -0.391845, -0.378895, -0.358868, -0.338084, -0.322571, -0.310087, -0.294726,\
 -0.269342, -0.231422, -0.19388, -0.169772, -0.157162, -0.150413, -0.146379,\
 -0.143719, -0.141847, -0.140468, -0.13941, -0.138562, -0.137845, -0.137198,\
 -0.136568, -0.135904, -0.135153, -0.134246, -0.133091, -0.131552, -0.129397,\
 -0.126173, -0.120856, -0.111063, -0.092527, -0.0637365, -0.0343793, -0.013927,\
 0, 0.013927, 0.0343793, 0.0637365, 0.092527, 0.111063, 0.120856, 0.126173,\
 0.129397, 0.131552, 0.133091, 0.134246, 0.135153, 0.135904, 0.136568,\
 0.137198, 0.137845, 0.138562, 0.13941, 0.140468, 0.141847, 0.143719, 0.146379,\
 0.150413, 0.157162, 0.169772, 0.19388, 0.231422, 0.269342, 0.294726, 0.310087,\
 0.322571, 0.338084, 0.358868, 0.378895, 0.391845, 0.398805, 0.402669,\
 0.405057, 0.406674, 0.407838, 0.408714, 0.4094, 0.409965, 0.410458, 0.410919,\
 0.411385, 0.411893, 0.412488, 0.413225, 0.414184, 0.415488, 0.41735, 0.420199,\
 0.425023, 0.434158, 0.451795, 0.479327, 0.506858, 0.524488, 0.533609,\
 0.538415, 0.541237, 0.543064, 0.544322, 0.54522, 0.545879, 0.546372, 0.546747,\
 0.54704, 0.547276, 0.547471, 0.547641, 0.547798, 0.547952, 0.548117, 0.548303,\
 0.548527, 0.54881, 0.549181, 0.549685, 0.550394, 0.551436, 0.553082, 0.555968,\
 0.561617, 0.572775, 0.590291, 0.607426, 0.617297, 0.620175, 0.617297,\
 0.607426, 0.590291, 0.572775, 0.561617, 0.555968, 0.553082, 0.551436,\
 0.550394, 0.549685, 0.549181, 0.54881, 0.548527, 0.548303, 0.548117, 0.547952,\
 0.547798, 0.547641, 0.547471, 0.547276, 0.54704, 0.546747, 0.546372, 0.545879,\
 0.54522, 0.544322, 0.543064, 0.541237, 0.538415, 0.533609, 0.524488, 0.506858,\
 0.479327, 0.451795, 0.434158, 0.425023, 0.420199, 0.41735, 0.415488, 0.414184,\
 0.413225, 0.412488, 0.411893, 0.411385, 0.410919, 0.410458, 0.409965, 0.4094,\
 0.408714, 0.407838, 0.406674, 0.405057, 0.402669, 0.398805, 0.391845,\
 0.378895, 0.358868, 0.338084, 0.322571, 0.310087, 0.294726, 0.269342,\
 0.231422, 0.19388, 0.169772, 0.157162, 0.150413, 0.146379, 0.143719, 0.141847,\
 0.140468, 0.13941, 0.138562, 0.137845, 0.137198, 0.136568, 0.135904, 0.135153,\
 0.134246, 0.133091, 0.131552, 0.129397, 0.126173, 0.120856, 0.111063,\
 0.092527, 0.0637365, 0.0343793, 0.013927, 0) PERIODIC NOSPLINE" );
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
 3.12414, 3.14159, 1, 0.616159, 0.613667, 0.605118, 0.590278, 0.575108,\
 0.565444, 0.560551, 0.55805, 0.556622, 0.555716, 0.555099, 0.554658, 0.55433,\
 0.554078, 0.553874, 0.553699, 0.553541, 0.553386, 0.553223, 0.553041,\
 0.552826, 0.552563, 0.552232, 0.551803, 0.551239, 0.550482, 0.549447,\
 0.547997, 0.54589, 0.542633, 0.537087, 0.526557, 0.506202, 0.474416, 0.442628,\
 0.422267, 0.411726, 0.406163, 0.402884, 0.400746, 0.399256, 0.398169,\
 0.397344, 0.396691, 0.396148, 0.395666, 0.395208, 0.394736, 0.394211,\
 0.393589, 0.39281, 0.391786, 0.390372, 0.388294, 0.38494, 0.378905, 0.367685,\
 0.350336, 0.332332, 0.318895, 0.30808, 0.294772, 0.272786, 0.239942, 0.207423,\
 0.186539, 0.175611, 0.169756, 0.16625, 0.16393, 0.162289, 0.161069, 0.160119,\
 0.159342, 0.158666, 0.158033, 0.157393, 0.156695, 0.155879, 0.154872, 0.15357,\
 0.151817, 0.149348, 0.14564, 0.139513, 0.128214, 0.106819, 0.073581,\
 0.0396879, 0.0160768, 0, -0.0160768, -0.0396879, -0.073581, -0.106819,\
 -0.128214, -0.139513, -0.14564, -0.149348, -0.151817, -0.15357, -0.154872,\
 -0.155879, -0.156695, -0.157393, -0.158033, -0.158666, -0.159342, -0.160119,\
 -0.161069, -0.162289, -0.16393, -0.16625, -0.169756, -0.175611, -0.186539,\
 -0.207423, -0.239942, -0.272786, -0.294772, -0.30808, -0.318895, -0.332332,\
 -0.350336, -0.367685, -0.378905, -0.38494, -0.388294, -0.390372, -0.391786,\
 -0.39281, -0.393589, -0.394211, -0.394736, -0.395208, -0.395666, -0.396148,\
 -0.396691, -0.397344, -0.398169, -0.399256, -0.400746, -0.402884, -0.406163,\
 -0.411726, -0.422267, -0.442628, -0.474416, -0.506202, -0.526557, -0.537087,\
 -0.542633, -0.54589, -0.547997, -0.549447, -0.550482, -0.551239, -0.551803,\
 -0.552232, -0.552563, -0.552826, -0.553041, -0.553223, -0.553386, -0.553541,\
 -0.553699, -0.553874, -0.554078, -0.55433, -0.554658, -0.555099, -0.555716,\
 -0.556622, -0.55805, -0.560551, -0.565444, -0.575108, -0.590278, -0.605118,\
 -0.613667, -0.616159, -0.613667, -0.605118, -0.590278, -0.575108, -0.565444,\
 -0.560551, -0.55805, -0.556622, -0.555716, -0.555099, -0.554658, -0.55433,\
 -0.554078, -0.553874, -0.553699, -0.553541, -0.553386, -0.553223, -0.553041,\
 -0.552826, -0.552563, -0.552232, -0.551803, -0.551239, -0.550482, -0.549447,\
 -0.547997, -0.54589, -0.542633, -0.537087, -0.526557, -0.506202, -0.474416,\
 -0.442628, -0.422267, -0.411726, -0.406163, -0.402884, -0.400746, -0.399256,\
 -0.398169, -0.397344, -0.396691, -0.396148, -0.395666, -0.395208, -0.394736,\
 -0.394211, -0.393589, -0.39281, -0.391786, -0.390372, -0.388294, -0.38494,\
 -0.378905, -0.367685, -0.350336, -0.332332, -0.318895, -0.30808, -0.294772,\
 -0.272786, -0.239942, -0.207423, -0.186539, -0.175611, -0.169756, -0.16625,\
 -0.16393, -0.162289, -0.161069, -0.160119, -0.159342, -0.158666, -0.158033,\
 -0.157393, -0.156695, -0.155879, -0.154872, -0.15357, -0.151817, -0.149348,\
 -0.14564, -0.139513, -0.128214, -0.106819, -0.073581, -0.0396879, -0.0160768,\
 0, 0.0160768, 0.0396879, 0.073581, 0.106819, 0.128214, 0.139513, 0.14564,\
 0.149348, 0.151817, 0.15357, 0.154872, 0.155879, 0.156695, 0.157393, 0.158033,\
 0.158666, 0.159342, 0.160119, 0.161069, 0.162289, 0.16393, 0.16625, 0.169756,\
 0.175611, 0.186539, 0.207423, 0.239942, 0.272786, 0.294772, 0.30808, 0.318895,\
 0.332332, 0.350336, 0.367685, 0.378905, 0.38494, 0.388294, 0.390372, 0.391786,\
 0.39281, 0.393589, 0.394211, 0.394736, 0.395208, 0.395666, 0.396148, 0.396691,\
 0.397344, 0.398169, 0.399256, 0.400746, 0.402884, 0.406163, 0.411726,\
 0.422267, 0.442628, 0.474416, 0.506202, 0.526557, 0.537087, 0.542633, 0.54589,\
 0.547997, 0.549447, 0.550482, 0.551239, 0.551803, 0.552232, 0.552563,\
 0.552826, 0.553041, 0.553223, 0.553386, 0.553541, 0.553699, 0.553874,\
 0.554078, 0.55433, 0.554658, 0.555099, 0.555716, 0.556622, 0.55805, 0.560551,\
 0.565444, 0.575108, 0.590278, 0.605118, 0.613667, 0.616159) PERIODIC NOSPLINE" );
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
 3.12414, 3.14159, 1, 0, -8.05181e-06, -1.65809e-05, -2.6094e-05, -3.71591e-05,\
 -5.04412e-05, -6.67458e-05, -8.70733e-05, -0.000112688, -0.000145213,\
 -0.00018675, -0.00024006, -0.000308797, -0.000397865, -0.000513917,\
 -0.000666113, -0.000867265, -0.00113561, -0.00149762, -0.00199277,\
 -0.00268208, -0.00366583, -0.00512616, -0.00744298, -0.0115156, -0.0194982,\
 -0.0352729, -0.0600405, -0.0842708, -0.0982295, -0.102299, -0.0982295,\
 -0.0842708, -0.0600405, -0.0352729, -0.0194982, -0.0115156, -0.00744298,\
 -0.00512616, -0.00366583, -0.00268208, -0.00199277, -0.00149762, -0.00113561,\
 -0.000867265, -0.000666113, -0.000513917, -0.000397865, -0.000308797,\
 -0.00024006, -0.00018675, -0.000145213, -0.000112688, -8.70733e-05,\
 -6.67458e-05, -5.04412e-05, -3.71591e-05, -2.6094e-05, -1.65809e-05,\
 -8.05181e-06, 0, 8.05181e-06, 1.65809e-05, 2.6094e-05, 3.71591e-05,\
 5.04412e-05, 6.67458e-05, 8.70733e-05, 0.000112688, 0.000145213, 0.00018675,\
 0.00024006, 0.000308797, 0.000397865, 0.000513917, 0.000666113, 0.000867265,\
 0.00113561, 0.00149762, 0.00199277, 0.00268208, 0.00366583, 0.00512616,\
 0.00744298, 0.0115156, 0.0194982, 0.0352729, 0.0600405, 0.0842708, 0.0982295,\
 0.102299, 0.0982295, 0.0842708, 0.0600405, 0.0352729, 0.0194982, 0.0115156,\
 0.00744298, 0.00512616, 0.00366583, 0.00268208, 0.00199277, 0.00149762,\
 0.00113561, 0.000867265, 0.000666113, 0.000513917, 0.000397865, 0.000308797,\
 0.00024006, 0.00018675, 0.000145213, 0.000112688, 8.70733e-05, 6.67458e-05,\
 5.04412e-05, 3.71591e-05, 2.6094e-05, 1.65809e-05, 8.05181e-06, 0,\
 -8.05181e-06, -1.65809e-05, -2.6094e-05, -3.71591e-05, -5.04412e-05,\
 -6.67458e-05, -8.70733e-05, -0.000112688, -0.000145213, -0.00018675,\
 -0.00024006, -0.000308797, -0.000397865, -0.000513917, -0.000666113,\
 -0.000867265, -0.00113561, -0.00149762, -0.00199277, -0.00268208, -0.00366583,\
 -0.00512616, -0.00744298, -0.0115156, -0.0194982, -0.0352729, -0.0600405,\
 -0.0842708, -0.0982295, -0.102299, -0.0982295, -0.0842708, -0.0600405,\
 -0.0352729, -0.0194982, -0.0115156, -0.00744298, -0.00512616, -0.00366583,\
 -0.00268208, -0.00199277, -0.00149762, -0.00113561, -0.000867265,\
 -0.000666113, -0.000513917, -0.000397865, -0.000308797, -0.00024006,\
 -0.00018675, -0.000145213, -0.000112688, -8.70733e-05, -6.67458e-05,\
 -5.04412e-05, -3.71591e-05, -2.6094e-05, -1.65809e-05, -8.05181e-06, 0,\
 8.05181e-06, 1.65809e-05, 2.6094e-05, 3.71591e-05, 5.04412e-05, 6.67458e-05,\
 8.70733e-05, 0.000112688, 0.000145213, 0.00018675, 0.00024006, 0.000308797,\
 0.000397865, 0.000513917, 0.000666113, 0.000867265, 0.00113561, 0.00149762,\
 0.00199277, 0.00268208, 0.00366583, 0.00512616, 0.00744298, 0.0115156,\
 0.0194982, 0.0352729, 0.0600405, 0.0842708, 0.0982295, 0.102299, 0.0982295,\
 0.0842708, 0.0600405, 0.0352729, 0.0194982, 0.0115156, 0.00744298, 0.00512616,\
 0.00366583, 0.00268208, 0.00199277, 0.00149762, 0.00113561, 0.000867265,\
 0.000666113, 0.000513917, 0.000397865, 0.000308797, 0.00024006, 0.00018675,\
 0.000145213, 0.000112688, 8.70733e-05, 6.67458e-05, 5.04412e-05, 3.71591e-05,\
 2.6094e-05, 1.65809e-05, 8.05181e-06, 0, -8.05181e-06, -1.65809e-05,\
 -2.6094e-05, -3.71591e-05, -5.04412e-05, -6.67458e-05, -8.70733e-05,\
 -0.000112688, -0.000145213, -0.00018675, -0.00024006, -0.000308797,\
 -0.000397865, -0.000513917, -0.000666113, -0.000867265, -0.00113561,\
 -0.00149762, -0.00199277, -0.00268208, -0.00366583, -0.00512616, -0.00744298,\
 -0.0115156, -0.0194982, -0.0352729, -0.0600405, -0.0842708, -0.0982295,\
 -0.102299, -0.0982295, -0.0842708, -0.0600405, -0.0352729, -0.0194982,\
 -0.0115156, -0.00744298, -0.00512616, -0.00366583, -0.00268208, -0.00199277,\
 -0.00149762, -0.00113561, -0.000867265, -0.000666113, -0.000513917,\
 -0.000397865, -0.000308797, -0.00024006, -0.00018675, -0.000145213,\
 -0.000112688, -8.70733e-05, -6.67458e-05, -5.04412e-05, -3.71591e-05,\
 -2.6094e-05, -1.65809e-05, -8.05181e-06, 0, 8.05181e-06, 1.65809e-05,\
 2.6094e-05, 3.71591e-05, 5.04412e-05, 6.67458e-05, 8.70733e-05, 0.000112688,\
 0.000145213, 0.00018675, 0.00024006, 0.000308797, 0.000397865, 0.000513917,\
 0.000666113, 0.000867265, 0.00113561, 0.00149762, 0.00199277, 0.00268208,\
 0.00366583, 0.00512616, 0.00744298, 0.0115156, 0.0194982, 0.0352729,\
 0.0600405, 0.0842708, 0.0982295, 0.102299, 0.0982295, 0.0842708, 0.0600405,\
 0.0352729, 0.0194982, 0.0115156, 0.00744298, 0.00512616, 0.00366583,\
 0.00268208, 0.00199277, 0.00149762, 0.00113561, 0.000867265, 0.000666113,\
 0.000513917, 0.000397865, 0.000308797, 0.00024006, 0.00018675, 0.000145213,\
 0.000112688, 8.70733e-05, 6.67458e-05, 5.04412e-05, 3.71591e-05, 2.6094e-05,\
 1.65809e-05, 8.05181e-06, 0) PERIODIC NOSPLINE" );
}

}