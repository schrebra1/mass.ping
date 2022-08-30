$computers = get-content \\example.share\test.computers.txt 







  workflow test
{
  param($computers)

    foreach -parallel ($computer in $computers)
    {
        $status = Test-Connection -ComputerName $computer -Count 1 -Quiet

        if (!$status)
            {
            
            Write-Output "Offline"
            
            }

            else
            { 
            
            Write-host "Online"
            
            }
           
    }

    $computers = get-content \\example.share\test.computers.txt 
    
}



test $computers