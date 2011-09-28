# Find out how to access files with and without blocks. What is the benefit of using blocks?

# without block:

f = File.new('foo.txt')
text = f.readlines
puts text
f.close

# with block (several ways, this is just one)
File.foreach('foo.txt') { |s| puts s }

#advantages: less text, you don't have to remember closing the file

# How do you translate a hash into an array?
hash = { :a => "Hello", :b => "World" }
array = hash.to_a

puts("hash: #{hash.inspect}")
puts("array: #{array.inspect}")

# Can you translate an array into a hash?

# There're many ways to do it. IMHO the most univocal one is this:

array = [ 'a','b','c','d' ]
hashed_array = {}
array.each_with_index { |x,index| hashed_array[index]=x }

puts("array: #{array.inspect}")
puts("hashed_array: #{hashed_array.inspect}")

# Can you iterate through a hash?

# Certainly
hash.each { |k,v| puts "#{k} => #{v}" }

# You can use arrays as stacks. What other data structures can you do?

# Queues. Almost any kind of graph, including trees.
# They are also stringbuffers, although probably that's not really a data structure.
