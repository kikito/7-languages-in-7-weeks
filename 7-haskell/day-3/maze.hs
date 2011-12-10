module Maze where

  -- Represent a maze type and a Node type
  type Node = (Int, Int)
  type Row = [Node]
  type Maze = [Row]

  -- a function to return a node given its coordinates
  getNode x y maze = row !! x
    where row = maze !! y

  getNeighbors (x y) maze = [
    (getNode x-1 y maze),
    (getNode x+1 y maze),
    (getNode x y-1 maze),
    (getNode x y-1 maze)
  ]

  -- use a List monad to solve the maze

  -- hahaha good one!


  -- Implement a Monad in a nonfunctional language

  -- I don't even know what this means. For all I know, all nonfunctional languages are monads.
  -- I mean, I can do IO and sequential treatments in them just fine. Look:
  --
  --     [1,2,3].each { |x| puts x }

