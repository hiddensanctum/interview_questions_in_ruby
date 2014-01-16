class Node
	attr_accessor :value, :next_node

	def initialize (value = nil, next_node = nil)
		@value, @next_node = value, next_node
	end
end

class List
	@head
	@length
	@tail

	def initialize (head = nil, length = 0)
		@head, @length = head, length
	end

	def add(node)
		if @head
			@tail.next_node = node
			@tail = node
		else
			@head = node
			@tail = node
		end
		@length += 1
	end

	def add_without_tail(node)
		if @head
			x = @head
			while(x.next_node)
				x = x.next_node
			end
			x.next_node = node
		else
			@head = node
		end
		@length += 1
	end

	def insert(node_after, node)
		temp = node_after.next_node
		node_after.next_node = node
		node.next_node = temp
		@length += 1
	end

	def traverse_recur(node = @head)
		puts node.value
		traverse_recur(node.next_node) if node.next_node
	end

	def traverse
		temp = @head
		count = 0
		while (count < @length)
			puts temp.value
			count += 1
			temp = temp.next_node
		end
	end

	def reverse
		x = @head
		y = @head.next_node
		x.next_node = nil
		z = nil
		while (y)
			z = y.next_node
			y.next_node = x
			x = y
			y = z
		end
		@head = x
	end
end

list = List.new
two = Node.new(2)
list.add(Node.new(1))
list.add(two)
list.add(Node.new(3))
list.add(Node.new(4))
list.add_without_tail(Node.new(5))
list.traverse
puts "---Traverse Link List Recursively---"
list.traverse_recur
puts "---Insert Node into Link List"
list.insert(two, Node.new(2.5))
list.traverse_recur
puts "---Reverse Link List---"
list.reverse
list.traverse
puts "---Traverse Link List Recursively---"
list.traverse_recur
