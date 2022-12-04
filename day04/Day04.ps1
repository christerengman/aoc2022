Get-Content (Join-Path $PSScriptRoot "input.txt") |
ForEach-Object { $count = 0; $count2 = 0 } {
  $r = $_.Split(",").Split("-") | ForEach-Object { [int]::Parse($_) }
  if (($r[1] -ge $r[2] -and $r[0] -le $r[3]) -or
  ($r[0] -le $r[3] -and $r[2] -le $r[1])) {
    $count2++  

    if (($r[0] -le $r[2] -and $r[1] -ge $r[3]) -or
    ($r[2] -le $r[0] -and $r[3] -ge $r[1])) {
      $count++
    }
  }

} { $count; $count2 }