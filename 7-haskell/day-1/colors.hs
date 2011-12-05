module Main where
  colors = ["black", "white", "blue", "yellow", "red"]
  combine = [(a,b) | a <- colors, b <- colors, a < b]
