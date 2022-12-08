$s = Get-Content (Join-Path $PSScriptRoot "input.txt")

function Get-Marker ($n) {
  for ($i = 0; $i -lt $s.Length - $n; $i++) {
    if (($s.ToCharArray() | Select-Object -Skip $i -First $n | Group-Object).Length -eq $n) {
      return $i + $n
    }
  }    
}

Get-Marker 4
Get-Marker 14
