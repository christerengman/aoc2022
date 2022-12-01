$elf = 0
$elves = @()

Get-Content (Join-Path $PSScriptRoot "input.txt") |
ForEach-Object {
  $s = $_
  if ([string]::IsNullOrWhiteSpace($s)) {
    $elves += $elf
    $elf = 0
  } else {
    $elf += [int]::Parse($s)
  }
}

$elves | Sort-Object -Descending | Select-Object -First 1
$elves | Sort-Object -Descending | Select-Object -First 3 | ForEach-Object { $s = 0 } { $s += $_ } { $s }
