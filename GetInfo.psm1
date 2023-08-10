Add-Type -AssemblyName System.Windows.Forms

Function Get-SystemSpecifications() 
{

    $UserInfo = Get-UserInformation;
    $OS = Get-OS;
    $Kernel = Get-Kernel;
    $Uptime = Get-Uptime;
    $Motherboard = Get-Mobo;
    $Shell = Get-Shell;
    $Displays = Get-Displays;
    $WM = Get-WM;
    $Font = Get-Font;
    $CPU = Get-CPU;
    $GPU = Get-GPU;
    $RAM = Get-RAM;
    $Disks = Get-Disks;
    $emptySpace = "";
    $disVer = "1.6";

    [System.Collections.ArrayList] $SystemInfoCollection = 
        $UserInfo,
        $emptySpace,
        $disVer,
        $OS, 
        $Kernel,
        $Uptime,
        $Motherboard,
        $Shell,
        $Displays,
        $WM,
        $Font,
        $emptySpace,
        $CPU,
        $GPU,
        $RAM,
        $emptySpace;

    foreach ($Disk in $Disks)
    {
        [void]$SystemInfoCollection.Add($Disk);
    }
    
    return $SystemInfoCollection;
}

Function Get-LineToTitleMappings() 
{ 
    $TitleMappings = @{
        0 = "User: ";
        1 = "";
        2 = "FinnGet Version: ";
        3 = "OS: "; 
        4 = "Kernel: ";
        5 = "Uptime: ";
        6 = "Motherboard: ";
        7 = "Shell: ";
        8 = "Resolution: ";
        9 = "Window Manager: ";
        10 = "Font: ";
        11 = "";
        12 = "CPU: ";
        13 = "GPU ";
        14 = "RAM: ";
    };

    return $TitleMappings;
}

function Get-UserInformation {
    $username = $env:USERNAME
    $computerName = (Get-CimInstance Win32_ComputerSystem).Name
    return "$username@$computerName"
}

function Get-OS {
    $operatingSystem = Get-CimInstance Win32_OperatingSystem
    return "$($operatingSystem.Caption) $($operatingSystem.OSArchitecture)"
}


function Get-Kernel {
    $kernelVersion = (Get-CimInstance Win32_OperatingSystem).Version
    return $kernelVersion
}


function Get-Uptime {
    $uptimeInSeconds = (Get-CimInstance Win32_PerfFormattedData_PerfOS_System).SystemUpTime
    $uptime = [TimeSpan]::FromSeconds($uptimeInSeconds)

    $formattedUptime = "{0}d {1}h {2}m {3}s" -f $uptime.Days, $uptime.Hours, $uptime.Minutes, $uptime.Seconds
    return $formattedUptime
}


Function Get-Mobo {
    $motherboard = Get-CimInstance Win32_BaseBoard | Select-Object Manufacturer, Product
    return "$($motherboard.Manufacturer) $($motherboard.Product)"
}

Function Get-Shell {
    return "PowerShell $($PSVersionTable.PSVersion)"
}

Function Get-Displays {
    $displays = @()

    $monitors = Get-CimInstance -Namespace "root\wmi" -Class WmiMonitorListedSupportedSourceModes

    foreach ($monitor in $monitors) {
        $sortedResolutions = $monitor.MonitorSourceModes | Sort-Object -Property { $_.HorizontalActivePixels * $_.VerticalActivePixels }
        $maxResolution = "{0} x {1}" -f $sortedResolutions[-1].HorizontalActivePixels, $sortedResolutions[-1].VerticalActivePixels
        $displays += $maxResolution
    }

    return $displays
}


Function Get-WM() 
{
    return "DWM";
}

Function Get-Font() 
{
    return "Segoe UI";
}

Function Get-CPU {
    $cpuName = (Get-CimInstance Win32_Processor).Name -replace '\s+', ' '
    return $cpuName
}

Function Get-GPU {
    $gpuName = (Get-CimInstance Win32_VideoController).Description
    return $gpuName
}

Function Get-RAM {
    $osInfo = Get-CimInstance Win32_OperatingSystem
    $systemInfo = Get-CimInstance Win32_ComputerSystem

    $freeRam = [math]::Truncate($osInfo.FreePhysicalMemory / 1KB)
    $totalRam = [math]::Truncate($systemInfo.TotalPhysicalMemory / 1MB)
    $usedRam = $totalRam - $freeRam
    $usedRamPercent = [math]::Round(($usedRam / $totalRam) * 100)
    
    $ramInfo = "{0} MB / {1} MB ({2}%)" -f $usedRam, $totalRam, $usedRamPercent
    return $ramInfo
}



Function Get-Disks {
    $formattedDisks = @()

    $logicalDisks = Get-CimInstance Win32_LogicalDisk | Where-Object { $_.DeviceID -match '^[A-Z]:' }

    foreach ($logicalDisk in $logicalDisks) {
        $diskID = $logicalDisk.DeviceID
        $diskSizeGB = [math]::Round($logicalDisk.Size / 1GB)
        $freeDiskSizeGB = [math]::Round($logicalDisk.FreeSpace / 1GB)
        $driveType = $logicalDisk.DriveType

        if ($driveType -eq 5) {
	        if ($diskSizeGB -gt 0) {
                $usedDiskSizeGB = $diskSizeGB - $freeDiskSizeGB
                $usedDiskPercent = [math]::Round(($usedDiskSizeGB / $diskSizeGB) * 100)

                $formattedDisk = "Optical Disk $diskID $usedDiskSizeGB GB / $diskSizeGB GB ($usedDiskPercent%)"
            } else {
                $formattedDisk = "Optical Disk $diskID -- Empty --"
            }
        } elseif ($driveType -eq 3) {
	        if ($diskSizeGB -gt 0) {
                $usedDiskSizeGB = $diskSizeGB - $freeDiskSizeGB
                $usedDiskPercent = [math]::Round(($usedDiskSizeGB / $diskSizeGB) * 100)

                $formattedDisk = "Disk $diskID $usedDiskSizeGB GB / $diskSizeGB GB ($usedDiskPercent%)"
            } else {
                $formattedDisk = "Disk $diskID -- Empty --"
            }		
	} elseif ($driveType -eq 2) {
            if ($diskSizeGB -gt 0) {
                $usedDiskSizeGB = $diskSizeGB - $freeDiskSizeGB
                $usedDiskPercent = [math]::Round(($usedDiskSizeGB / $diskSizeGB) * 100)

                $formattedDisk = "Flash Drive $diskID $usedDiskSizeGB GB / $diskSizeGB GB ($usedDiskPercent%)"
            } else {
                $formattedDisk = "Flash Drive $diskID -- Empty --"
            }
        } else {
            $formattedDisk = "Unknown Drive Type $diskID"
        }

        $formattedDisks += $formattedDisk
    }

    return $formattedDisks
}

