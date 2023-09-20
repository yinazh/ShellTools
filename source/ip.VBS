msgbox "您的计算机序列号是：" &GetSerialNumber &Chr(10)_
      &"您的计算机IP地址是：" &GetIP &Chr(10)_
      &"您的电脑计算机名是：" &GetPcName &Chr(10)_
      &"",,"系统信息"

 '自定义获取主机序列号函数
Function GetSerialNumber
strComputer = "."
   Set objWMIService = GetObject("winmgmts:\\" & strComputer & "\root\CIMV2")
   Set colItems = objWMIService.InstancesOf("Win32_BIOS")
   For Each objItem In colItems
   GetSerialNumber = objItem.SerialNumber
   Next
End Function

 '自定义获取计算机名函数
Function GetPcName
strComputer = "."
   Set objWMIService = GetObject("winmgmts:\\" & strComputer & "\root\cimv2")
   Set colComputers = objWMIService.ExecQuery("Select * from Win32_ComputerSystem")
   For Each objComputer in colComputers
   GetPcName = objComputer.Name
   Next 
End Function

 '自定义获取本机IP函数
Function GetIP
ComputerName="."
    Set objWMIService = GetObject("winmgmts:\\" & ComputerName & "\root\cimv2")
    Set colItems = objWMIService.ExecQuery("Select * From Win32_NetworkAdapterConfiguration Where IPEnabled = True")
    For Each objItem in colItems
        For Each objAddress in objItem.IPAddress
            If objAddress <> "" then
                GetIP = objAddress
                Exit Function
            End If
        Next
    Next
End Function