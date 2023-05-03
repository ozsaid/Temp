$GPO=get-gpo -all 

foreach ($gp in $gpo) {  

$fn=$gp.DisplayName+".html" 

Get-GPOReport -Guid $gp.id -ReportType HTML | Out-File C:\Report\gpo\$fn} 
