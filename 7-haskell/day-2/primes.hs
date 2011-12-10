module Main where
  -- reference: http://stackoverflow.com/questions/3596502/lazy-list-of-prime-numbers
  primes = nextPrime [2..]
    where
      nextPrime (p:xs) = p : nextPrime [x|x <- xs, x `mod` p > 0]
