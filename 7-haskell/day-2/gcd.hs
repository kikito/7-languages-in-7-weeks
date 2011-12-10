module Main where
  import Data.List
  greatestCommonDen x y = maximum (commonRoots x y)
    where commonRoots x y = intersect (roots x) (roots y)
          roots x = [ r | r <- [1 .. x], (x `mod` r) == 0 ]
