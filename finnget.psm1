Function finnget()
{
    $OperatingSystem = Get-OS

    if ($OperatingSystem -match "Windows 10") {
        $AsciiArt = . Get-Windows10Art
    } elseif ($OperatingSystem -match "Windows 11") {
        $AsciiArt = . Get-Windows11Art
    } else {
        Write-Error "Unsupported operating system: $OperatingSystem"
        $AsciiArt = . Get-SkullArt
        return
    }


    $SystemInfoCollection = . Get-SystemSpecifications
    $LineToTitleMappings = . Get-LineToTitleMappings
    
    $emptySpace = Get-EmptySpace

    $logoLength = $AsciiArt[0].Count  # Get the length of the logo

    $maxIterations = 0  # Initialize the maximum iteration limit

    # Determine the maximum iteration limit based on the lengths
    if ($AsciiArt.Count -gt $SystemInfoCollection.Count) {
        $maxIterations = $AsciiArt.Count
    } else {
        $maxIterations = $SystemInfoCollection.Count
    }

    # If the logo length is larger, update the maximum iteration limit
    if ($logoLength -gt $maxIterations) {
        $maxIterations = $logoLength
    }
    
    for ($line = 0; $line -lt $maxIterations; $line++)
    {
        # Print logo line if available
        if ($line -lt $AsciiArt.Count) {
            Write-Host $AsciiArt[$line] -f Blue -NoNewline
        } else {
            Write-Host $emptySpace -NoNewline  # Print empty space for logo line
        }

        Write-Host $LineToTitleMappings[$line] -f Red -NoNewline

        if ($line -eq 0)
        {
            Write-Host $SystemInfoCollection[$line] -f Red
        }
        elseif ($SystemInfoCollection[$line] -like '*:*')
        {
            $Seperator = ":"
            $Splitted = $SystemInfoCollection[$line].Split($seperator)

            $Title = $Splitted[0] + $Seperator
            $Content = $Splitted[1]

            Write-Host $Title -f Red -NoNewline
            Write-Host $Content
        }
        else
        {
            Write-Host $SystemInfoCollection[$line]
        }
    }
}
