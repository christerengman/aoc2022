[string[]] $stacks = @("") * 9  # TODO: Make dynamic
[string[]] $stacks2 = @("") * 9  # TODO: Make dynamic

function Move-Crate {
  param (
    [ref] $r,
    [int] $from,
    [int] $to,
    [int] $count
  )
  # Lookup reference
  [string[]] $s = $r.Value

  # 1 based to 0 based
  $from--
  $to--

  $s[$to] = $s[$from].Substring(0, $count) + $s[$to]
  $s[$from] = $s[$from].Substring($count)
}

Get-Content (Join-Path $PSScriptRoot "input.txt") | 
ForEach-Object {
  if ($_.StartsWith("[")) {
    $layer = $_ -replace '[\[ ]([A-Z ])[\] ] ?', '$1'
    for ($i = 0; $i -lt $layer.Length; $i++) {
      $c = $layer.Substring($i, 1)
      if (-not [string]::IsNullOrWhiteSpace($c)) {
        $stacks[$i] += $c
        $stacks2[$i] += $c
      }
    }

    return
  }
  elseif ($_.StartsWith(" 1 ")) {
    return
  }
  elseif ([string]::IsNullOrWhiteSpace($_)) {
    return
  }

  [void] ($_ -match 'move (\d+) from (\d+) to (\d+)')
  $n, $from, $to = $Matches[1..3]

  # CrateMover 9000
  for ($i = 0; $i -lt $n; $i++) {
    Move-Crate ([ref] $stacks) $from $to 1
  }

  # CrateMover 9001
  Move-Crate ([ref] $stacks2) $from $to $n

}

-join $stacks.ForEach({ $_.Substring(0,1) })
-join $stacks2.ForEach({ $_.Substring(0,1) })
