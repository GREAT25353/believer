' -------------------------------------------------------------------------------  
' Script Created by RMxprt Version 2016.0 to generate netlist for external circuit 
' Expect 3 args, first the project name,                                           
'                second the design name,                                           
'                third the path to export netlist                                  
' ---------------------------------------------------------------------------------
Dim oAnsoftApp
Dim oDesktop
Dim oProject
Dim oDesign
Dim oEditor
Dim oModule
On Error Resume Next
Set oAnsoftApp = CreateObject("Ansoft.ElectronicsDesktop")
On Error Goto 0
Set oArgs = AnsoftScript.arguments
Set oDesktop = oAnsoftApp.GetAppDesktop()
Set oProject = oDesktop.GetActiveProject
if (oArgs.Count > 0) then 
  oProject.InsertDesign "Maxwell Circuit", oArgs(0), "", ""
else
  oProject.InsertDesign "Maxwell Circuit", "", "", ""
end if
Set oDesign = oProject.GetActiveDesign()
Set oEditor = oDesign.SetActiveEditor("SchematicEditor")
oDesign.ChangeProperty Array("NAME:AllTabs", Array("NAME:LocalVariableTab", _
  Array("NAME:PropServers", "LocalVariables"), Array("NAME:NewProps", Array(_
  "NAME:Kle", "PropType:=", "VariableProp", "UserDef:=", true, "Value:=", "1"))))
oEditor.CreateComponent Array("NAME:ComponentProps", "Name:=", "Winding", _
  "Id:=", "14"), Array("NAME:Attributes", "Page:=", 1, "X:=", 0.15748, "Y:=", _
  0.01016, "Degrees:=", 0, "Flip:=", false) 
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PassedParameterTab", _
  Array("NAME:PropServers", "CompInst@Winding;14;0"), Array(_
  "NAME:ChangedProps", Array("NAME:name", "OverridingDef:=", true, "Value:=", _
  "PhaseA"))))
oEditor.CreateWire Array("NAME:WireData", "Id:=", "1", "Points:=", Array(_
  "(0.16256, 0.01016)", "(0.1651, 0.01016)")), Array("NAME:Attributes", _
  "Page:=", 1) 
oEditor.CreateComponent Array("NAME:ComponentProps", "Name:=", "Winding", _
  "Id:=", "21"), Array("NAME:Attributes", "Page:=", 1, "X:=", 0.15748, "Y:=", _
  0, "Degrees:=", 0, "Flip:=", false) 
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PassedParameterTab", _
  Array("NAME:PropServers", "CompInst@Winding;21;0"), Array(_
  "NAME:ChangedProps", Array("NAME:name", "OverridingDef:=", true, "Value:=", _
  "PhaseB"))))
oEditor.CreateWire Array("NAME:WireData", "Id:=", "1", "Points:=", Array(_
  "(0.16256, 0)", "(0.1651, 0)")), Array("NAME:Attributes", "Page:=", 1) 
oEditor.CreateComponent Array("NAME:ComponentProps", "Name:=", "Winding", _
  "Id:=", "28"), Array("NAME:Attributes", "Page:=", 1, "X:=", 0.15748, "Y:=", _
  -0.01016, "Degrees:=", 0, "Flip:=", false) 
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PassedParameterTab", _
  Array("NAME:PropServers", "CompInst@Winding;28;0"), Array(_
  "NAME:ChangedProps", Array("NAME:name", "OverridingDef:=", true, "Value:=", _
  "PhaseC"))))
oEditor.CreateWire Array("NAME:WireData", "Id:=", "1", "Points:=", Array(_
  "(0.16256, -0.01016)", "(0.1651, -0.01016)")), Array("NAME:Attributes", _
  "Page:=", 1) 
oEditor.CreateComponent Array("NAME:ComponentProps", "Name:=", "Res", "Id:=", _
  "35"), Array("NAME:Attributes", "Page:=", 1, "X:=", 0.14478, "Y:=", 0.01016, _
  "Degrees:=", 0, "Flip:=", false) 
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PassedParameterTab", _
  Array("NAME:PropServers", "CompInst@Res;35;0"), Array("NAME:ChangedProps", _
  Array("NAME:name", "OverridingDef:=", true, "Value:=", "A"))))
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PassedParameterTab", _
  Array("NAME:PropServers", "CompInst@Res;35;0"), Array("NAME:ChangedProps", _
  Array("NAME:R", "OverridingDef:=", true, "Value:=", "1.23155ohm"))))
oEditor.CreateWire Array("NAME:WireData", "Id:=", "1", "Points:=", Array(_
  "(0.14986, 0.01016)", "(0.1524, 0.01016)")), Array("NAME:Attributes", _
  "Page:=", 1) 
oEditor.CreateComponent Array("NAME:ComponentProps", "Name:=", "Res", "Id:=", _
  "42"), Array("NAME:Attributes", "Page:=", 1, "X:=", 0.14478, "Y:=", 0, _
  "Degrees:=", 0, "Flip:=", false) 
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PassedParameterTab", _
  Array("NAME:PropServers", "CompInst@Res;42;0"), Array("NAME:ChangedProps", _
  Array("NAME:name", "OverridingDef:=", true, "Value:=", "B"))))
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PassedParameterTab", _
  Array("NAME:PropServers", "CompInst@Res;42;0"), Array("NAME:ChangedProps", _
  Array("NAME:R", "OverridingDef:=", true, "Value:=", "1.23155ohm"))))
oEditor.CreateWire Array("NAME:WireData", "Id:=", "1", "Points:=", Array(_
  "(0.14986, 0)", "(0.1524, 0)")), Array("NAME:Attributes", "Page:=", 1) 
oEditor.CreateComponent Array("NAME:ComponentProps", "Name:=", "Res", "Id:=", _
  "49"), Array("NAME:Attributes", "Page:=", 1, "X:=", 0.14478, "Y:=", _
  -0.01016, "Degrees:=", 0, "Flip:=", false) 
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PassedParameterTab", _
  Array("NAME:PropServers", "CompInst@Res;49;0"), Array("NAME:ChangedProps", _
  Array("NAME:name", "OverridingDef:=", true, "Value:=", "C"))))
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PassedParameterTab", _
  Array("NAME:PropServers", "CompInst@Res;49;0"), Array("NAME:ChangedProps", _
  Array("NAME:R", "OverridingDef:=", true, "Value:=", "1.23155ohm"))))
oEditor.CreateWire Array("NAME:WireData", "Id:=", "1", "Points:=", Array(_
  "(0.14986, -0.01016)", "(0.1524, -0.01016)")), Array("NAME:Attributes", _
  "Page:=", 1) 
oEditor.CreateComponent Array("NAME:ComponentProps", "Name:=", "Ind", "Id:=", _
  "56"), Array("NAME:Attributes", "Page:=", 1, "X:=", 0.13208, "Y:=", 0.01016, _
  "Degrees:=", 0, "Flip:=", false) 
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PassedParameterTab", _
  Array("NAME:PropServers", "CompInst@Ind;56;0"), Array("NAME:ChangedProps", _
  Array("NAME:name", "OverridingDef:=", true, "Value:=", "A"))))
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PassedParameterTab", _
  Array("NAME:PropServers", "CompInst@Ind;56;0"), Array("NAME:ChangedProps", _
  Array("NAME:L", "OverridingDef:=", true, "Value:=", "0.000597162H*Kle"))))
oEditor.CreateWire Array("NAME:WireData", "Id:=", "1", "Points:=", Array(_
  "(0.13716, 0.01016)", "(0.1397, 0.01016)")), Array("NAME:Attributes", _
  "Page:=", 1) 
oEditor.CreateComponent Array("NAME:ComponentProps", "Name:=", "Ind", "Id:=", _
  "63"), Array("NAME:Attributes", "Page:=", 1, "X:=", 0.13208, "Y:=", 0, _
  "Degrees:=", 0, "Flip:=", false) 
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PassedParameterTab", _
  Array("NAME:PropServers", "CompInst@Ind;63;0"), Array("NAME:ChangedProps", _
  Array("NAME:name", "OverridingDef:=", true, "Value:=", "B"))))
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PassedParameterTab", _
  Array("NAME:PropServers", "CompInst@Ind;63;0"), Array("NAME:ChangedProps", _
  Array("NAME:L", "OverridingDef:=", true, "Value:=", "0.000597162H*Kle"))))
oEditor.CreateWire Array("NAME:WireData", "Id:=", "1", "Points:=", Array(_
  "(0.13716, 0)", "(0.1397, 0)")), Array("NAME:Attributes", "Page:=", 1) 
oEditor.CreateComponent Array("NAME:ComponentProps", "Name:=", "Ind", "Id:=", _
  "70"), Array("NAME:Attributes", "Page:=", 1, "X:=", 0.13208, "Y:=", _
  -0.01016, "Degrees:=", 0, "Flip:=", false) 
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PassedParameterTab", _
  Array("NAME:PropServers", "CompInst@Ind;70;0"), Array("NAME:ChangedProps", _
  Array("NAME:name", "OverridingDef:=", true, "Value:=", "C"))))
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PassedParameterTab", _
  Array("NAME:PropServers", "CompInst@Ind;70;0"), Array("NAME:ChangedProps", _
  Array("NAME:L", "OverridingDef:=", true, "Value:=", "0.000597162H*Kle"))))
oEditor.CreateWire Array("NAME:WireData", "Id:=", "1", "Points:=", Array(_
  "(0.13716, -0.01016)", "(0.1397, -0.01016)")), Array("NAME:Attributes", _
  "Page:=", 1) 
oEditor.CreateComponent Array("NAME:ComponentProps", "Name:=", "Ammeter", _
  "Id:=", "77"), Array("NAME:Attributes", "Page:=", 1, "X:=", 0.11938, "Y:=", _
  0.01016, "Degrees:=", 90, "Flip:=", false) 
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PassedParameterTab", _
  Array("NAME:PropServers", "CompInst@Ammeter;77;0"), Array(_
  "NAME:ChangedProps", Array("NAME:name", "OverridingDef:=", true, "Value:=", _
  "IA"))))
oEditor.CreateWire Array("NAME:WireData", "Id:=", "1", "Points:=", Array(_
  "(0.12446, 0.01016)", "(0.127, 0.01016)")), Array("NAME:Attributes", _
  "Page:=", 1) 
oEditor.CreateComponent Array("NAME:ComponentProps", "Name:=", "Ammeter", _
  "Id:=", "84"), Array("NAME:Attributes", "Page:=", 1, "X:=", 0.11938, "Y:=", _
  0, "Degrees:=", 90, "Flip:=", false) 
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PassedParameterTab", _
  Array("NAME:PropServers", "CompInst@Ammeter;84;0"), Array(_
  "NAME:ChangedProps", Array("NAME:name", "OverridingDef:=", true, "Value:=", _
  "IB"))))
oEditor.CreateWire Array("NAME:WireData", "Id:=", "1", "Points:=", Array(_
  "(0.12446, 0)", "(0.127, 0)")), Array("NAME:Attributes", "Page:=", 1) 
oEditor.CreateComponent Array("NAME:ComponentProps", "Name:=", "Ammeter", _
  "Id:=", "91"), Array("NAME:Attributes", "Page:=", 1, "X:=", 0.11938, "Y:=", _
  -0.01016, "Degrees:=", 90, "Flip:=", false) 
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PassedParameterTab", _
  Array("NAME:PropServers", "CompInst@Ammeter;91;0"), Array(_
  "NAME:ChangedProps", Array("NAME:name", "OverridingDef:=", true, "Value:=", _
  "IC"))))
oEditor.CreateWire Array("NAME:WireData", "Id:=", "1", "Points:=", Array(_
  "(0.12446, -0.01016)", "(0.127, -0.01016)")), Array("NAME:Attributes", _
  "Page:=", 1) 
oEditor.CreateWire Array("NAME:WireData", "Id:=", "1", "Points:=", Array(_
  "(0.1651, 0.01016)", "(0.1651, 0)")), Array("NAME:Attributes", "Page:=", 1) 
oEditor.CreateWire Array("NAME:WireData", "Id:=", "1", "Points:=", Array(_
  "(0.1651, 0)", "(0.1651, -0.01016)")), Array("NAME:Attributes", "Page:=", 1) 
oEditor.CreateWire Array("NAME:WireData", "Id:=", "1", "Points:=", Array(_
  "(0.1016, -0.0508)", "(0.1016, -0.04826)")), Array("NAME:Attributes", _
  "Page:=", 1) 
oEditor.CreateComponent Array("NAME:ComponentProps", "Name:=", "VPulse", _
  "Id:=", "98"), Array("NAME:Attributes", "Page:=", 1, "X:=", 0.1016, "Y:=", _
  -0.04318, "Degrees:=", 0, "Flip:=", false) 
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PassedParameterTab", _
  Array("NAME:PropServers", "CompInst@VPulse;98;0"), Array(_
  "NAME:ChangedProps", Array("NAME:V1", "OverridingDef:=", true, "Value:=", _
  "-1"))))
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PassedParameterTab", _
  Array("NAME:PropServers", "CompInst@VPulse;98;0"), Array(_
  "NAME:ChangedProps", Array("NAME:Td", "OverridingDef:=", true, "Value:=", _
  "15"))))
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PassedParameterTab", _
  Array("NAME:PropServers", "CompInst@VPulse;98;0"), Array(_
  "NAME:ChangedProps", Array("NAME:Tr", "OverridingDef:=", true, "Value:=", _
  "0"))))
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PassedParameterTab", _
  Array("NAME:PropServers", "CompInst@VPulse;98;0"), Array(_
  "NAME:ChangedProps", Array("NAME:Tf", "OverridingDef:=", true, "Value:=", _
  "0"))))
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PassedParameterTab", _
  Array("NAME:PropServers", "CompInst@VPulse;98;0"), Array(_
  "NAME:ChangedProps", Array("NAME:Pw", "OverridingDef:=", true, "Value:=", _
  "60"))))
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PassedParameterTab", _
  Array("NAME:PropServers", "CompInst@VPulse;98;0"), Array(_
  "NAME:ChangedProps", Array("NAME:Period", "OverridingDef:=", true, _
  "Value:=", "180"))))
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PassedParameterTab", _
  Array("NAME:PropServers", "CompInst@VPulse;98;0"), Array(_
  "NAME:ChangedProps", Array("NAME:Type", "OverridingDef:=", true, "Value:=", _
  "POS"))))
oEditor.CreateWire Array("NAME:WireData", "Id:=", "1", "Points:=", Array(_
  "(0.1143, -0.0508)", "(0.1143, -0.04826)")), Array("NAME:Attributes", _
  "Page:=", 1) 
oEditor.CreateComponent Array("NAME:ComponentProps", "Name:=", "VPulse", _
  "Id:=", "105"), Array("NAME:Attributes", "Page:=", 1, "X:=", 0.1143, "Y:=", _
  -0.04318, "Degrees:=", 0, "Flip:=", false) 
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PassedParameterTab", _
  Array("NAME:PropServers", "CompInst@VPulse;105;0"), Array(_
  "NAME:ChangedProps", Array("NAME:V1", "OverridingDef:=", true, "Value:=", _
  "-1"))))
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PassedParameterTab", _
  Array("NAME:PropServers", "CompInst@VPulse;105;0"), Array(_
  "NAME:ChangedProps", Array("NAME:Td", "OverridingDef:=", true, "Value:=", _
  "45"))))
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PassedParameterTab", _
  Array("NAME:PropServers", "CompInst@VPulse;105;0"), Array(_
  "NAME:ChangedProps", Array("NAME:Tr", "OverridingDef:=", true, "Value:=", _
  "0"))))
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PassedParameterTab", _
  Array("NAME:PropServers", "CompInst@VPulse;105;0"), Array(_
  "NAME:ChangedProps", Array("NAME:Tf", "OverridingDef:=", true, "Value:=", _
  "0"))))
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PassedParameterTab", _
  Array("NAME:PropServers", "CompInst@VPulse;105;0"), Array(_
  "NAME:ChangedProps", Array("NAME:Pw", "OverridingDef:=", true, "Value:=", _
  "60"))))
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PassedParameterTab", _
  Array("NAME:PropServers", "CompInst@VPulse;105;0"), Array(_
  "NAME:ChangedProps", Array("NAME:Period", "OverridingDef:=", true, _
  "Value:=", "180"))))
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PassedParameterTab", _
  Array("NAME:PropServers", "CompInst@VPulse;105;0"), Array(_
  "NAME:ChangedProps", Array("NAME:Type", "OverridingDef:=", true, "Value:=", _
  "POS"))))
oEditor.CreateWire Array("NAME:WireData", "Id:=", "1", "Points:=", Array(_
  "(0.127, -0.0508)", "(0.127, -0.04826)")), Array("NAME:Attributes", _
  "Page:=", 1) 
oEditor.CreateComponent Array("NAME:ComponentProps", "Name:=", "VPulse", _
  "Id:=", "112"), Array("NAME:Attributes", "Page:=", 1, "X:=", 0.127, "Y:=", _
  -0.04318, "Degrees:=", 0, "Flip:=", false) 
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PassedParameterTab", _
  Array("NAME:PropServers", "CompInst@VPulse;112;0"), Array(_
  "NAME:ChangedProps", Array("NAME:V1", "OverridingDef:=", true, "Value:=", _
  "-1"))))
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PassedParameterTab", _
  Array("NAME:PropServers", "CompInst@VPulse;112;0"), Array(_
  "NAME:ChangedProps", Array("NAME:Td", "OverridingDef:=", true, "Value:=", _
  "75"))))
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PassedParameterTab", _
  Array("NAME:PropServers", "CompInst@VPulse;112;0"), Array(_
  "NAME:ChangedProps", Array("NAME:Tr", "OverridingDef:=", true, "Value:=", _
  "0"))))
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PassedParameterTab", _
  Array("NAME:PropServers", "CompInst@VPulse;112;0"), Array(_
  "NAME:ChangedProps", Array("NAME:Tf", "OverridingDef:=", true, "Value:=", _
  "0"))))
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PassedParameterTab", _
  Array("NAME:PropServers", "CompInst@VPulse;112;0"), Array(_
  "NAME:ChangedProps", Array("NAME:Pw", "OverridingDef:=", true, "Value:=", _
  "60"))))
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PassedParameterTab", _
  Array("NAME:PropServers", "CompInst@VPulse;112;0"), Array(_
  "NAME:ChangedProps", Array("NAME:Period", "OverridingDef:=", true, _
  "Value:=", "180"))))
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PassedParameterTab", _
  Array("NAME:PropServers", "CompInst@VPulse;112;0"), Array(_
  "NAME:ChangedProps", Array("NAME:Type", "OverridingDef:=", true, "Value:=", _
  "POS"))))
oEditor.CreateWire Array("NAME:WireData", "Id:=", "1", "Points:=", Array(_
  "(0.1397, -0.0508)", "(0.1397, -0.04826)")), Array("NAME:Attributes", _
  "Page:=", 1) 
oEditor.CreateComponent Array("NAME:ComponentProps", "Name:=", "VPulse", _
  "Id:=", "119"), Array("NAME:Attributes", "Page:=", 1, "X:=", 0.1397, "Y:=", _
  -0.04318, "Degrees:=", 0, "Flip:=", false) 
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PassedParameterTab", _
  Array("NAME:PropServers", "CompInst@VPulse;119;0"), Array(_
  "NAME:ChangedProps", Array("NAME:V1", "OverridingDef:=", true, "Value:=", _
  "-1"))))
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PassedParameterTab", _
  Array("NAME:PropServers", "CompInst@VPulse;119;0"), Array(_
  "NAME:ChangedProps", Array("NAME:Td", "OverridingDef:=", true, "Value:=", _
  "105"))))
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PassedParameterTab", _
  Array("NAME:PropServers", "CompInst@VPulse;119;0"), Array(_
  "NAME:ChangedProps", Array("NAME:Tr", "OverridingDef:=", true, "Value:=", _
  "0"))))
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PassedParameterTab", _
  Array("NAME:PropServers", "CompInst@VPulse;119;0"), Array(_
  "NAME:ChangedProps", Array("NAME:Tf", "OverridingDef:=", true, "Value:=", _
  "0"))))
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PassedParameterTab", _
  Array("NAME:PropServers", "CompInst@VPulse;119;0"), Array(_
  "NAME:ChangedProps", Array("NAME:Pw", "OverridingDef:=", true, "Value:=", _
  "60"))))
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PassedParameterTab", _
  Array("NAME:PropServers", "CompInst@VPulse;119;0"), Array(_
  "NAME:ChangedProps", Array("NAME:Period", "OverridingDef:=", true, _
  "Value:=", "180"))))
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PassedParameterTab", _
  Array("NAME:PropServers", "CompInst@VPulse;119;0"), Array(_
  "NAME:ChangedProps", Array("NAME:Type", "OverridingDef:=", true, "Value:=", _
  "POS"))))
oEditor.CreateWire Array("NAME:WireData", "Id:=", "1", "Points:=", Array(_
  "(0.1524, -0.0508)", "(0.1524, -0.04826)")), Array("NAME:Attributes", _
  "Page:=", 1) 
oEditor.CreateComponent Array("NAME:ComponentProps", "Name:=", "VPulse", _
  "Id:=", "126"), Array("NAME:Attributes", "Page:=", 1, "X:=", 0.1524, "Y:=", _
  -0.04318, "Degrees:=", 0, "Flip:=", false) 
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PassedParameterTab", _
  Array("NAME:PropServers", "CompInst@VPulse;126;0"), Array(_
  "NAME:ChangedProps", Array("NAME:V1", "OverridingDef:=", true, "Value:=", _
  "-1"))))
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PassedParameterTab", _
  Array("NAME:PropServers", "CompInst@VPulse;126;0"), Array(_
  "NAME:ChangedProps", Array("NAME:Td", "OverridingDef:=", true, "Value:=", _
  "135"))))
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PassedParameterTab", _
  Array("NAME:PropServers", "CompInst@VPulse;126;0"), Array(_
  "NAME:ChangedProps", Array("NAME:Tr", "OverridingDef:=", true, "Value:=", _
  "0"))))
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PassedParameterTab", _
  Array("NAME:PropServers", "CompInst@VPulse;126;0"), Array(_
  "NAME:ChangedProps", Array("NAME:Tf", "OverridingDef:=", true, "Value:=", _
  "0"))))
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PassedParameterTab", _
  Array("NAME:PropServers", "CompInst@VPulse;126;0"), Array(_
  "NAME:ChangedProps", Array("NAME:Pw", "OverridingDef:=", true, "Value:=", _
  "60"))))
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PassedParameterTab", _
  Array("NAME:PropServers", "CompInst@VPulse;126;0"), Array(_
  "NAME:ChangedProps", Array("NAME:Period", "OverridingDef:=", true, _
  "Value:=", "180"))))
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PassedParameterTab", _
  Array("NAME:PropServers", "CompInst@VPulse;126;0"), Array(_
  "NAME:ChangedProps", Array("NAME:Type", "OverridingDef:=", true, "Value:=", _
  "POS"))))
oEditor.CreateWire Array("NAME:WireData", "Id:=", "1", "Points:=", Array(_
  "(0.1651, -0.0508)", "(0.1651, -0.04826)")), Array("NAME:Attributes", _
  "Page:=", 1) 
oEditor.CreateComponent Array("NAME:ComponentProps", "Name:=", "VPulse", _
  "Id:=", "133"), Array("NAME:Attributes", "Page:=", 1, "X:=", 0.1651, "Y:=", _
  -0.04318, "Degrees:=", 0, "Flip:=", false) 
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PassedParameterTab", _
  Array("NAME:PropServers", "CompInst@VPulse;133;0"), Array(_
  "NAME:ChangedProps", Array("NAME:V1", "OverridingDef:=", true, "Value:=", _
  "-1"))))
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PassedParameterTab", _
  Array("NAME:PropServers", "CompInst@VPulse;133;0"), Array(_
  "NAME:ChangedProps", Array("NAME:Td", "OverridingDef:=", true, "Value:=", _
  "165"))))
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PassedParameterTab", _
  Array("NAME:PropServers", "CompInst@VPulse;133;0"), Array(_
  "NAME:ChangedProps", Array("NAME:Tr", "OverridingDef:=", true, "Value:=", _
  "0"))))
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PassedParameterTab", _
  Array("NAME:PropServers", "CompInst@VPulse;133;0"), Array(_
  "NAME:ChangedProps", Array("NAME:Tf", "OverridingDef:=", true, "Value:=", _
  "0"))))
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PassedParameterTab", _
  Array("NAME:PropServers", "CompInst@VPulse;133;0"), Array(_
  "NAME:ChangedProps", Array("NAME:Pw", "OverridingDef:=", true, "Value:=", _
  "60"))))
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PassedParameterTab", _
  Array("NAME:PropServers", "CompInst@VPulse;133;0"), Array(_
  "NAME:ChangedProps", Array("NAME:Period", "OverridingDef:=", true, _
  "Value:=", "180"))))
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PassedParameterTab", _
  Array("NAME:PropServers", "CompInst@VPulse;133;0"), Array(_
  "NAME:ChangedProps", Array("NAME:Type", "OverridingDef:=", true, "Value:=", _
  "POS"))))
oEditor.CreateWire Array("NAME:WireData", "Id:=", "1", "Points:=", Array(_
  "(0.1016, -0.0381)", "(0.1016, -0.03556)")), Array("NAME:Attributes", _
  "Page:=", 1) 
oEditor.CreateComponent Array("NAME:ComponentProps", "Name:=", "Res", "Id:=", _
  "140"), Array("NAME:Attributes", "Page:=", 1, "X:=", 0.1016, "Y:=", _
  -0.03048, "Degrees:=", 90, "Flip:=", false) 
oEditor.CreateWire Array("NAME:WireData", "Id:=", "1", "Points:=", Array(_
  "(0.1143, -0.0381)", "(0.1143, -0.03556)")), Array("NAME:Attributes", _
  "Page:=", 1) 
oEditor.CreateComponent Array("NAME:ComponentProps", "Name:=", "Res", "Id:=", _
  "147"), Array("NAME:Attributes", "Page:=", 1, "X:=", 0.1143, "Y:=", _
  -0.03048, "Degrees:=", 90, "Flip:=", false) 
oEditor.CreateWire Array("NAME:WireData", "Id:=", "1", "Points:=", Array(_
  "(0.127, -0.0381)", "(0.127, -0.03556)")), Array("NAME:Attributes", _
  "Page:=", 1) 
oEditor.CreateComponent Array("NAME:ComponentProps", "Name:=", "Res", "Id:=", _
  "154"), Array("NAME:Attributes", "Page:=", 1, "X:=", 0.127, "Y:=", -0.03048, _
  "Degrees:=", 90, "Flip:=", false) 
oEditor.CreateWire Array("NAME:WireData", "Id:=", "1", "Points:=", Array(_
  "(0.1397, -0.0381)", "(0.1397, -0.03556)")), Array("NAME:Attributes", _
  "Page:=", 1) 
oEditor.CreateComponent Array("NAME:ComponentProps", "Name:=", "Res", "Id:=", _
  "161"), Array("NAME:Attributes", "Page:=", 1, "X:=", 0.1397, "Y:=", _
  -0.03048, "Degrees:=", 90, "Flip:=", false) 
oEditor.CreateWire Array("NAME:WireData", "Id:=", "1", "Points:=", Array(_
  "(0.1524, -0.0381)", "(0.1524, -0.03556)")), Array("NAME:Attributes", _
  "Page:=", 1) 
oEditor.CreateComponent Array("NAME:ComponentProps", "Name:=", "Res", "Id:=", _
  "168"), Array("NAME:Attributes", "Page:=", 1, "X:=", 0.1524, "Y:=", _
  -0.03048, "Degrees:=", 90, "Flip:=", false) 
oEditor.CreateWire Array("NAME:WireData", "Id:=", "1", "Points:=", Array(_
  "(0.1651, -0.0381)", "(0.1651, -0.03556)")), Array("NAME:Attributes", _
  "Page:=", 1) 
oEditor.CreateComponent Array("NAME:ComponentProps", "Name:=", "Res", "Id:=", _
  "175"), Array("NAME:Attributes", "Page:=", 1, "X:=", 0.1651, "Y:=", _
  -0.03048, "Degrees:=", 90, "Flip:=", false) 
oEditor.CreateWire Array("NAME:WireData", "Id:=", "1", "Points:=", Array(_
  "(0.1016, -0.0254)", "(0.1016, -0.02286)")), Array("NAME:Attributes", _
  "Page:=", 1) 
oEditor.CreateComponent Array("NAME:ComponentProps", "Name:=", "VoltmeterG", _
  "Id:=", "182"), Array("NAME:Attributes", "Page:=", 1, "X:=", 0.09652, "Y:=", _
  -0.03556, "Degrees:=", 90, "Flip:=", false) 
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PassedParameterTab", _
  Array("NAME:PropServers", "CompInst@VoltmeterG;182;0"), Array(_
  "NAME:ChangedProps", Array("NAME:name", "OverridingDef:=", true, "Value:=", _
  "Vc1"))))
oEditor.CreateWire Array("NAME:WireData", "Id:=", "1", "Points:=", Array(_
  "(0.1143, -0.0254)", "(0.1143, -0.02286)")), Array("NAME:Attributes", _
  "Page:=", 1) 
oEditor.CreateComponent Array("NAME:ComponentProps", "Name:=", "VoltmeterG", _
  "Id:=", "189"), Array("NAME:Attributes", "Page:=", 1, "X:=", 0.10922, "Y:=", _
  -0.03556, "Degrees:=", 90, "Flip:=", false) 
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PassedParameterTab", _
  Array("NAME:PropServers", "CompInst@VoltmeterG;189;0"), Array(_
  "NAME:ChangedProps", Array("NAME:name", "OverridingDef:=", true, "Value:=", _
  "Vc2"))))
oEditor.CreateWire Array("NAME:WireData", "Id:=", "1", "Points:=", Array(_
  "(0.127, -0.0254)", "(0.127, -0.02286)")), Array("NAME:Attributes", _
  "Page:=", 1) 
oEditor.CreateComponent Array("NAME:ComponentProps", "Name:=", "VoltmeterG", _
  "Id:=", "196"), Array("NAME:Attributes", "Page:=", 1, "X:=", 0.12192, "Y:=", _
  -0.03556, "Degrees:=", 90, "Flip:=", false) 
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PassedParameterTab", _
  Array("NAME:PropServers", "CompInst@VoltmeterG;196;0"), Array(_
  "NAME:ChangedProps", Array("NAME:name", "OverridingDef:=", true, "Value:=", _
  "Vc3"))))
oEditor.CreateWire Array("NAME:WireData", "Id:=", "1", "Points:=", Array(_
  "(0.1397, -0.0254)", "(0.1397, -0.02286)")), Array("NAME:Attributes", _
  "Page:=", 1) 
oEditor.CreateComponent Array("NAME:ComponentProps", "Name:=", "VoltmeterG", _
  "Id:=", "203"), Array("NAME:Attributes", "Page:=", 1, "X:=", 0.13462, "Y:=", _
  -0.03556, "Degrees:=", 90, "Flip:=", false) 
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PassedParameterTab", _
  Array("NAME:PropServers", "CompInst@VoltmeterG;203;0"), Array(_
  "NAME:ChangedProps", Array("NAME:name", "OverridingDef:=", true, "Value:=", _
  "Vc4"))))
oEditor.CreateWire Array("NAME:WireData", "Id:=", "1", "Points:=", Array(_
  "(0.1524, -0.0254)", "(0.1524, -0.02286)")), Array("NAME:Attributes", _
  "Page:=", 1) 
oEditor.CreateComponent Array("NAME:ComponentProps", "Name:=", "VoltmeterG", _
  "Id:=", "210"), Array("NAME:Attributes", "Page:=", 1, "X:=", 0.14732, "Y:=", _
  -0.03556, "Degrees:=", 90, "Flip:=", false) 
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PassedParameterTab", _
  Array("NAME:PropServers", "CompInst@VoltmeterG;210;0"), Array(_
  "NAME:ChangedProps", Array("NAME:name", "OverridingDef:=", true, "Value:=", _
  "Vc5"))))
oEditor.CreateWire Array("NAME:WireData", "Id:=", "1", "Points:=", Array(_
  "(0.1651, -0.0254)", "(0.1651, -0.02286)")), Array("NAME:Attributes", _
  "Page:=", 1) 
oEditor.CreateComponent Array("NAME:ComponentProps", "Name:=", "VoltmeterG", _
  "Id:=", "217"), Array("NAME:Attributes", "Page:=", 1, "X:=", 0.16002, "Y:=", _
  -0.03556, "Degrees:=", 90, "Flip:=", false) 
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PassedParameterTab", _
  Array("NAME:PropServers", "CompInst@VoltmeterG;217;0"), Array(_
  "NAME:ChangedProps", Array("NAME:name", "OverridingDef:=", true, "Value:=", _
  "Vc6"))))
oEditor.CreateWire Array("NAME:WireData", "Id:=", "1", "Points:=", Array(_
  "(0.1016, -0.0508)", "(0.1651, -0.0508)")), Array("NAME:Attributes", _
  "Page:=", 1) 
oEditor.CreateWire Array("NAME:WireData", "Id:=", "1", "Points:=", Array(_
  "(0.1016, -0.02286)", "(0.1651, -0.02286)")), Array("NAME:Attributes", _
  "Page:=", 1) 
oEditor.CreateGround Array("NAME:GroundProps", "Id:=", "7"), Array(_
  "NAME:Attributes", "Page:=", 1, "X:=", 0.1651, "Y:=", -0.05334, "Degrees:=", _
  0, "Flip:=", false) 
oEditor.CreateComponent Array("NAME:ComponentProps", "Name:=", "VDC", "Id:=", _
  "224"), Array("NAME:Attributes", "Page:=", 1, "X:=", 0, "Y:=", 0.0127, _
  "Degrees:=", 0, "Flip:=", false) 
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PassedParameterTab", _
  Array("NAME:PropServers", "CompInst@VDC;224;0"), Array("NAME:ChangedProps", _
  Array("NAME:V", "OverridingDef:=", true, "Value:=", "110V"))))
oEditor.CreateComponent Array("NAME:ComponentProps", "Name:=", "VDC", "Id:=", _
  "231"), Array("NAME:Attributes", "Page:=", 1, "X:=", 0, "Y:=", -0.0127, _
  "Degrees:=", 0, "Flip:=", false) 
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PassedParameterTab", _
  Array("NAME:PropServers", "CompInst@VDC;231;0"), Array("NAME:ChangedProps", _
  Array("NAME:V", "OverridingDef:=", true, "Value:=", "110V"))))
oEditor.CreateWire Array("NAME:WireData", "Id:=", "1", "Points:=", Array(_
  "(0, 0.01778)", "(0, 0.0508)", "(0.0889, 0.0508)")), Array(_
  "NAME:Attributes", "Page:=", 1) 
oEditor.CreateWire Array("NAME:WireData", "Id:=", "1", "Points:=", Array(_
  "(0, 0.00762)", "(0, -0.00762)")), Array("NAME:Attributes", "Page:=", 1) 
oEditor.CreateWire Array("NAME:WireData", "Id:=", "1", "Points:=", Array(_
  "(0, -0.01778)", "(0, -0.0508)", "(0.0889, -0.0508)")), Array(_
  "NAME:Attributes", "Page:=", 1) 
oEditor.CreateGround Array("NAME:GroundProps", "Id:=", "7"), Array(_
  "NAME:Attributes", "Page:=", 1, "X:=", -0.00508, "Y:=", -0.00254, _
  "Degrees:=", 0, "Flip:=", false) 
oEditor.CreateWire Array("NAME:WireData", "Id:=", "1", "Points:=", Array(_
  "(0, 0)", "(-0.00508, 0)")), Array("NAME:Attributes", "Page:=", 1) 
oEditor.CreateComponent Array("NAME:ComponentProps", "Name:=", "DIODE", "Id:=", _
  "238"), Array("NAME:Attributes", "Page:=", 1, "X:=", 0.0254, "Y:=", _
  -0.03048, "Degrees:=", 90, "Flip:=", false) 
oEditor.CreateWire Array("NAME:WireData", "Id:=", "1", "Points:=", Array(_
  "(0.0254, -0.0254)", "(0.0254, 0.0254)")), Array("NAME:Attributes", _
  "Page:=", 1) 
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PassedParameterTab", _
  Array("NAME:PropServers", "CompInst@DIODE;238;0"), Array(_
  "NAME:ChangedProps", Array("NAME:MOD", "OverridingDef:=", true, "Value:=", _
  "DModel1"))))
oEditor.CreateComponent Array("NAME:ComponentProps", "Name:=", "DIODE", "Id:=", _
  "245"), Array("NAME:Attributes", "Page:=", 1, "X:=", 0.0381, "Y:=", 0.03048, _
  "Degrees:=", 90, "Flip:=", false) 
oEditor.CreateWire Array("NAME:WireData", "Id:=", "1", "Points:=", Array(_
  "(0.0381, 0.03556)", "(0.0381, 0.0508)")), Array("NAME:Attributes", _
  "Page:=", 1) 
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PassedParameterTab", _
  Array("NAME:PropServers", "CompInst@DIODE;245;0"), Array(_
  "NAME:ChangedProps", Array("NAME:MOD", "OverridingDef:=", true, "Value:=", _
  "DModel1"))))
oEditor.CreateComponent Array("NAME:ComponentProps", "Name:=", "DIODE", "Id:=", _
  "252"), Array("NAME:Attributes", "Page:=", 1, "X:=", 0.0508, "Y:=", _
  -0.03048, "Degrees:=", 90, "Flip:=", false) 
oEditor.CreateWire Array("NAME:WireData", "Id:=", "1", "Points:=", Array(_
  "(0.0508, -0.0254)", "(0.0508, 0.0254)")), Array("NAME:Attributes", _
  "Page:=", 1) 
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PassedParameterTab", _
  Array("NAME:PropServers", "CompInst@DIODE;252;0"), Array(_
  "NAME:ChangedProps", Array("NAME:MOD", "OverridingDef:=", true, "Value:=", _
  "DModel1"))))
oEditor.CreateComponent Array("NAME:ComponentProps", "Name:=", "DIODE", "Id:=", _
  "259"), Array("NAME:Attributes", "Page:=", 1, "X:=", 0.0635, "Y:=", 0.03048, _
  "Degrees:=", 90, "Flip:=", false) 
oEditor.CreateWire Array("NAME:WireData", "Id:=", "1", "Points:=", Array(_
  "(0.0635, 0.03556)", "(0.0635, 0.0508)")), Array("NAME:Attributes", _
  "Page:=", 1) 
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PassedParameterTab", _
  Array("NAME:PropServers", "CompInst@DIODE;259;0"), Array(_
  "NAME:ChangedProps", Array("NAME:MOD", "OverridingDef:=", true, "Value:=", _
  "DModel1"))))
oEditor.CreateComponent Array("NAME:ComponentProps", "Name:=", "DIODE", "Id:=", _
  "266"), Array("NAME:Attributes", "Page:=", 1, "X:=", 0.0762, "Y:=", _
  -0.03048, "Degrees:=", 90, "Flip:=", false) 
oEditor.CreateWire Array("NAME:WireData", "Id:=", "1", "Points:=", Array(_
  "(0.0762, -0.0254)", "(0.0762, 0.0254)")), Array("NAME:Attributes", _
  "Page:=", 1) 
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PassedParameterTab", _
  Array("NAME:PropServers", "CompInst@DIODE;266;0"), Array(_
  "NAME:ChangedProps", Array("NAME:MOD", "OverridingDef:=", true, "Value:=", _
  "DModel1"))))
oEditor.CreateComponent Array("NAME:ComponentProps", "Name:=", "DIODE", "Id:=", _
  "273"), Array("NAME:Attributes", "Page:=", 1, "X:=", 0.0889, "Y:=", 0.03048, _
  "Degrees:=", 90, "Flip:=", false) 
oEditor.CreateWire Array("NAME:WireData", "Id:=", "1", "Points:=", Array(_
  "(0.0889, 0.03556)", "(0.0889, 0.0508)")), Array("NAME:Attributes", _
  "Page:=", 1) 
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PassedParameterTab", _
  Array("NAME:PropServers", "CompInst@DIODE;273;0"), Array(_
  "NAME:ChangedProps", Array("NAME:MOD", "OverridingDef:=", true, "Value:=", _
  "DModel1"))))
oEditor.CreateComponent Array("NAME:ComponentProps", "Name:=", "DIODE", "Id:=", _
  "280"), Array("NAME:Attributes", "Page:=", 1, "X:=", 0.0254, "Y:=", 0.04318, _
  "Degrees:=", -90, "Flip:=", false) 
oEditor.CreateWire Array("NAME:WireData", "Id:=", "1", "Points:=", Array(_
  "(0.0254, 0.04826)", "(0.0254, 0.0508)")), Array("NAME:Attributes", _
  "Page:=", 1) 
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PassedParameterTab", _
  Array("NAME:PropServers", "CompInst@DIODE;280;0"), Array(_
  "NAME:ChangedProps", Array("NAME:MOD", "OverridingDef:=", true, "Value:=", _
  "DModel1"))))
oEditor.CreateComponent Array("NAME:ComponentProps", "Name:=", "DIODE", "Id:=", _
  "287"), Array("NAME:Attributes", "Page:=", 1, "X:=", 0.0381, "Y:=", _
  -0.01778, "Degrees:=", -90, "Flip:=", false) 
oEditor.CreateWire Array("NAME:WireData", "Id:=", "1", "Points:=", Array(_
  "(0.0381, -0.0127)", "(0.0381, 0.0254)")), Array("NAME:Attributes", _
  "Page:=", 1) 
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PassedParameterTab", _
  Array("NAME:PropServers", "CompInst@DIODE;287;0"), Array(_
  "NAME:ChangedProps", Array("NAME:MOD", "OverridingDef:=", true, "Value:=", _
  "DModel1"))))
oEditor.CreateComponent Array("NAME:ComponentProps", "Name:=", "DIODE", "Id:=", _
  "294"), Array("NAME:Attributes", "Page:=", 1, "X:=", 0.0508, "Y:=", 0.04318, _
  "Degrees:=", -90, "Flip:=", false) 
oEditor.CreateWire Array("NAME:WireData", "Id:=", "1", "Points:=", Array(_
  "(0.0508, 0.04826)", "(0.0508, 0.0508)")), Array("NAME:Attributes", _
  "Page:=", 1) 
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PassedParameterTab", _
  Array("NAME:PropServers", "CompInst@DIODE;294;0"), Array(_
  "NAME:ChangedProps", Array("NAME:MOD", "OverridingDef:=", true, "Value:=", _
  "DModel1"))))
oEditor.CreateComponent Array("NAME:ComponentProps", "Name:=", "DIODE", "Id:=", _
  "301"), Array("NAME:Attributes", "Page:=", 1, "X:=", 0.0635, "Y:=", _
  -0.01778, "Degrees:=", -90, "Flip:=", false) 
oEditor.CreateWire Array("NAME:WireData", "Id:=", "1", "Points:=", Array(_
  "(0.0635, -0.0127)", "(0.0635, 0.0254)")), Array("NAME:Attributes", _
  "Page:=", 1) 
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PassedParameterTab", _
  Array("NAME:PropServers", "CompInst@DIODE;301;0"), Array(_
  "NAME:ChangedProps", Array("NAME:MOD", "OverridingDef:=", true, "Value:=", _
  "DModel1"))))
oEditor.CreateComponent Array("NAME:ComponentProps", "Name:=", "DIODE", "Id:=", _
  "308"), Array("NAME:Attributes", "Page:=", 1, "X:=", 0.0762, "Y:=", 0.04318, _
  "Degrees:=", -90, "Flip:=", false) 
oEditor.CreateWire Array("NAME:WireData", "Id:=", "1", "Points:=", Array(_
  "(0.0762, 0.04826)", "(0.0762, 0.0508)")), Array("NAME:Attributes", _
  "Page:=", 1) 
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PassedParameterTab", _
  Array("NAME:PropServers", "CompInst@DIODE;308;0"), Array(_
  "NAME:ChangedProps", Array("NAME:MOD", "OverridingDef:=", true, "Value:=", _
  "DModel1"))))
oEditor.CreateComponent Array("NAME:ComponentProps", "Name:=", "DIODE", "Id:=", _
  "315"), Array("NAME:Attributes", "Page:=", 1, "X:=", 0.0889, "Y:=", _
  -0.01778, "Degrees:=", -90, "Flip:=", false) 
oEditor.CreateWire Array("NAME:WireData", "Id:=", "1", "Points:=", Array(_
  "(0.0889, -0.0127)", "(0.0889, 0.0254)")), Array("NAME:Attributes", _
  "Page:=", 1) 
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PassedParameterTab", _
  Array("NAME:PropServers", "CompInst@DIODE;315;0"), Array(_
  "NAME:ChangedProps", Array("NAME:MOD", "OverridingDef:=", true, "Value:=", _
  "DModel1"))))
oEditor.CreateComponent Array("NAME:ComponentProps", "Name:=", "SW_V", "Id:=", _
  "322"), Array("NAME:Attributes", "Page:=", 1, "X:=", 0.0254, "Y:=", 0.03048, _
  "Degrees:=", -90, "Flip:=", false) 
oEditor.CreateWire Array("NAME:WireData", "Id:=", "1", "Points:=", Array(_
  "(0.0254, 0.03556)", "(0.0254, 0.0381)")), Array("NAME:Attributes", _
  "Page:=", 1) 
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PassedParameterTab", _
  Array("NAME:PropServers", "CompInst@SW_V;322;0"), Array("NAME:ChangedProps", _
  Array("NAME:ID_V", "OverridingDef:=", true, "Value:=", "IVc1"))))
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PassedParameterTab", _
  Array("NAME:PropServers", "CompInst@SW_V;322;0"), Array("NAME:ChangedProps", _
  Array("NAME:MOD", "OverridingDef:=", true, "Value:=", "SModel1"))))
oEditor.CreateComponent Array("NAME:ComponentProps", "Name:=", "SW_V", "Id:=", _
  "329"), Array("NAME:Attributes", "Page:=", 1, "X:=", 0.0381, "Y:=", _
  -0.03048, "Degrees:=", -90, "Flip:=", false) 
oEditor.CreateWire Array("NAME:WireData", "Id:=", "1", "Points:=", Array(_
  "(0.0381, -0.0254)", "(0.0381, -0.02286)")), Array("NAME:Attributes", _
  "Page:=", 1) 
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PassedParameterTab", _
  Array("NAME:PropServers", "CompInst@SW_V;329;0"), Array("NAME:ChangedProps", _
  Array("NAME:ID_V", "OverridingDef:=", true, "Value:=", "IVc4"))))
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PassedParameterTab", _
  Array("NAME:PropServers", "CompInst@SW_V;329;0"), Array("NAME:ChangedProps", _
  Array("NAME:MOD", "OverridingDef:=", true, "Value:=", "SModel1"))))
oEditor.CreateComponent Array("NAME:ComponentProps", "Name:=", "SW_V", "Id:=", _
  "336"), Array("NAME:Attributes", "Page:=", 1, "X:=", 0.0508, "Y:=", 0.03048, _
  "Degrees:=", -90, "Flip:=", false) 
oEditor.CreateWire Array("NAME:WireData", "Id:=", "1", "Points:=", Array(_
  "(0.0508, 0.03556)", "(0.0508, 0.0381)")), Array("NAME:Attributes", _
  "Page:=", 1) 
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PassedParameterTab", _
  Array("NAME:PropServers", "CompInst@SW_V;336;0"), Array("NAME:ChangedProps", _
  Array("NAME:ID_V", "OverridingDef:=", true, "Value:=", "IVc3"))))
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PassedParameterTab", _
  Array("NAME:PropServers", "CompInst@SW_V;336;0"), Array("NAME:ChangedProps", _
  Array("NAME:MOD", "OverridingDef:=", true, "Value:=", "SModel1"))))
oEditor.CreateComponent Array("NAME:ComponentProps", "Name:=", "SW_V", "Id:=", _
  "343"), Array("NAME:Attributes", "Page:=", 1, "X:=", 0.0635, "Y:=", _
  -0.03048, "Degrees:=", -90, "Flip:=", false) 
oEditor.CreateWire Array("NAME:WireData", "Id:=", "1", "Points:=", Array(_
  "(0.0635, -0.0254)", "(0.0635, -0.02286)")), Array("NAME:Attributes", _
  "Page:=", 1) 
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PassedParameterTab", _
  Array("NAME:PropServers", "CompInst@SW_V;343;0"), Array("NAME:ChangedProps", _
  Array("NAME:ID_V", "OverridingDef:=", true, "Value:=", "IVc6"))))
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PassedParameterTab", _
  Array("NAME:PropServers", "CompInst@SW_V;343;0"), Array("NAME:ChangedProps", _
  Array("NAME:MOD", "OverridingDef:=", true, "Value:=", "SModel1"))))
oEditor.CreateComponent Array("NAME:ComponentProps", "Name:=", "SW_V", "Id:=", _
  "350"), Array("NAME:Attributes", "Page:=", 1, "X:=", 0.0762, "Y:=", 0.03048, _
  "Degrees:=", -90, "Flip:=", false) 
oEditor.CreateWire Array("NAME:WireData", "Id:=", "1", "Points:=", Array(_
  "(0.0762, 0.03556)", "(0.0762, 0.0381)")), Array("NAME:Attributes", _
  "Page:=", 1) 
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PassedParameterTab", _
  Array("NAME:PropServers", "CompInst@SW_V;350;0"), Array("NAME:ChangedProps", _
  Array("NAME:ID_V", "OverridingDef:=", true, "Value:=", "IVc5"))))
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PassedParameterTab", _
  Array("NAME:PropServers", "CompInst@SW_V;350;0"), Array("NAME:ChangedProps", _
  Array("NAME:MOD", "OverridingDef:=", true, "Value:=", "SModel1"))))
oEditor.CreateComponent Array("NAME:ComponentProps", "Name:=", "SW_V", "Id:=", _
  "357"), Array("NAME:Attributes", "Page:=", 1, "X:=", 0.0889, "Y:=", _
  -0.03048, "Degrees:=", -90, "Flip:=", false) 
oEditor.CreateWire Array("NAME:WireData", "Id:=", "1", "Points:=", Array(_
  "(0.0889, -0.0254)", "(0.0889, -0.02286)")), Array("NAME:Attributes", _
  "Page:=", 1) 
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PassedParameterTab", _
  Array("NAME:PropServers", "CompInst@SW_V;357;0"), Array("NAME:ChangedProps", _
  Array("NAME:ID_V", "OverridingDef:=", true, "Value:=", "IVc2"))))
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PassedParameterTab", _
  Array("NAME:PropServers", "CompInst@SW_V;357;0"), Array("NAME:ChangedProps", _
  Array("NAME:MOD", "OverridingDef:=", true, "Value:=", "SModel1"))))
oEditor.CreateWire Array("NAME:WireData", "Id:=", "1", "Points:=", Array(_
  "(0.0254, -0.0508)", "(0.0254, -0.03556)")), Array("NAME:Attributes", _
  "Page:=", 1) 
oEditor.CreateWire Array("NAME:WireData", "Id:=", "1", "Points:=", Array(_
  "(0.0381, -0.0508)", "(0.0381, -0.03556)")), Array("NAME:Attributes", _
  "Page:=", 1) 
oEditor.CreateWire Array("NAME:WireData", "Id:=", "1", "Points:=", Array(_
  "(0.0508, -0.0508)", "(0.0508, -0.03556)")), Array("NAME:Attributes", _
  "Page:=", 1) 
oEditor.CreateWire Array("NAME:WireData", "Id:=", "1", "Points:=", Array(_
  "(0.0635, -0.0508)", "(0.0635, -0.03556)")), Array("NAME:Attributes", _
  "Page:=", 1) 
oEditor.CreateWire Array("NAME:WireData", "Id:=", "1", "Points:=", Array(_
  "(0.0762, -0.0508)", "(0.0762, -0.03556)")), Array("NAME:Attributes", _
  "Page:=", 1) 
oEditor.CreateWire Array("NAME:WireData", "Id:=", "1", "Points:=", Array(_
  "(0.0889, -0.0508)", "(0.0889, -0.03556)")), Array("NAME:Attributes", _
  "Page:=", 1) 
oEditor.CreateWire Array("NAME:WireData", "Id:=", "1", "Points:=", Array(_
  "(0.0254, 0.00508)", "(0.0381, 0.00508)", "(0.11176, 0.00508)", _
  "(0.11176, 0.01016)", "(0.1143, 0.01016)")), Array("NAME:Attributes", _
  "Page:=", 1) 
oEditor.CreateWire Array("NAME:WireData", "Id:=", "1", "Points:=", Array(_
  "(0.0508, 0)", "(0.0635, 0)", "(0.1143, 0)", "(0.1143, 0)", "(0.1143, 0)")), _
  Array("NAME:Attributes", "Page:=", 1) 
oEditor.CreateWire Array("NAME:WireData", "Id:=", "1", "Points:=", Array(_
  "(0.0762, -0.00508)", "(0.0889, -0.00508)", "(0.1143, -0.00508)", _
  "(0.1143, -0.01016)", "(0.1143, -0.01016)")), Array("NAME:Attributes", _
  "Page:=", 1) 
oEditor.CreateComponent Array("NAME:ComponentProps", "Name:=", "DIODE_Model", _
  "Id:=", "364"), Array("NAME:Attributes", "Page:=", 1, "X:=", 0.1016, "Y:=", _
  0.04826, "Degrees:=", 0, "Flip:=", false) 
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PassedParameterTab", _
  Array("NAME:PropServers", "CompInst@DIODE_Model;364;0"), Array(_
  "NAME:ChangedProps", Array("NAME:RS", "OverridingDef:=", true, "Value:=", _
  "0.420614ohm"))))
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PassedParameterTab", _
  Array("NAME:PropServers", "CompInst@DIODE_Model;364;0"), Array(_
  "NAME:ChangedProps", Array("NAME:DeviceName", "OverridingDef:=", true, _
  "Value:=", "DModel1"))))
oEditor.CreateComponent Array("NAME:ComponentProps", "Name:=", "SW_VModel", _
  "Id:=", "371"), Array("NAME:Attributes", "Page:=", 1, "X:=", 0.1143, "Y:=", _
  0.04826, "Degrees:=", 0, "Flip:=", false) 
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PassedParameterTab", _
  Array("NAME:PropServers", "CompInst@SW_VModel;371;0"), Array(_
  "NAME:ChangedProps", Array("NAME:Von", "OverridingDef:=", true, "Value:=", _
  "0.0 V"))))
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PassedParameterTab", _
  Array("NAME:PropServers", "CompInst@SW_VModel;371;0"), Array(_
  "NAME:ChangedProps", Array("NAME:Voff", "OverridingDef:=", true, "Value:=", _
  "0.0 V"))))
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PassedParameterTab", _
  Array("NAME:PropServers", "CompInst@SW_VModel;371;0"), Array(_
  "NAME:ChangedProps", Array("NAME:DeviceName", "OverridingDef:=", true, _
  "Value:=", "SModel1"))))
if (oArgs.Count > 0) then 
  oProject.SetActiveDesign oArgs(0)
end if
oEditor.ZoomToFit
if (oArgs.Count > 1) then 
  oDesign.ExportNetList "", oArgs(1)
end if
