# A = Rock
# B = Paper
# C = Scissors
$score = @{
  A = @{
    A = 1 + 3;
    B = 2 + 6;
    C = 3 + 0;
  };
  B = @{
    A = 1 + 0;
    B = 2 + 3;
    C = 3 + 6;
  };
  C = @{
    A = 1 + 6;
    B = 2 + 0;
    C = 3 + 3;
  }
}

# A/X = Rock
# B/Y = Paper
# C/Z = Scissors
$strategy1 = @{
  X = "A";
  Y = "B";
  Z = "C";
}

# A = Rock
# B = Paper
# C = Scissors
# X = Lose
# Y = Draw
# Z = Win
$strategy2 = @{
  A = @{
    X = "C";
    Y = "A";
    Z = "B";
  };
  B = @{
    X = "A";
    Y = "B";
    Z = "C";
  };
  C = @{
    X = "B";
    Y = "C";
    Z = "A";
  };
}

Get-Content (Join-Path $PSScriptRoot "input.txt") |
ForEach-Object { $sum1 = 0; $sum2 = 0 } {
  $moves = $_.Split(" ")
  $sum1 += $score[$moves[0]][$strategy1[$moves[1]]]
  $sum2 += $score[$moves[0]][$strategy2[$moves[0]][$moves[1]]]
} { $sum1; $sum2 }