' -----------------------------------------------------------------------------  
' Script Created by RMxprt Version 2016.0 to generate Simplorer Circuit design   
' Expect 2 args, first the project name,                                         
'                second the design name                                          
' -------------------------------------------------------------------------------
Dim oAnsoftApp
Dim oDesktop
Dim oProject
Dim oDesign
Dim oEditor
Dim oModule
Dim oSml1, oSml2, oModName
oModName = "Setup1"

On Error Resume Next
Set oAnsoftApp = CreateObject("Ansoft.ElectronicsDesktop")
On Error Goto 0
' -----------------------------------------------------------------------------  
' Determine the path of this vbs and resolve path to other referenced files      
' -----------------------------------------------------------------------------  
Dim vbspath, dir, path, fileName, filesys, pathArray, count
vbspath = AnsoftScript.GetScriptPath
Set filesys = CreateObject("Scripting.FileSystemObject")
dir = filesys.GetParentFolderName(vbspath)
fileName = filesys.GetFileName(vbspath)
fileName = filesys.GetBaseName(fileName)
pathArray = Split(fileName, "_")
' Form the path
count = UBound(pathArray) - 1
if (count > 0) Then
For i = 0 to count
path = path + pathArray(i)
if (i < count) Then
path = path + "_"
End If
Next
oSml1 = dir + "/" + path + ".sml"
oSml2 = dir + "/" + path + "_signals.sml"
Else ' no _ in file name
oSml1 = dir + "/" + oModName + ".sml"
oSml2 = dir + "/" + "signals.sml"
End if

Set oArgs = AnsoftScript.arguments
Set oDesktop = oAnsoftApp.GetAppDesktop()
Set oProject = oDesktop.GetActiveProject()
if (oArgs.Count > 1) then 
  oProject.InsertDesign "Twin Builder", oArgs(1), "", ""
else
  oProject.InsertDesign "Twin Builder", "", "", ""
end if
Set oDesign = oProject.GetActiveDesign()
Set oEditor = oDesign.SetActiveEditor("SchematicEditor")
Set oDefinitionManager = oProject.GetDefinitionManager()
Set oComponentManager = oDefinitionManager.GetManager("Component")
oComponentManager.ImportModelsFromFile oSml1, Array("NAME:Options", "Mode:=", _
  1)
oComponentManager.ImportModelsFromFile oSml2, Array("NAME:Options", "Mode:=", _
  1)
oEditor.CreateComponent Array("NAME:ComponentProps", "Name:=", "Setup1", _
  "Id:=", "406"), Array("NAME:Attributes", "Page:=", 1, "X:=", 0.11684, "Y:=", _
  0.04572, "Degrees:=", 0, "Flip:=", false) 
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PassedParameterTab", _
  Array("NAME:PropServers", "CompInst@Setup1;406;0"), Array(_
  "NAME:ChangedProps", Array("NAME:InstanceName", "OverridingDef:=", true, _
  "Value:=", "BLDC"))))
ppID = oEditor.CreatePagePort( Array("NAME:PagePortProps", "Name:=", "A", _
  "Id:=", 413), Array("NAME:Attributes", "Page:=", 1, "X:=", 0.10922, "Y:=", _
  0.04826, "Degrees:=", 0, "Flip:=", false) )
oEditor.Move Array("NAME:Selections", "Selections:=", Array(ppID)), Array(_
  "NAME:MoveParameters", "xdelta:=", -0.00254, "ydelta:=", 0, "Disconnect:=", _
  false, "Rubberband:=", false)
ppID = oEditor.CreatePagePort( Array("NAME:PagePortProps", "Name:=", "B", _
  "Id:=", 420), Array("NAME:Attributes", "Page:=", 1, "X:=", 0.10922, "Y:=", _
  0.04572, "Degrees:=", 0, "Flip:=", false) )
oEditor.Move Array("NAME:Selections", "Selections:=", Array(ppID)), Array(_
  "NAME:MoveParameters", "xdelta:=", -0.00254, "ydelta:=", 0, "Disconnect:=", _
  false, "Rubberband:=", false)
ppID = oEditor.CreatePagePort( Array("NAME:PagePortProps", "Name:=", "C", _
  "Id:=", 427), Array("NAME:Attributes", "Page:=", 1, "X:=", 0.10922, "Y:=", _
  0.04318, "Degrees:=", 0, "Flip:=", false) )
oEditor.Move Array("NAME:Selections", "Selections:=", Array(ppID)), Array(_
  "NAME:MoveParameters", "xdelta:=", -0.00254, "ydelta:=", 0, "Disconnect:=", _
  false, "Rubberband:=", false)
ppID = oEditor.CreatePagePort( Array("NAME:PagePortProps", "Name:=", "N", _
  "Id:=", 434), Array("NAME:Attributes", "Page:=", 1, "X:=", 0.12446, "Y:=", _
  0.04826, "Degrees:=", 180, "Flip:=", false) )
oEditor.Move Array("NAME:Selections", "Selections:=", Array(ppID)), Array(_
  "NAME:MoveParameters", "xdelta:=", 0.00254, "ydelta:=", 0, "Disconnect:=", _
  false, "Rubberband:=", false)
ppID = oEditor.CreatePagePort( Array("NAME:PagePortProps", "Name:=", "ROT1", _
  "Id:=", 441), Array("NAME:Attributes", "Page:=", 1, "X:=", 0.12446, "Y:=", _
  0.04572, "Degrees:=", 180, "Flip:=", false) )
oEditor.Move Array("NAME:Selections", "Selections:=", Array(ppID)), Array(_
  "NAME:MoveParameters", "xdelta:=", 0.00254, "ydelta:=", 0, "Disconnect:=", _
  false, "Rubberband:=", false)
ppID = oEditor.CreatePagePort( Array("NAME:PagePortProps", "Name:=", "ROT2", _
  "Id:=", 448), Array("NAME:Attributes", "Page:=", 1, "X:=", 0.12446, "Y:=", _
  0.04318, "Degrees:=", 180, "Flip:=", false) )
oEditor.Move Array("NAME:Selections", "Selections:=", Array(ppID)), Array(_
  "NAME:MoveParameters", "xdelta:=", 0.00254, "ydelta:=", 0, "Disconnect:=", _
  false, "Rubberband:=", false)
oEditor.CreateComponent Array("NAME:ComponentProps", "Name:=", _
  "Simplorer Elements/Basic Elements/Physical Domains/Mechanical/Velocity-Force-Representation/Rotational_V:V_ROT", _
  "Id:=", "455"), Array("NAME:Attributes", "Page:=", 1, "X:=", 0.15494, "Y:=", _
  0.0508, "Degrees:=", 180, "Flip:=", false) 
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PassedParameterTab", _
  Array("NAME:PropServers", "CompInst@V_ROT;455;0"), Array(_
  "NAME:ChangedProps", Array("NAME:InstanceName", "OverridingDef:=", true, _
  "Value:=", "speed"))))
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:Quantities", Array(_
  "NAME:PropServers", "CompInst@V_ROT;455;0"), Array("NAME:ChangedProps", _
  Array("NAME:VALUE", "OverridingDef:=", true, "Value:=", "2110.79rpm"))))
ppID = oEditor.CreatePagePort( Array("NAME:PagePortProps", "Name:=", "ROT1", _
  "Id:=", 462), Array("NAME:Attributes", "Page:=", 1, "X:=", 0.14986, "Y:=", _
  0.04826, "Degrees:=", 0, "Flip:=", false) )
ppID = oEditor.CreatePagePort( Array("NAME:PagePortProps", "Name:=", "ROT2", _
  "Id:=", 469), Array("NAME:Attributes", "Page:=", 1, "X:=", 0.14986, "Y:=", _
  0.0381, "Degrees:=", 0, "Flip:=", false) )
oEditor.CreateGround Array("NAME:GroundProps", "Id:=", "399"), Array(_
  "NAME:Attributes", "Page:=", 1, "X:=", 0.14986, "Y:=", 0.03556, "Degrees:=", _
  0, "Flip:=", false) 
oEditor.CreateComponent Array("NAME:ComponentProps", "Name:=", _
  "Simplorer Elements/Basic Elements/Measurement/Electrical:AM", "Id:=", _
  "476"), Array("NAME:Attributes", "Page:=", 1, "X:=", 0.11938, "Y:=", _
  0.00762, "Degrees:=", 90, "Flip:=", false) 
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PassedParameterTab", _
  Array("NAME:PropServers", "CompInst@AM;476;0"), Array("NAME:ChangedProps", _
  Array("NAME:InstanceName", "OverridingDef:=", true, "Value:=", "IA"))))
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PropDisplayPropTab", _
  Array("NAME:PropServers", "CompInst@AM;476;0"), Array("NAME:NewProps", _
  Array("NAME:InstanceName", "Format:=", "Value", "Location:=", "Right"))))
oEditor.CreateComponent Array("NAME:ComponentProps", "Name:=", _
  "Simplorer Elements/Basic Elements/Measurement/Electrical:AM", "Id:=", _
  "483"), Array("NAME:Attributes", "Page:=", 1, "X:=", 0.11938, "Y:=", _
  -0.00254, "Degrees:=", 90, "Flip:=", false) 
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PassedParameterTab", _
  Array("NAME:PropServers", "CompInst@AM;483;0"), Array("NAME:ChangedProps", _
  Array("NAME:InstanceName", "OverridingDef:=", true, "Value:=", "IB"))))
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PropDisplayPropTab", _
  Array("NAME:PropServers", "CompInst@AM;483;0"), Array("NAME:NewProps", _
  Array("NAME:InstanceName", "Format:=", "Value", "Location:=", "Right"))))
oEditor.CreateComponent Array("NAME:ComponentProps", "Name:=", _
  "Simplorer Elements/Basic Elements/Measurement/Electrical:AM", "Id:=", _
  "490"), Array("NAME:Attributes", "Page:=", 1, "X:=", 0.11938, "Y:=", _
  -0.0127, "Degrees:=", 90, "Flip:=", false) 
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PassedParameterTab", _
  Array("NAME:PropServers", "CompInst@AM;490;0"), Array("NAME:ChangedProps", _
  Array("NAME:InstanceName", "OverridingDef:=", true, "Value:=", "IC"))))
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PropDisplayPropTab", _
  Array("NAME:PropServers", "CompInst@AM;490;0"), Array("NAME:NewProps", _
  Array("NAME:InstanceName", "Format:=", "Value", "Location:=", "Right"))))
ppID = oEditor.CreatePagePort( Array("NAME:PagePortProps", "Name:=", "A", _
  "Id:=", 497), Array("NAME:Attributes", "Page:=", 1, "X:=", 0.12446, "Y:=", _
  0.01016, "Degrees:=", 180, "Flip:=", false) )
ppID = oEditor.CreatePagePort( Array("NAME:PagePortProps", "Name:=", "B", _
  "Id:=", 504), Array("NAME:Attributes", "Page:=", 1, "X:=", 0.12446, "Y:=", _
  0, "Degrees:=", 180, "Flip:=", false) )
ppID = oEditor.CreatePagePort( Array("NAME:PagePortProps", "Name:=", "C", _
  "Id:=", 511), Array("NAME:Attributes", "Page:=", 1, "X:=", 0.12446, "Y:=", _
  -0.01016, "Degrees:=", 180, "Flip:=", false) )
ppID = oEditor.CreatePagePort( Array("NAME:PagePortProps", "Name:=", "N", _
  "Id:=", 518), Array("NAME:Attributes", "Page:=", 1, "X:=", 0.15494, "Y:=", _
  0, "Degrees:=", 0, "Flip:=", false) )
oEditor.CreateComponent Array("NAME:ComponentProps", "Name:=", _
  "Simplorer Elements/Basic Elements/Measurement/Electrical:VM", "Id:=", _
  "525"), Array("NAME:Attributes", "Page:=", 1, "X:=", 0.16002, "Y:=", _
  -0.00254, "Degrees:=", 90, "Flip:=", false) 
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PropDisplayPropTab", _
  Array("NAME:PropServers", "CompInst@VM;525;0"), Array("NAME:NewProps", _
  Array("NAME:InstanceName", "Format:=", "Value", "Location:=", "Right"))))
oEditor.CreateGround Array("NAME:GroundProps", "Id:=", "399"), Array(_
  "NAME:Attributes", "Page:=", 1, "X:=", 0.1651, "Y:=", -0.00254, "Degrees:=", _
  0, "Flip:=", false) 
oEditor.CreateComponent Array("NAME:ComponentProps", "Name:=", "Pulse", "Id:=", _
  "532"), Array("NAME:Attributes", "Page:=", 1, "X:=", 0.1016, "Y:=", -0.0508, _
  "Degrees:=", 0, "Flip:=", false) 
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PassedParameterTab", _
  Array("NAME:PropServers", "CompInst@Pulse;532;0"), Array(_
  "NAME:ChangedProps", Array("NAME:InstanceName", "OverridingDef:=", true, _
  "Value:=", "Pulse0"))))
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PropDisplayPropTab", _
  Array("NAME:PropServers", "CompInst@Pulse;532;0"), Array("NAME:NewProps", _
  Array("NAME:InstanceName", "Format:=", "Value", "Location:=", "Top"))))
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:Quantities", Array(_
  "NAME:PropServers", "CompInst@Pulse;532;0"), Array("NAME:ChangedProps", _
  Array("NAME:input", "OverridingDef:=", true, "Value:=", "BLDC.Pos"))))
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:Quantities", Array(_
  "NAME:PropServers", "CompInst@Pulse;532;0"), Array("NAME:ChangedProps", _
  Array("NAME:period", "OverridingDef:=", true, "Value:=", "180"))))
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:Quantities", Array(_
  "NAME:PropServers", "CompInst@Pulse;532;0"), Array("NAME:ChangedProps", _
  Array("NAME:pulseWidth", "OverridingDef:=", true, "Value:=", "60"))))
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:Quantities", Array(_
  "NAME:PropServers", "CompInst@Pulse;532;0"), Array("NAME:ChangedProps", _
  Array("NAME:delay", "OverridingDef:=", true, "Value:=", "15"))))
oEditor.CreateComponent Array("NAME:ComponentProps", "Name:=", "Pulse", "Id:=", _
  "539"), Array("NAME:Attributes", "Page:=", 1, "X:=", 0.1143, "Y:=", -0.0508, _
  "Degrees:=", 0, "Flip:=", false) 
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PassedParameterTab", _
  Array("NAME:PropServers", "CompInst@Pulse;539;0"), Array(_
  "NAME:ChangedProps", Array("NAME:InstanceName", "OverridingDef:=", true, _
  "Value:=", "Pulse1"))))
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PropDisplayPropTab", _
  Array("NAME:PropServers", "CompInst@Pulse;539;0"), Array("NAME:NewProps", _
  Array("NAME:InstanceName", "Format:=", "Value", "Location:=", "Top"))))
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:Quantities", Array(_
  "NAME:PropServers", "CompInst@Pulse;539;0"), Array("NAME:ChangedProps", _
  Array("NAME:input", "OverridingDef:=", true, "Value:=", "BLDC.Pos"))))
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:Quantities", Array(_
  "NAME:PropServers", "CompInst@Pulse;539;0"), Array("NAME:ChangedProps", _
  Array("NAME:period", "OverridingDef:=", true, "Value:=", "180"))))
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:Quantities", Array(_
  "NAME:PropServers", "CompInst@Pulse;539;0"), Array("NAME:ChangedProps", _
  Array("NAME:pulseWidth", "OverridingDef:=", true, "Value:=", "60"))))
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:Quantities", Array(_
  "NAME:PropServers", "CompInst@Pulse;539;0"), Array("NAME:ChangedProps", _
  Array("NAME:delay", "OverridingDef:=", true, "Value:=", "45"))))
oEditor.CreateComponent Array("NAME:ComponentProps", "Name:=", "Pulse", "Id:=", _
  "546"), Array("NAME:Attributes", "Page:=", 1, "X:=", 0.127, "Y:=", -0.0508, _
  "Degrees:=", 0, "Flip:=", false) 
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PassedParameterTab", _
  Array("NAME:PropServers", "CompInst@Pulse;546;0"), Array(_
  "NAME:ChangedProps", Array("NAME:InstanceName", "OverridingDef:=", true, _
  "Value:=", "Pulse2"))))
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PropDisplayPropTab", _
  Array("NAME:PropServers", "CompInst@Pulse;546;0"), Array("NAME:NewProps", _
  Array("NAME:InstanceName", "Format:=", "Value", "Location:=", "Top"))))
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:Quantities", Array(_
  "NAME:PropServers", "CompInst@Pulse;546;0"), Array("NAME:ChangedProps", _
  Array("NAME:input", "OverridingDef:=", true, "Value:=", "BLDC.Pos"))))
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:Quantities", Array(_
  "NAME:PropServers", "CompInst@Pulse;546;0"), Array("NAME:ChangedProps", _
  Array("NAME:period", "OverridingDef:=", true, "Value:=", "180"))))
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:Quantities", Array(_
  "NAME:PropServers", "CompInst@Pulse;546;0"), Array("NAME:ChangedProps", _
  Array("NAME:pulseWidth", "OverridingDef:=", true, "Value:=", "60"))))
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:Quantities", Array(_
  "NAME:PropServers", "CompInst@Pulse;546;0"), Array("NAME:ChangedProps", _
  Array("NAME:delay", "OverridingDef:=", true, "Value:=", "75"))))
oEditor.CreateComponent Array("NAME:ComponentProps", "Name:=", "Pulse", "Id:=", _
  "553"), Array("NAME:Attributes", "Page:=", 1, "X:=", 0.1397, "Y:=", -0.0508, _
  "Degrees:=", 0, "Flip:=", false) 
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PassedParameterTab", _
  Array("NAME:PropServers", "CompInst@Pulse;553;0"), Array(_
  "NAME:ChangedProps", Array("NAME:InstanceName", "OverridingDef:=", true, _
  "Value:=", "Pulse3"))))
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PropDisplayPropTab", _
  Array("NAME:PropServers", "CompInst@Pulse;553;0"), Array("NAME:NewProps", _
  Array("NAME:InstanceName", "Format:=", "Value", "Location:=", "Top"))))
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:Quantities", Array(_
  "NAME:PropServers", "CompInst@Pulse;553;0"), Array("NAME:ChangedProps", _
  Array("NAME:input", "OverridingDef:=", true, "Value:=", "BLDC.Pos"))))
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:Quantities", Array(_
  "NAME:PropServers", "CompInst@Pulse;553;0"), Array("NAME:ChangedProps", _
  Array("NAME:period", "OverridingDef:=", true, "Value:=", "180"))))
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:Quantities", Array(_
  "NAME:PropServers", "CompInst@Pulse;553;0"), Array("NAME:ChangedProps", _
  Array("NAME:pulseWidth", "OverridingDef:=", true, "Value:=", "60"))))
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:Quantities", Array(_
  "NAME:PropServers", "CompInst@Pulse;553;0"), Array("NAME:ChangedProps", _
  Array("NAME:delay", "OverridingDef:=", true, "Value:=", "105"))))
oEditor.CreateComponent Array("NAME:ComponentProps", "Name:=", "Pulse", "Id:=", _
  "560"), Array("NAME:Attributes", "Page:=", 1, "X:=", 0.1524, "Y:=", -0.0508, _
  "Degrees:=", 0, "Flip:=", false) 
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PassedParameterTab", _
  Array("NAME:PropServers", "CompInst@Pulse;560;0"), Array(_
  "NAME:ChangedProps", Array("NAME:InstanceName", "OverridingDef:=", true, _
  "Value:=", "Pulse4"))))
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PropDisplayPropTab", _
  Array("NAME:PropServers", "CompInst@Pulse;560;0"), Array("NAME:NewProps", _
  Array("NAME:InstanceName", "Format:=", "Value", "Location:=", "Top"))))
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:Quantities", Array(_
  "NAME:PropServers", "CompInst@Pulse;560;0"), Array("NAME:ChangedProps", _
  Array("NAME:input", "OverridingDef:=", true, "Value:=", "BLDC.Pos"))))
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:Quantities", Array(_
  "NAME:PropServers", "CompInst@Pulse;560;0"), Array("NAME:ChangedProps", _
  Array("NAME:period", "OverridingDef:=", true, "Value:=", "180"))))
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:Quantities", Array(_
  "NAME:PropServers", "CompInst@Pulse;560;0"), Array("NAME:ChangedProps", _
  Array("NAME:pulseWidth", "OverridingDef:=", true, "Value:=", "60"))))
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:Quantities", Array(_
  "NAME:PropServers", "CompInst@Pulse;560;0"), Array("NAME:ChangedProps", _
  Array("NAME:delay", "OverridingDef:=", true, "Value:=", "135"))))
oEditor.CreateComponent Array("NAME:ComponentProps", "Name:=", "Pulse", "Id:=", _
  "567"), Array("NAME:Attributes", "Page:=", 1, "X:=", 0.1651, "Y:=", -0.0508, _
  "Degrees:=", 0, "Flip:=", false) 
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PassedParameterTab", _
  Array("NAME:PropServers", "CompInst@Pulse;567;0"), Array(_
  "NAME:ChangedProps", Array("NAME:InstanceName", "OverridingDef:=", true, _
  "Value:=", "Pulse5"))))
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PropDisplayPropTab", _
  Array("NAME:PropServers", "CompInst@Pulse;567;0"), Array("NAME:NewProps", _
  Array("NAME:InstanceName", "Format:=", "Value", "Location:=", "Top"))))
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:Quantities", Array(_
  "NAME:PropServers", "CompInst@Pulse;567;0"), Array("NAME:ChangedProps", _
  Array("NAME:input", "OverridingDef:=", true, "Value:=", "BLDC.Pos"))))
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:Quantities", Array(_
  "NAME:PropServers", "CompInst@Pulse;567;0"), Array("NAME:ChangedProps", _
  Array("NAME:period", "OverridingDef:=", true, "Value:=", "180"))))
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:Quantities", Array(_
  "NAME:PropServers", "CompInst@Pulse;567;0"), Array("NAME:ChangedProps", _
  Array("NAME:pulseWidth", "OverridingDef:=", true, "Value:=", "60"))))
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:Quantities", Array(_
  "NAME:PropServers", "CompInst@Pulse;567;0"), Array("NAME:ChangedProps", _
  Array("NAME:delay", "OverridingDef:=", true, "Value:=", "165"))))
oEditor.CreateComponent Array("NAME:ComponentProps", "Name:=", _
  "Simplorer Elements/Basic Elements/Circuit/Sources:E", "Id:=", "574"), _
  Array("NAME:Attributes", "Page:=", 1, "X:=", -0.00254, "Y:=", 0.0127, _
  "Degrees:=", 0, "Flip:=", false) 
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:Quantities", Array(_
  "NAME:PropServers", "CompInst@E;574;0"), Array("NAME:ChangedProps", Array(_
  "NAME:EMF", "OverridingDef:=", true, "Value:=", "110V"))))
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PropDisplayPropTab", _
  Array("NAME:PropServers", "CompInst@E;574;0"), Array("NAME:NewProps", _
  Array("NAME:InstanceName", "Format:=", "Value", "Location:=", "Right"))))
oEditor.CreateComponent Array("NAME:ComponentProps", "Name:=", _
  "Simplorer Elements/Basic Elements/Circuit/Sources:E", "Id:=", "581"), _
  Array("NAME:Attributes", "Page:=", 1, "X:=", -0.00254, "Y:=", -0.0127, _
  "Degrees:=", 0, "Flip:=", false) 
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:Quantities", Array(_
  "NAME:PropServers", "CompInst@E;581;0"), Array("NAME:ChangedProps", Array(_
  "NAME:EMF", "OverridingDef:=", true, "Value:=", "110V"))))
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PropDisplayPropTab", _
  Array("NAME:PropServers", "CompInst@E;581;0"), Array("NAME:NewProps", _
  Array("NAME:InstanceName", "Format:=", "Value", "Location:=", "Right"))))
oEditor.CreateWire Array("NAME:WireData", "Id:=", "1", "Points:=", Array(_
  "(0, 0.01778)", "(0, 0.0508)", "(0.0889, 0.0508)")), Array(_
  "NAME:Attributes", "Page:=", 1) 
oEditor.CreateWire Array("NAME:WireData", "Id:=", "1", "Points:=", Array(_
  "(0, 0.00762)", "(0, -0.00762)")), Array("NAME:Attributes", "Page:=", 1) 
oEditor.CreateWire Array("NAME:WireData", "Id:=", "1", "Points:=", Array(_
  "(0, -0.01778)", "(0, -0.0508)", "(0.0889, -0.0508)")), Array(_
  "NAME:Attributes", "Page:=", 1) 
oEditor.CreateGround Array("NAME:GroundProps", "Id:=", "399"), Array(_
  "NAME:Attributes", "Page:=", 1, "X:=", -0.00508, "Y:=", -0.00254, _
  "Degrees:=", 0, "Flip:=", false) 
oEditor.CreateWire Array("NAME:WireData", "Id:=", "1", "Points:=", Array(_
  "(0, 0)", "(-0.00508, 0)")), Array("NAME:Attributes", "Page:=", 1) 
oEditor.CreateWire Array("NAME:WireData", "Id:=", "1", "Points:=", Array(_
  "(0.0254, -0.0254)", "(0.0254, 0.0254)")), Array("NAME:Attributes", _
  "Page:=", 1) 
oEditor.CreateComponent Array("NAME:ComponentProps", "Name:=", _
  "Simplorer Elements/Basic Elements/Circuit/Spice-Compatible Models/Diode:SPICE_D", _
  "Id:=", "588"), Array("NAME:Attributes", "Page:=", 1, "X:=", 0.0254, "Y:=", _
  -0.03048, "Degrees:=", 0, "Flip:=", false) 
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PropDisplayPropTab", _
  Array("NAME:PropServers", "CompInst@SPICE_D;588;0"), Array("NAME:NewProps", _
  Array("NAME:InstanceName", "Format:=", "Value", "Location:=", "Right"))))
oEditor.CreateWire Array("NAME:WireData", "Id:=", "1", "Points:=", Array(_
  "(0.0381, 0.03556)", "(0.0381, 0.0508)")), Array("NAME:Attributes", _
  "Page:=", 1) 
oEditor.CreateComponent Array("NAME:ComponentProps", "Name:=", _
  "Simplorer Elements/Basic Elements/Circuit/Spice-Compatible Models/Diode:SPICE_D", _
  "Id:=", "595"), Array("NAME:Attributes", "Page:=", 1, "X:=", 0.0381, "Y:=", _
  0.03048, "Degrees:=", 0, "Flip:=", false) 
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PropDisplayPropTab", _
  Array("NAME:PropServers", "CompInst@SPICE_D;595;0"), Array("NAME:NewProps", _
  Array("NAME:InstanceName", "Format:=", "Value", "Location:=", "Right"))))
oEditor.CreateWire Array("NAME:WireData", "Id:=", "1", "Points:=", Array(_
  "(0.0508, -0.0254)", "(0.0508, 0.0254)")), Array("NAME:Attributes", _
  "Page:=", 1) 
oEditor.CreateComponent Array("NAME:ComponentProps", "Name:=", _
  "Simplorer Elements/Basic Elements/Circuit/Spice-Compatible Models/Diode:SPICE_D", _
  "Id:=", "602"), Array("NAME:Attributes", "Page:=", 1, "X:=", 0.0508, "Y:=", _
  -0.03048, "Degrees:=", 0, "Flip:=", false) 
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PropDisplayPropTab", _
  Array("NAME:PropServers", "CompInst@SPICE_D;602;0"), Array("NAME:NewProps", _
  Array("NAME:InstanceName", "Format:=", "Value", "Location:=", "Right"))))
oEditor.CreateWire Array("NAME:WireData", "Id:=", "1", "Points:=", Array(_
  "(0.0635, 0.03556)", "(0.0635, 0.0508)")), Array("NAME:Attributes", _
  "Page:=", 1) 
oEditor.CreateComponent Array("NAME:ComponentProps", "Name:=", _
  "Simplorer Elements/Basic Elements/Circuit/Spice-Compatible Models/Diode:SPICE_D", _
  "Id:=", "609"), Array("NAME:Attributes", "Page:=", 1, "X:=", 0.0635, "Y:=", _
  0.03048, "Degrees:=", 0, "Flip:=", false) 
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PropDisplayPropTab", _
  Array("NAME:PropServers", "CompInst@SPICE_D;609;0"), Array("NAME:NewProps", _
  Array("NAME:InstanceName", "Format:=", "Value", "Location:=", "Right"))))
oEditor.CreateWire Array("NAME:WireData", "Id:=", "1", "Points:=", Array(_
  "(0.0762, -0.0254)", "(0.0762, 0.0254)")), Array("NAME:Attributes", _
  "Page:=", 1) 
oEditor.CreateComponent Array("NAME:ComponentProps", "Name:=", _
  "Simplorer Elements/Basic Elements/Circuit/Spice-Compatible Models/Diode:SPICE_D", _
  "Id:=", "616"), Array("NAME:Attributes", "Page:=", 1, "X:=", 0.0762, "Y:=", _
  -0.03048, "Degrees:=", 0, "Flip:=", false) 
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PropDisplayPropTab", _
  Array("NAME:PropServers", "CompInst@SPICE_D;616;0"), Array("NAME:NewProps", _
  Array("NAME:InstanceName", "Format:=", "Value", "Location:=", "Right"))))
oEditor.CreateWire Array("NAME:WireData", "Id:=", "1", "Points:=", Array(_
  "(0.0889, 0.03556)", "(0.0889, 0.0508)")), Array("NAME:Attributes", _
  "Page:=", 1) 
oEditor.CreateComponent Array("NAME:ComponentProps", "Name:=", _
  "Simplorer Elements/Basic Elements/Circuit/Spice-Compatible Models/Diode:SPICE_D", _
  "Id:=", "623"), Array("NAME:Attributes", "Page:=", 1, "X:=", 0.0889, "Y:=", _
  0.03048, "Degrees:=", 0, "Flip:=", false) 
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PropDisplayPropTab", _
  Array("NAME:PropServers", "CompInst@SPICE_D;623;0"), Array("NAME:NewProps", _
  Array("NAME:InstanceName", "Format:=", "Value", "Location:=", "Right"))))
oEditor.CreateWire Array("NAME:WireData", "Id:=", "1", "Points:=", Array(_
  "(0.0254, 0.04826)", "(0.0254, 0.0508)")), Array("NAME:Attributes", _
  "Page:=", 1) 
oEditor.CreateComponent Array("NAME:ComponentProps", "Name:=", _
  "Simplorer Elements/Basic Elements/Circuit/Spice-Compatible Models/Diode:SPICE_D", _
  "Id:=", "630"), Array("NAME:Attributes", "Page:=", 1, "X:=", 0.0254, "Y:=", _
  0.04318, "Degrees:=", 180, "Flip:=", false) 
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PropDisplayPropTab", _
  Array("NAME:PropServers", "CompInst@SPICE_D;630;0"), Array("NAME:NewProps", _
  Array("NAME:InstanceName", "Format:=", "Value", "Location:=", "Right"))))
oEditor.CreateWire Array("NAME:WireData", "Id:=", "1", "Points:=", Array(_
  "(0.0381, -0.0127)", "(0.0381, 0.0254)")), Array("NAME:Attributes", _
  "Page:=", 1) 
oEditor.CreateComponent Array("NAME:ComponentProps", "Name:=", _
  "Simplorer Elements/Basic Elements/Circuit/Spice-Compatible Models/Diode:SPICE_D", _
  "Id:=", "637"), Array("NAME:Attributes", "Page:=", 1, "X:=", 0.0381, "Y:=", _
  -0.01778, "Degrees:=", 180, "Flip:=", false) 
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PropDisplayPropTab", _
  Array("NAME:PropServers", "CompInst@SPICE_D;637;0"), Array("NAME:NewProps", _
  Array("NAME:InstanceName", "Format:=", "Value", "Location:=", "Right"))))
oEditor.CreateWire Array("NAME:WireData", "Id:=", "1", "Points:=", Array(_
  "(0.0508, 0.04826)", "(0.0508, 0.0508)")), Array("NAME:Attributes", _
  "Page:=", 1) 
oEditor.CreateComponent Array("NAME:ComponentProps", "Name:=", _
  "Simplorer Elements/Basic Elements/Circuit/Spice-Compatible Models/Diode:SPICE_D", _
  "Id:=", "644"), Array("NAME:Attributes", "Page:=", 1, "X:=", 0.0508, "Y:=", _
  0.04318, "Degrees:=", 180, "Flip:=", false) 
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PropDisplayPropTab", _
  Array("NAME:PropServers", "CompInst@SPICE_D;644;0"), Array("NAME:NewProps", _
  Array("NAME:InstanceName", "Format:=", "Value", "Location:=", "Right"))))
oEditor.CreateWire Array("NAME:WireData", "Id:=", "1", "Points:=", Array(_
  "(0.0635, -0.0127)", "(0.0635, 0.0254)")), Array("NAME:Attributes", _
  "Page:=", 1) 
oEditor.CreateComponent Array("NAME:ComponentProps", "Name:=", _
  "Simplorer Elements/Basic Elements/Circuit/Spice-Compatible Models/Diode:SPICE_D", _
  "Id:=", "651"), Array("NAME:Attributes", "Page:=", 1, "X:=", 0.0635, "Y:=", _
  -0.01778, "Degrees:=", 180, "Flip:=", false) 
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PropDisplayPropTab", _
  Array("NAME:PropServers", "CompInst@SPICE_D;651;0"), Array("NAME:NewProps", _
  Array("NAME:InstanceName", "Format:=", "Value", "Location:=", "Right"))))
oEditor.CreateWire Array("NAME:WireData", "Id:=", "1", "Points:=", Array(_
  "(0.0762, 0.04826)", "(0.0762, 0.0508)")), Array("NAME:Attributes", _
  "Page:=", 1) 
oEditor.CreateComponent Array("NAME:ComponentProps", "Name:=", _
  "Simplorer Elements/Basic Elements/Circuit/Spice-Compatible Models/Diode:SPICE_D", _
  "Id:=", "658"), Array("NAME:Attributes", "Page:=", 1, "X:=", 0.0762, "Y:=", _
  0.04318, "Degrees:=", 180, "Flip:=", false) 
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PropDisplayPropTab", _
  Array("NAME:PropServers", "CompInst@SPICE_D;658;0"), Array("NAME:NewProps", _
  Array("NAME:InstanceName", "Format:=", "Value", "Location:=", "Right"))))
oEditor.CreateWire Array("NAME:WireData", "Id:=", "1", "Points:=", Array(_
  "(0.0889, -0.0127)", "(0.0889, 0.0254)")), Array("NAME:Attributes", _
  "Page:=", 1) 
oEditor.CreateComponent Array("NAME:ComponentProps", "Name:=", _
  "Simplorer Elements/Basic Elements/Circuit/Spice-Compatible Models/Diode:SPICE_D", _
  "Id:=", "665"), Array("NAME:Attributes", "Page:=", 1, "X:=", 0.0889, "Y:=", _
  -0.01778, "Degrees:=", 180, "Flip:=", false) 
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PropDisplayPropTab", _
  Array("NAME:PropServers", "CompInst@SPICE_D;665;0"), Array("NAME:NewProps", _
  Array("NAME:InstanceName", "Format:=", "Value", "Location:=", "Right"))))
oEditor.CreateWire Array("NAME:WireData", "Id:=", "1", "Points:=", Array(_
  "(0.0254, 0.03556)", "(0.0254, 0.0381)")), Array("NAME:Attributes", _
  "Page:=", 1) 
oEditor.CreateComponent Array("NAME:ComponentProps", "Name:=", _
  "Simplorer Elements/Basic Elements/Circuit/Ideal Switches:S", "Id:=", "672"), _
  Array("NAME:Attributes", "Page:=", 1, "X:=", 0.02286, "Y:=", 0.03048, _
  "Degrees:=", 0, "Flip:=", false) 
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PropDisplayPropTab", _
  Array("NAME:PropServers", "CompInst@S;672;0"), Array("NAME:NewProps", _
  Array("NAME:InstanceName", "Format:=", "Value", "Location:=", "Right"))))
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:Quantities", Array(_
  "NAME:PropServers", "CompInst@S;672;0"), Array("NAME:ChangedProps", Array(_
  "NAME:CTRL", "OverridingDef:=", true, "Value:=", "Pulse0.output"))))
oEditor.CreateWire Array("NAME:WireData", "Id:=", "1", "Points:=", Array(_
  "(0.0381, -0.0254)", "(0.0381, -0.02286)")), Array("NAME:Attributes", _
  "Page:=", 1) 
oEditor.CreateComponent Array("NAME:ComponentProps", "Name:=", _
  "Simplorer Elements/Basic Elements/Circuit/Ideal Switches:S", "Id:=", "679"), _
  Array("NAME:Attributes", "Page:=", 1, "X:=", 0.03556, "Y:=", -0.03048, _
  "Degrees:=", 0, "Flip:=", false) 
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PropDisplayPropTab", _
  Array("NAME:PropServers", "CompInst@S;679;0"), Array("NAME:NewProps", _
  Array("NAME:InstanceName", "Format:=", "Value", "Location:=", "Right"))))
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:Quantities", Array(_
  "NAME:PropServers", "CompInst@S;679;0"), Array("NAME:ChangedProps", Array(_
  "NAME:CTRL", "OverridingDef:=", true, "Value:=", "Pulse3.output"))))
oEditor.CreateWire Array("NAME:WireData", "Id:=", "1", "Points:=", Array(_
  "(0.0508, 0.03556)", "(0.0508, 0.0381)")), Array("NAME:Attributes", _
  "Page:=", 1) 
oEditor.CreateComponent Array("NAME:ComponentProps", "Name:=", _
  "Simplorer Elements/Basic Elements/Circuit/Ideal Switches:S", "Id:=", "686"), _
  Array("NAME:Attributes", "Page:=", 1, "X:=", 0.04826, "Y:=", 0.03048, _
  "Degrees:=", 0, "Flip:=", false) 
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PropDisplayPropTab", _
  Array("NAME:PropServers", "CompInst@S;686;0"), Array("NAME:NewProps", _
  Array("NAME:InstanceName", "Format:=", "Value", "Location:=", "Right"))))
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:Quantities", Array(_
  "NAME:PropServers", "CompInst@S;686;0"), Array("NAME:ChangedProps", Array(_
  "NAME:CTRL", "OverridingDef:=", true, "Value:=", "Pulse2.output"))))
oEditor.CreateWire Array("NAME:WireData", "Id:=", "1", "Points:=", Array(_
  "(0.0635, -0.0254)", "(0.0635, -0.02286)")), Array("NAME:Attributes", _
  "Page:=", 1) 
oEditor.CreateComponent Array("NAME:ComponentProps", "Name:=", _
  "Simplorer Elements/Basic Elements/Circuit/Ideal Switches:S", "Id:=", "693"), _
  Array("NAME:Attributes", "Page:=", 1, "X:=", 0.06096, "Y:=", -0.03048, _
  "Degrees:=", 0, "Flip:=", false) 
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PropDisplayPropTab", _
  Array("NAME:PropServers", "CompInst@S;693;0"), Array("NAME:NewProps", _
  Array("NAME:InstanceName", "Format:=", "Value", "Location:=", "Right"))))
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:Quantities", Array(_
  "NAME:PropServers", "CompInst@S;693;0"), Array("NAME:ChangedProps", Array(_
  "NAME:CTRL", "OverridingDef:=", true, "Value:=", "Pulse5.output"))))
oEditor.CreateWire Array("NAME:WireData", "Id:=", "1", "Points:=", Array(_
  "(0.0762, 0.03556)", "(0.0762, 0.0381)")), Array("NAME:Attributes", _
  "Page:=", 1) 
oEditor.CreateComponent Array("NAME:ComponentProps", "Name:=", _
  "Simplorer Elements/Basic Elements/Circuit/Ideal Switches:S", "Id:=", "700"), _
  Array("NAME:Attributes", "Page:=", 1, "X:=", 0.07366, "Y:=", 0.03048, _
  "Degrees:=", 0, "Flip:=", false) 
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PropDisplayPropTab", _
  Array("NAME:PropServers", "CompInst@S;700;0"), Array("NAME:NewProps", _
  Array("NAME:InstanceName", "Format:=", "Value", "Location:=", "Right"))))
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:Quantities", Array(_
  "NAME:PropServers", "CompInst@S;700;0"), Array("NAME:ChangedProps", Array(_
  "NAME:CTRL", "OverridingDef:=", true, "Value:=", "Pulse4.output"))))
oEditor.CreateWire Array("NAME:WireData", "Id:=", "1", "Points:=", Array(_
  "(0.0889, -0.0254)", "(0.0889, -0.02286)")), Array("NAME:Attributes", _
  "Page:=", 1) 
oEditor.CreateComponent Array("NAME:ComponentProps", "Name:=", _
  "Simplorer Elements/Basic Elements/Circuit/Ideal Switches:S", "Id:=", "707"), _
  Array("NAME:Attributes", "Page:=", 1, "X:=", 0.08636, "Y:=", -0.03048, _
  "Degrees:=", 0, "Flip:=", false) 
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PropDisplayPropTab", _
  Array("NAME:PropServers", "CompInst@S;707;0"), Array("NAME:NewProps", _
  Array("NAME:InstanceName", "Format:=", "Value", "Location:=", "Right"))))
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:Quantities", Array(_
  "NAME:PropServers", "CompInst@S;707;0"), Array("NAME:ChangedProps", Array(_
  "NAME:CTRL", "OverridingDef:=", true, "Value:=", "Pulse1.output"))))
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
Set oModule = oDesign.GetModule("SimSetup")
oModule.EditTransient "TR", Array("NAME:SimSetup", "OptionName:=", _
  "(Default Options)", "AnalysisEnabled:=", 1, "Name:=", "TR", _
  "TransientData:=", Array("50ms", "1us", "10us", false, ""), _
  "EnableContSolve:=", false)
Set oModule = oDesign.GetModule("ReportSetup")
oModule.CreateReport "Load Torque", "Standard", "Rectangular Plot", "TR", _
  Array("NAME:Context", "SimValueContext:=", _
  Array(1, 0, 2, 0, false, false, -1, 1, 0, 1, 1, "", 0, 0)), Array("Time:=", _
  Array("All")), Array("X Component:=", "Time", "Y Component:=", Array(_
  "speed.TORQUE")), Array()
oModule.CreateReport "Current", "Standard", "Rectangular Plot", "TR", Array(_
  "NAME:Context", "SimValueContext:=", _
  Array(1, 0, 2, 0, false, false, -1, 1, 0, 1, 1, "", 0, 0)), Array("Time:=", _
  Array("All")), Array("X Component:=", "Time", "Y Component:=", Array(_
  "IA.I", "IB.I", "IC.I")), Array()
sName = oDesign.GetName()
arr = Split(sName, ";")
oProject.SetActiveDesign arr(1)
oEditor.ZoomToFit
if (oArgs.Count > 0) then 
  oProject.SaveAs oArgs(0), TRUE
end if
