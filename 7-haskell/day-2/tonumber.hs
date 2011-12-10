module Main where
  tonumber (_:noDollarSign) = read noCommas :: Float
    where noCommas = filter (/= ',') noDollarSign
