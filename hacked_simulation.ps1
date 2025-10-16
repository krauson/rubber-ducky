Invoke-WebRequest -Uri "https://raw.githubusercontent.com/krauson/rubber-ducky/main/youBeenHacked.jpg" -OutFile "youBeenHacked.jpg"

New-Item -ItemType Directory -Path "$env:USERPROFILE\Desktop\hack"
Move-Item "$env:USERPROFILE\Desktop\hacked_simulation.ps1" "$env:USERPROFILE\Desktop\hack"
Move-Item "$env:USERPROFILE\Desktop\youBeenHacked.jpg" "$env:USERPROFILE\Desktop\hack"

Write-Host "$pwd"

$hwnd = Get-Process -Id $PID | ForEach-Object { $_.MainWindowHandle }
[WinAPI]::SetForegroundWindow($hwnd)

Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

# Set console colors and title
$host.UI.RawUI.WindowTitle = "System Breach Detected"
$host.UI.RawUI.BackgroundColor = "Black"
$host.UI.RawUI.ForegroundColor = "Green"
Clear-Host

# Simulated attack sequence
Write-Host "Initializing breach protocol..." -ForegroundColor Green
Start-Sleep -Seconds 2
Write-Host "Bypassing firewall..."
Start-Sleep -Seconds 2
Write-Host "Accessing secure server..."
Start-Sleep -Seconds 2
Write-Host "Downloading classified files..."
Start-Sleep -Seconds 2

# Fake file listing
for ($i=1; $i -le 10; $i++) {
    Write-Host "File_$i.txt [OK]"
    Start-Sleep -Milliseconds 300
}

# Fake upload
Write-Host "`nUploading data to remote server..."
Start-Sleep -Seconds 2
Write-Host "Upload complete. Data exfiltrated successfully."

# Dramatic ending
Start-Sleep -Seconds 2
Write-Host "`nSystem lockdown initiated..."
Start-Sleep -Seconds 1
Write-Host "Goodbye." -ForegroundColor Red
Start-Sleep -Seconds 2

# Display image in fullscreen
$form = New-Object Windows.Forms.Form
$form.WindowState = 'Maximized'
$form.FormBorderStyle = 'None'
$form.TopMost = $true
$form.BackColor = 'Black'


$imagePath = "C:\Users\Brinks\Desktop\hack\youBeenHacked.jpg"
$image = [System.Drawing.Image]::FromFile($imagePath)
$pictureBox = New-Object Windows.Forms.PictureBox
$pictureBox.Image = $image
$pictureBox.SizeMode = 'StretchImage'
$pictureBox.Dock = 'Fill'

$form.Controls.Add($pictureBox)
$form.ShowDialog()
