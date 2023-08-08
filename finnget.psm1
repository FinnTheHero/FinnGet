Function finnget()
{
    $AsciiArt = . Get-WindowsArt;

    $SystemInfoCollection = . Get-SystemSpecifications;
    $LineToTitleMappings = . Get-LineToTitleMappings;

    if ($SystemInfoCollection.Count -gt $AsciiArt.Count) 
    { 
        Write-Error "System Specs occupies more lines than the Ascii Art resource"
    }

    for ($line = 0; $line -lt $AsciiArt.Count; $line++) 
    {
        Write-Host $AsciiArt[$line] -f Blue -NoNewline;
        Write-Host $LineToTitleMappings[$line] -f Red -NoNewline;

        if ($line -eq 0) 
        {
            Write-Host $SystemInfoCollection[$line] -f Red;
        }

        elseif ($SystemInfoCollection[$line] -like '*:*') 
        {
            $Seperator = ":";
            $Splitted = $SystemInfoCollection[$line].Split($seperator);

            $Title = $Splitted[0] + $Seperator;
            $Content = $Splitted[1];

            Write-Host $Title -f Red -NoNewline;
            Write-Host $Content;
        }
        else 
        {
            Write-Host $SystemInfoCollection[$line];            
        }
    }
}

