module Main where

  -- I could not do this one because I didn't understand what I was asked to do
  -- This is copied from http://blog.wakatta.jp/blog/2011/11/19/seven-languages-in-seven-weeks-haskell-day-3/

  try key [] = Nothing
  try key ((k,val):tail)
    | k == key = Just val
    | otherwise = try key tail

  fugly = [("a", [("b", [("c", "foo")])])]

  -- usage:
  -- try "a" fugly >>= try "b" >>= try "c"
