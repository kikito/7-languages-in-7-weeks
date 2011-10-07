# do fibonacci recursive and in a loop

recfib := method( n, if( n < 2, 1, recfib(n-1) + recfib(n-2) ) )

recfib(6) println

loopfib := method(n,
  if( n < 2, 1,
    n_1 := 1
    n_2 := 1
    sum := 2
    for(i, 2, n,
      sum = n_1 + n_2
      n_2 = n_1
      n_1 = sum
    )
    sum
  )
)

loopfib(6) println

# Change / to return 0 if the denominator is 0

prevDivision := Number getSlot("/")
Number / = method( other, if(other == 0, 0, prevDivision(other)) )

(10 / 2) println
(10 / 0) println

# Write a program to add all the numbers on a 2d array

List sum2d := method(reduce(accum, line, accum + line sum, 0))

x := list( list( 1, 2, 3 ),
           list( 4, 5, 6 ),
           list( 7, 8, 9 ) )
x sum2d println

# Add a slot called myAverage to a list that computes the average of all the numbers in that list.

List myAverage := method(sum / size)

list(1,2,3) myAverage println


# What happens if there are no numbers on that list

# In my case, I get a "nil can't be divided by anything" error. This is because of the way my sum method is defined

# list() myAverage println  # throws nil can't be divided


# Bonus: raise an Io exception if any item on the list is not a number

List strictSum := method(reduce(accum, item,
  if( not (item isKindOf(Number)),  Exception raise("Only numbers allowed") )
  accum + item
))

List strictAverage := method( strictSum / size )

list(1,2,3) strictAverage println
# list(1,2,"a") strictAverage println # this raises an exception


# Write a prototype for a two-dimensional list.

List2D := List clone

# The dim(x,y) method should allocate a list of y lists of x elements long

dim := method(x,y, List2D clone setSize(y) mapInPlace(_, List clone setSize(x)) )

dim(5,2) println

# set(x,y,value) should set a value, and get(x,y) should retrieve it

List2D set := method(x,y,value, at(y) atPut(x,value))
List2D get := method(x,y, at(y) at(x))

l := dim(5,2)
l set(2,1,"foo")
l get(2,1) println

# bonus: write a transpose method

List2D transpose := method(
  other:= dim(size, at(0) size)
  foreach(y,row, row foreach(x,value, other set(y,x,value)))
  other
)

List2D with := method( source,
  result:=dim(source size, source at(0) size)
  source foreach(y,row, row foreach(x,value, result set(x,y,value)))
  result
)

l := dim(2,2)
l set(0,0,1)
l set(1,0,2)
l set(0,1,3)
l set(1,1,4)
l println
l transpose println

# write the matrix to a file, and read it back
List2D serializeTo := method(path, File open(path) write(serialized) close)
List2D serializeFrom := method(path, with(doFile(path)))

l serializeTo("list.io")
m := List2D serializeFrom("list.io")

l println
m println
