Write-Output "-----------------=========================================================---------------------"
New-Item -ItemType Directory -Path bin -ErrorAction SilentlyContinue
New-Item -ItemType Directory -Path src -ErrorAction SilentlyContinue
Write-Output "GSC Autocompiler - By @DoktorSAS"

try {
    # Define a log file for debugging output
    $debugLog = ".\debug_log.txt"
    New-Item -Path $debugLog -Force | Out-Null
    Add-Content -Path $debugLog -Value "Debug Log - $(Get-Date)"
    
    if (Test-Path -Path '.\src\main.gsc') {
        if (Test-Path '.\bin\result-compiled.gsc') {
            Write-Output "Removing old result-compiled.gsc"
            Remove-Item '.\bin\result-compiled.gsc'
        }
        
        Write-Output "Loading main"
        Get-Content '.\src\main.gsc' > result-uncompiled.gsc
        Add-Content -Path $debugLog -Value "Loaded main.gsc successfully."
        
        Write-Output "Main file Loaded"
        Write-Output "Loading other files"

        # Debugging: List all GSC files found for compilation
        $gscFiles = Get-ChildItem -Path '.\src' -Filter '*.gsc' -Exclude 'main.gsc' -Recurse
        Add-Content -Path $debugLog -Value "Files found for compilation:"
        $gscFiles | ForEach-Object {
            $lineCount = (Get-Content -Path $_.FullName | Measure-Object -Line).Lines
            Add-Content -Path $debugLog -Value "  - $($_.FullName) | $lineCount lines"
            Write-Output "$($_.FullName) | $lineCount lines"
        }
        
        # Process each GSC file and concatenate their contents
        foreach ($file in $gscFiles) {
            $filePath = $file.FullName
            Write-Output "Processing file: $filePath"
            try {
                Get-Content -Path $filePath | Out-File -Append -FilePath result-uncompiled.gsc
                Add-Content -Path $debugLog -Value "Processed file: $filePath successfully."
            } catch {
                Write-Output "Error processing file: $filePath - $_"
                Add-Content -Path $debugLog -Value "Error processing file: $filePath - $_"
            }
        }
        
        Write-Output "*.gsc files loaded"

        # Start the compiler and capture output and errors
        $process = Start-Process '.\compiler\Compiler.exe' -ArgumentList ".\result-uncompiled.gsc" -Wait -NoNewWindow -PassThru -RedirectStandardOutput ".\compiler_output.txt" -RedirectStandardError ".\compiler_errors.txt"
    
    } else {
        Add-Type -AssemblyName System.Windows.Forms
        $global:balloon = New-Object System.Windows.Forms.NotifyIcon
        $path = (Get-Process -id $pid).Path
        $balloon.Icon = [System.Drawing.Icon]::ExtractAssociatedIcon($path)
        $balloon.BalloonTipIcon = [System.Windows.Forms.ToolTipIcon]::Warning
        $balloon.BalloonTipText = 'Missing file main.gsc'
        $currentPathLocation = Split-Path -Path $pwd -Leaf
        $balloon.BalloonTipTitle = "Unable to compile the $currentPathLocation"
        $balloon.Visible = $true
        $balloon.ShowBalloonTip(5000)
    }
} catch {
    Write-Output "An unexpected error occurred: $_"
    Add-Content -Path $debugLog -Value "Unexpected error occurred: $_"

    if (-not (Test-Path -Path '.\compiler\Compiler.exe') -or -not (Test-Path -Path '.\compiler\Irony.dll')) {
        Write-Output "I am not allowed to share the compiler for GSC scripts."
        Write-Output "Please manually insert Compiler.exe and Irony.dll in the compiler folder."
        Add-Type -AssemblyName System.Windows.Forms
        $global:balloon = New-Object System.Windows.Forms.NotifyIcon
        $path = (Get-Process -id $pid).Path
        $balloon.Icon = [System.Drawing.Icon]::ExtractAssociatedIcon($path)
        $balloon.BalloonTipIcon = [System.Windows.Forms.ToolTipIcon]::Error
        $balloon.BalloonTipText = 'Missing compiler.exe or Irony.dll'
        $currentPathLocation = Split-Path -Path $pwd -Leaf
        $balloon.BalloonTipTitle = "Unable to execute the compiler"
        $balloon.Visible = $true
        $balloon.ShowBalloonTip(5000)
        Start-Process "https://drive.google.com/file/d/1j_ocjFCQsFaWqF2-PfdoJt2nF_EpNL_G/view"
    } else {
        Add-Type -AssemblyName System.Windows.Forms
        $global:balloon = New-Object System.Windows.Forms.NotifyIcon
        $path = (Get-Process -id $pid).Path
        $balloon.Icon = [System.Drawing.Icon]::ExtractAssociatedIcon($path)
        $balloon.BalloonTipIcon = [System.Windows.Forms.ToolTipIcon]::Error
        $balloon.BalloonTipText = 'An exception occurred during compilation'
        $currentPathLocation = Split-Path -Path $pwd -Leaf
        $balloon.BalloonTipTitle = "Unable to compile the $currentPathLocation"
        $balloon.Visible = $true
        $balloon.ShowBalloonTip(5000)
    }
}
