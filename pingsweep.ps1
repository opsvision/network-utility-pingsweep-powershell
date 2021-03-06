#input.txt should be similar to '8.8.8.8,8.8.4.4,hostname1'
#must run the powershell command with `powershell -ExecutionPolicy ByPass -File .\pingsweep.ps1`
$complist = gc input.txt
$ping = new-object system.net.networkinformation.ping
$pingreturns = @()
$complist.Split(",") | foreach {
  
  Write-Host $_
  $returns = Test-Connection -ComputerName $_ -Count 5 -BufferSize 15000;
         $avg = ($returns | Measure-Object ResponseTime -Average).Average;
          $max = ($returns | Measure-Object ResponseTime -Maximum).Maximum;
          $min = ($returns | Measure-Object ResponseTime -Minimum).Minimum;
          $avgInt = ($avg -as [int] );
          $maxInt = ($max -as [int] );
          $minInt = ($min -as [int] );
          Write-Host "The Average response time for $_ is $avgInt ms";
          Write-Host "The Maximum response time for $_ is $maxInt ms";
          Write-Host "The Minimum response time for $_ is $minInt ms";
          $single = @{ "Host" = $_ ; "Max RTT" = $maxInt; "Min RTT" = $minInt; "Average RTT" = $avgInt }
          New-Object -TypeName PSObject -Property $single -OutVariable singlestatus
          $pingreturns += $singlestatus
}
$pingreturns | Export-csv -Path ".\output.csv"
