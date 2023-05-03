 

 

#Inactive Users that are enabled - 90 without logon 

  

  

$iDefinedOldDays = 90 

$dDaysAgo = [DateTime]::Now.Subtract([TimeSpan]::FromDays($iDefinedOldDays)) 

$aOldUsers = Get-ADUser -Filter {(Enabled -eq 'True') -and (LastLogonDate -le $dDaysAgo) -and (PasswordLastSet -le $dDaysAgo)} -Properties EmployeeID,LastLogonDate,PasswordLastSet,Department,Initials 

$aOldUsers | Export-Csv C:\Report\InactiveUsers.csv 

  

#Inactive Computers  that are enabled - 90 without logon 

$cmp=Get-ADComputer -Properties LastLogonDate,OperatingSystem -Filter {(Enabled -eq 'True') -and (LastLogonDate -le $dDaysAgo)} | select Name,LastLogonDate,DistinguishedName,OperatingSystem  

  

$cmp | export-csv C:\Report\inactive_computers.csv 

  

  

#Disabled Users  

  

$DUSR=Search-ADAccount -UsersOnly -AccountDisabled | Select Name,LastLogonDate,DistinguishedName 

$DUSR |  Export-Csv C:\Report\DisabledUsers.csv 

  

#Disabled Computers  

  

$DCMP=Search-ADAccount -ComputersOnly -AccountDisabled | Select Name,LastLogonDate,DistinguishedName 

$DCMP |  Export-Csv C:\Report\DisabledComputers.csv 
