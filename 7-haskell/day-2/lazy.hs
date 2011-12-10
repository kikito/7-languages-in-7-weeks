module Main where
  every3 x = x:(every3(x + 3))
  every5 y = y:(every5(y + 5))
  -- I confess I had to look this one up:
  every8 x y = zipWith (+) (every3 x) (every5 y)
