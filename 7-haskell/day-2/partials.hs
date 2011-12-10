module Main where
  half = (/ 2) -- don't look at me like that. / is a function
  newlined = tacnoc "\n" -- inverse concat
    where tacnoc tail head = head ++ tail
