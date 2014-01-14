class Tree
	@value
	@left
	@right

	def initialize (value = nil, left = NullTree.new, right = NullTree.new)
		@value, @left, @right = value, left, right
	end

	def preOrder
		puts @value
		[@left, @right].each { |tree| tree.preOrder }
	end

	def inOrder
		@left.inOrder
		puts @value
		@right.inOrder
	end

	def postOrder
		[@left, @right].each { |tree| tree.preOrder }
		puts @value
	end
end

class NullTree
	def preOrder; end
	def inOrder; end
	def postOrder; end
end

Binary = Tree.new(1, Tree.new(2), Tree.new(3, Tree.new(4), Tree.new(5)))
puts "---Pre-Order---"
Binary.preOrder
puts "---in-Order---"
Binary.inOrder
puts "---post-Order---"
Binary.postOrder
