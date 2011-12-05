module Main where
  allEven :: [Integer] -> [Integer]
  allEven [] = []
  allEven (h:t) = if even h then h:allEven t else allEven t

  allEvenWithComprehensions(list) = [x | x <- list, even x]

  allEvenWithFilter(list) = filter even list
