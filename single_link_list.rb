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
			current = @head
			while(current.next_node)
				current = current.next_node
			end
			current.next_node = node
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
		current = @head
		while (current)
			puts current.value
			current = current.next_node
		end
	end

	def reverse
		current = @head
		next_node = @head.next_node
		current.next_node = nil
		rest = nil
		while (next_node)
			rest = next_node.next_node
			next_node.next_node = current
			current = next_node
			next_node = rest
		end
		@head = current
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
