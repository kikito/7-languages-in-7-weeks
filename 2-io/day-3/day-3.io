# Enhance the XML program to add spaces to show the indentation structure


Builder := Object clone

Builder level := 0

Builder tab := method( "  " repeated(level) )

Builder forward := method(
  writeln(tab, "<", call message name, ">")
  level = level + 1
  call message arguments foreach(
    arg,
    content := self doMessage(arg)
    if(content type == "Sequence", writeln(tab, content))
  )
  level = level - 1
  writeln(tab, "</", call message name, ">")
)


Builder ul( li("Io"), li("Lua"), li("Javascript") )




# Create a list syntax that uses brackets

squareBrackets := method( call message arguments )
List squareBrackets := method(index, value, if(value == nil, at(index), atPut(index, value)))

l := ["a", "list", "made", "with", "brackets"]
l println
l[1] println
l[1, "table"]
l println




# Enhance the xml program to handle attributes: if the first argument is a map (with the curly braces syntax) add attributes

# curly bracket syntax
OperatorTable addAssignOperator(":", "atPutNumber")

curlyBrackets := method(
  r := Map clone
  call message arguments foreach(arg, r doMessage(arg))
  r
)

Map atPutNumber := method(
  self atPut(
    call evalArgAt(0) asMutable removePrefix("\"") removeSuffix("\""),
    call evalArgAt(1)
  )
)

# new builder
Builder2 := Builder clone


Builder2 forward := method(
  write(tab, "<", call message name)
  firstMessage := call message arguments first
  if( firstMessage != nil,
    attrs := doMessage(firstMessage)
    if(attrs isKindOf(Map), attrs foreach(k,v,write(" ",k,"=",v)))
  )
  writeln(">")
  level = level + 1
  call message arguments foreach(
    arg,
    content := self doMessage(arg)
    if(content type == "Sequence", writeln(tab, content))
  )
  level = level - 1
  writeln(tab, "</", call message name, ">")
)

# I must execute this inside a string because otherwise the changes in the OperatorTable don't take effect
str := "Builder2 ul({\"class\":\"prototyped\"}, li(\"Io\"), li(\"Lua\"), li(\"Javascript\") )"
doString(str)







