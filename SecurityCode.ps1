$dialVal=50
$zCount=0
$turns=0
#Reads a txt file named "Day1input.txt" in the same directory


Get-Content -Path .\day1input.txt | ForEach-Object -process {
    #write-host "Turn "($_.SubString(0,1))" for "($_.SubString(1))
    $valDir=$_.SubString(0,1)
    $valTurn=$_.SubString(1)
    #$turns++
    #Write-Host "Turns :"$turns
    #Write-Host " Parsing "$_" as "$valDir" and "$valTurn
    if ($valDir -eq "R")
    {
        #Write-Host "  Turning Right by"$valTurn
        $dialval=$dialval+[int]$valTurn
        while ($dialval -gt 99)
        {
            $dialval = $dialval-100
        }
        #Write-Host "  Dial now at"$dialval
        if ($dialval -eq 0)
        {
            $zCount++
            #write-host "  hit Zero!"
        }
    }
    if ($valDir -eq "L")
    {
        #Write-Host "  Turning Left by"$valTurn
        $dialval=$dialval-[int]$valTurn
        while ($dialval -lt 0)
        {
            $dialval = $dialval+100
        }
        #Write-Host "  Dial now at"$dialval
        if ($dialval -eq 0)
        {
            $zCount++
            #write-host "  hit Zero!"
        }
    }
    #Write-Host "Dial turned to :"$dialval
}
Write-Host "Key is "$zCount