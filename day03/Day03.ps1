function Get-Priority {
  param (
    [char] $c
  )
  [byte] $c - ($c -cmatch "[a-z]" ? 96 : 38)
}

$group = 0..2

Get-Content (Join-Path $PSScriptRoot "input.txt") |
ForEach-Object { $sum = 0; $sum2 = 0; $i = 0 } {
  $size = $_.Length -shr 1
  $first = $_.Substring(0, $size)
  $second = $_.Substring($size)

  foreach ($c in $first.ToCharArray()) {
    if ($second.Contains($c)) {
      $sum += Get-Priority $c

      break
    }
  }

  $group[$i] = $_

  if ($i -eq 2) {
    foreach ($c in $group[0].ToCharArray()) {
      if ($group[1].Contains($c) -and $group[2].Contains($c)) {
        $sum2 += Get-Priority $c

        break
      }
    }
  }

  $i = ($i + 1) % 3

} { $sum; $sum2 }