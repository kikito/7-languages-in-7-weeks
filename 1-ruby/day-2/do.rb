# print the contents of a 16-item array, 4 items at a time, using only
# each

count = 1
(1..16).to_a.each do |x|
  print(x,' ')
  puts if (count % 4) == 0
  count += 1
end

# now using each_slice

(1..16).to_a.each_slice(4) { |r| puts r.join(' ') }

# modify the Tree class so it accepts a hash on its creation

class Tree
  attr_accessor :children, :name

  def initialize(hash)
     @name = hash.keys.first
     @children = []
     hash[@name].each { |n,c| @children << Tree.new(n => c) }
  end

  def visit_all(&block)
    visit &block
    children.each {|c| c.visit_all(&block)}
  end

  def visit(&block)
    block.call self
  end
end

tree = Tree.new(:granpa => {:father => {:child1 => {}, :child2 => {}}, :uncle => {:child3 => {}}})

tree.visit_all { |n| puts n.name }

# write a simple grep. You will need simple regexp matching. Include
# line numbers if you like

# I don't see why would I need one of those barbaric regexp things

def grep(filename, phrase)
  File.open(filename) do |f|
    f.each { |line| puts "#{f.lineno}: #{line}" if line[phrase] }
  end
end

grep('foo.txt', 'out')

