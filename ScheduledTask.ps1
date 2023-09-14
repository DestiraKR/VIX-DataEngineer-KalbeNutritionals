cls # Membersihkan console

# Membuat scheduled task untuk menjalankan script pada pukul 7am setiap hari
$trigger = New-ScheduledTaskTrigger -Daily -At 7am
$action = New-ScheduledTaskAction -Execute "Powershell.exe" -Argument "C:\Users\desti\CreateDirectory.ps1"
Register-ScheduledTask -Action $action -Trigger $trigger -TaskName "CreateDirectory"