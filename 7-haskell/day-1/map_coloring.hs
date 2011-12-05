module Main where
  colors = ["red", "green", "blue"]
  mapColoring = [ ("Tennesee", t, "Mississippi", m, "Alabama", a, "Georgia", g, "Florida", f) |
                  t <- colors, m <- colors, a <- colors, g <- colors, f <- colors,
                  m /= t, m /= a,
                  a /= t, a /= g, a /= f,
                  g /= f, g /= t ]
