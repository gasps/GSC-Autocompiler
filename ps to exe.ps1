Write-Output "-----------------=========================================================---------------------"
Write-Output "GSC Autocompiler exe builder - By @DoktorSAS"
Write-Output "Building the .exe"
ps2exe -inputFile .\Compile.ps1 -outputFile  "GSC Autocompiler by DoktorSAS.exe" -iconFile .\compiler\icon.ico
Write-Output ".exe builded"
Write-Output "-----------------=========================================================---------------------"
