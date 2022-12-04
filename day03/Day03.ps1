function Get-Priority {
  param (
    [char] $c
  )
  [byte] $c - ($c -cmatch "[a-z]" ? 96 : 38)
}

Get-Content (Join-Path $PSScriptRoot "input.txt") |
ForEach-Object { $sum = 0 } {
  $size = $_.Length -shr 1
  $first = $_.Substring(0, $size)
  $second = $_.Substring($size)

  foreach ($c in $first.ToCharArray()) {
    if ($second.Contains($c)) {
      $sum += Get-Priority $c

      break
    }
  }
} { $sum }