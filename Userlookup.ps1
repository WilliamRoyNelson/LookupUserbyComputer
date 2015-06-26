Add-Type -AssemblyName microsoft.visualbasic;
Add-Type -AssemblyName system.windows.forms;
[System.Reflection.Assembly]::LoadWithPartialName('Microsoft.VisualBasic') | Out-Null;
$computername = [Microsoft.VisualBasic.Interaction]::InputBox("Enter the Computer name or IP address", "Computer ID", "");
$explore = Get-WmiObject -Class win32_process -ComputerName $computername | Where-Object{ $_.Name -eq "explorer.exe" };
$Name = dsquery user -samid $explore.GetOwner().User -o rdn;
[Microsoft.VisualBasic.Interaction]::MsgBox(($explore.PSComputerName)+"`n"+($explore.GetOwner().User)+"`n"+($Name),1,'WHO IS ON THAT COMPUTER!');
