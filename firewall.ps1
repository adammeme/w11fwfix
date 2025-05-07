#create new folder
New-Item -ItemType Directory -Path $extractPath -Force
#copy the folder from g drive
Copy-Item -Path G:\Public\ICT\IT\bfe.zip -Destination C:\Registry -Recurse
#extract the zip
Expand-Archive -Path "C:\Registry\bfe.zip" -DestinationPath "C:\Registry" -Force
#run the registry
reg.exe save "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SharedAccess" "C:\Registry\sharedaccess_backup.hiv"
reg.exe save "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\MpsSvc" "C:\Registry\MpsSvc_backup.hiv"
reg.exe save "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\BFE" "C:\Registry\bfe_backup.hiv"
reg.exe restore "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SharedAccess" "C:\Registry\sharedaccess.hiv"
reg.exe restore "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\MpsSvc" "C:\Registry\mpssvc.hiv"
reg.exe restore "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\BFE" "C:\Registry\bfe.hiv"
#reboot command to ensure the work is completed
shutdown /r /t 120
