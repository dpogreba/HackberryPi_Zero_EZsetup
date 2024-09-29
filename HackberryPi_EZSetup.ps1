# Function to display thank-you message on exit
function Show-ThankYou {
    Clear-Host
    Write-Host "Thank you for using my script!" -ForegroundColor Yellow
    Start-Sleep -Seconds 5
}

# Welcome Screen
Clear-Host
Write-Host "Let's get you setup!"
Write-Host ""  # Blank line after the setup message
Write-Host "What OS do you want to run?"
Write-Host "1. Kali Linux"
Write-Host "2. Raspberry Pi OS"
Write-Host "3. RetroPi OS"
Write-Host "4. DietPi"
Write-Host "5. Exit"  # Option to exit the script
Write-Host ""  # Blank line after the options

# User selects the OS
$osSelection = Read-Host "Enter the number corresponding to the OS you want to run"

# If user selects exit
if ($osSelection -eq 5) {
    Show-ThankYou  # Call the function to show the thank-you message
    return  # Exit the script after displaying the thank-you message
}

# If user selects #1 (Kali Linux)
if ($osSelection -eq 1) {
    Clear-Host
    Write-Host "Downloading Kali Linux Raspberry Pi Zero image..."

    # Define download URL and destination
    $url = "https://kali.download/arm-images/kali-2024.3/kali-linux-2024.3-raspberry-pi-zero-w-armel.img.xz"
    $destination = "$env:USERPROFILE\Downloads\kali-linux-2024.3-raspberry-pi-zero.img.xz"

    # Download the Kali image
    try {
        Start-BitsTransfer -Source $url -Destination $destination
    } catch {
        Write-Host "Error: Failed to download the image. Please check the BITS service or your internet connection."
        return
    }

    # Raspberry Pi Imager logic here...
    # Detect external drives here...

    # Modify config.txt for Kali Linux
    $configPath = "$selectedDrive\boot\config.txt"
    if (Test-Path $configPath) {
        Add-Content $configPath -Value @"
dtoverlay=hyperpixel4
overscan_left=0
overscan_right=0 
overscan_top=0
overscan_bottom=0
framebuffer_width=720
enable_dpi_lcd=1
display_default_lcd=1
dpi_group=2
dpi_mode=87
dpi_output_format=0x5f026
dpi_timings=720 0 20 20 40 720 0 15 15 15 0 0 0 60 0 36720000 4
"@
        Write-Host "/boot/config.txt has been updated for your screen!"
        Start-Sleep -Seconds 5
    } else {
        Write-Host "config.txt not found on the SD card. Exiting..."
        return
    }

    # Handle hyperpixel4.dtbo and eject SD card logic here...
    
    Write-Host "Done! You can remove your SD card now. Enjoy!"
    Read-Host "Press Enter to continue"
    Clear-Host
    Write-Host "Returning to the main menu..."
}

# If user selects #2 (Raspberry Pi OS)
elseif ($osSelection -eq 2) {
    Clear-Host
    Write-Host "Downloading Raspberry Pi OS image..."

    # Define download URL for Raspberry Pi OS
    $url = "https://downloads.raspberrypi.org/raspios_lite_armhf_latest"
    $destination = "$env:USERPROFILE\Downloads\raspberry-pi-os-lite.img.xz"

    # Download the Raspberry Pi OS image
    try {
        Start-BitsTransfer -Source $url -Destination $destination
    } catch {
        Write-Host "Error: Failed to download the Raspberry Pi OS image. Please check the BITS service or your internet connection."
        return
    }

    # Raspberry Pi Imager logic here...
    # Detect external drives here...

    # Modify config.txt for Raspberry Pi OS
    $configPath = "$selectedDrive\boot\config.txt"
    if (Test-Path $configPath) {
        Add-Content $configPath -Value @"
dtoverlay=vc4-kms-dpi-hyperpixel4sq
"@
        Write-Host "/boot/config.txt has been updated for your screen!"
        Start-Sleep -Seconds 5
    } else {
        Write-Host "config.txt not found on the SD card. Exiting..."
        return
    }

    # Handle hyperpixel4.dtbo and eject SD card logic here...
    
    Write-Host "Done! You can remove your SD card now. Enjoy!"
    Read-Host "Press Enter to continue"
    Clear-Host
    Write-Host "Returning to the main menu..."
}

# If user selects #3 (RetroPi OS)
elseif ($osSelection -eq 3) {
    Clear-Host
    Write-Host "Downloading RetroPi OS for Raspberry Pi Zero..."

    # Define the download URL for RetroPi OS
    $url = "https://retropie.org.uk/download/RetroPieImage_rpi1_zero.zip"
    $destination = "$env:USERPROFILE\Downloads\retropi-rpi-zero.zip"

    # Download the RetroPi image
    try {
        Start-BitsTransfer -Source $url -Destination $destination
    } catch {
        Write-Host "Error: Failed to download the RetroPi OS image. Please check the BITS service or your internet connection."
        return
    }

    # Raspberry Pi Imager logic here...
    # Detect external drives here...

    # Modify config.txt for RetroPi OS
    $configPath = "$selectedDrive\boot\config.txt"
    if (Test-Path $configPath) {
        Add-Content $configPath -Value @"
dtoverlay=hyperpixel4
enable_dpi_lcd=1
dpi_group=2
dpi_mode=87
dpi_output_format=0x5f026
dpi_timings=720 0 20 20 40 720 0 15 15 15 0 0 0 60 0 36720000 4
"@
        Write-Host "/boot/config.txt has been updated for your screen!"
        Start-Sleep -Seconds 5
    } else {
        Write-Host "config.txt not found on the SD card. Exiting..."
        return
    }

    # Handle hyperpixel4.dtbo and eject SD card logic here...
    
    Write-Host "Done! You can remove your SD card now. Enjoy!"
    Read-Host "Press Enter to continue"
    Clear-Host
    Write-Host "Returning to the main menu..."
}

# If user selects #4 (DietPi)
elseif ($osSelection -eq 4) {
    Clear-Host
    Write-Host "Downloading DietPi image..."

    # Define the download URL for DietPi
    $url = "https://dietpi.com/download"
    $destination = "$env:USERPROFILE\Downloads\dietpi.img.xz"

    # Download the DietPi image
    try {
        Start-BitsTransfer -Source $url -Destination $destination
    } catch {
        Write-Host "Error: Failed to download the DietPi image. Please check the BITS service or your internet connection."
        return
    }

    # Raspberry Pi Imager logic here...
    # Detect external drives here...

    # Modify config.txt for DietPi
    $configPath = "$selectedDrive\boot\config.txt"
    if (Test-Path $configPath) {
        Add-Content $configPath -Value @"
dtoverlay=hyperpixel4
overscan_left=0
overscan_right=0 
overscan_top=0
overscan_bottom=0
framebuffer_width=720
enable_dpi_lcd=1
display_default_lcd=1
dpi_group=2
dpi_mode=87
dpi_output_format=0x5f026
dpi_timings=720 0 20 20 40 720 0 15 15 15 0 0 0 60 0 36720000 4
"@
        Write-Host "/boot/config.txt has been updated for your screen!"
        Start-Sleep -Seconds 5
    } else {
        Write-Host "config.txt not found on the SD card. Exiting..."
        return
    }

    # Handle hyperpixel4.dtbo and eject SD card logic here...
    
    Write-Host "Done! You can remove your SD card now. Enjoy!"
    Read-Host "Press Enter to continue"
    Clear-Host
    Write-Host "Returning to the main menu..."
}
