[string[]] $stacks = @("") * 9  # TODO: Make dynamic

Get-Content (Join-Path $PSScriptRoot "input.txt") | 
ForEach-Object {
  if ($_.StartsWith("[")) {
    $layer = $_ -replace '[\[ ]([A-Z ])[\] ] ?', '$1'
    for ($i = 0; $i -lt $layer.Length; $i++) {
      $c = $layer.Substring($i, 1)
      if (-not [string]::IsNullOrWhiteSpace($c)) {
        $stacks[$i] += $c
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
  for ($i = 0; $i -lt $n; $i++) {
    $stacks[$to - 1] = $stacks[$from - 1].Substring(0,1) + $stacks[$to - 1]
    $stacks[$from - 1] = $stacks[$from - 1].Substring(1)
  }
}

$answer = ""
foreach ($stack in $stacks) {
  $answer += $stack.Substring(0,1)
}

$answer