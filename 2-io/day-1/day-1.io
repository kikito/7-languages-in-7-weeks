# find some sample io problems
# http://iolanguage.com/about/samplecode/

# Io community that will answer questions
# stackoverflow.com  :D

# A Io style guide
# http://en.wikibooks.org/wiki/Io_Programming/Io_Style_Guide

# Evaluate 1+1 and 1+"one". Is Io strongly typed or weakly typed? Prove it with code

(1+1) println
e := try(1+"one")

e catch(Exception,
  "Io is strongly typed, or at least doesn't convert numbers into strings automagically" println
)

# Is 0 true or false. And nil? And the empty string? Answer with code

("0 is " ..   if(0,   "true", "false")) println
("nil is " .. if(nil, "true", "false")) println
("'' is " ..  if("",  "true", "false")) println

# How can you tell how many slots a prototype supports?

# You just get the size of its slotNames property:

Vehicle := Object clone
Vehicle slotNames size println

# What is the difference between equals, colon-equals, and colon-colon-equals?

# Colon-equals makes new slots
x := 1

# Equals is an assignment operator. The slot needs to be created first or it throws an exception
x = 2
x println

# Colon-colon equals also creates a setter.
Human := Object clone do(
  age ::= nil
)

peter := Human clone setAge(21)
peter age println

# run an Io program from a file
# already on it

# Execute the code in a slot given its name

code := method("this code just prints this string" println)

invokeByName := method(name, self getSlot(name) call)

invokeByName("code")

# spend some time playing with slots and prototypes. Make sure you understand how prototypes work
# Already done. See "peter" above.








