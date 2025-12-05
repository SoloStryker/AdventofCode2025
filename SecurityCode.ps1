$dialVal=50 #Starting dial position
$zCount=0 #Counts zeroes after movement
$tcount=0 #counts zeroes during movement

function Open-File([string] $initialDirectory){

    [System.Reflection.Assembly]::LoadWithPartialName("System.windows.forms") | Out-Null

    $OpenFileDialog = New-Object System.Windows.Forms.OpenFileDialog
    $OpenFileDialog.initialDirectory = $initialDirectory
    $OpenFileDialog.filter = "All files (*.*)| *.*"
    $OpenFileDialog.ShowDialog() |  Out-Null

    return $OpenFileDialog.filename
}
$fileuse=Open-File 

Get-Content -Path $fileuse | ForEach-Object -process {
    $valDir=$_.SubString(0,1) #reads turn direction
    $valTurn=$_.SubString(1) #number of clicks

    if ($valDir -eq "R")
    {
        $dialval=$dialval+[int]$valTurn
        while ($dialval -gt 99)
        {
            $dialval = $dialval-100
            $tcount++
            if ($dialVal -eq 0) { $tcount-- } #Avoids extra count for landing on 0
        }
        if ($dialval -eq 0)
        {
            $zCount++
        }
    }
    if ($valDir -eq "L")
    {
        if ($dialVal -eq 0) {$tcount--} #avoids extra count for starting from zero
        $dialval=$dialval-[int]$valTurn
        while ($dialval -lt 0)
        {
            
            $dialval = $dialval+100
            $tcount++
        }
        if ($dialval -eq 0)
        {
            $zCount++
        }
    }
}
Write-Host "Key is:"$zCount
$tcount+=$zCount
Write-Host "Method 0x434C49434B key is:"$tcount
