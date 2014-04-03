def bubble_sort(array, n)
  i = 0
  while i < n
    j = 1
    while j < (n-i)
      if array[j-1] > array[j]
        swap = array[j-1]
        array[j-1] = array[j]
        array[j] = swap
      end
      j += 1
    end
    i += 1
  end
end

array = [2,3,1,9,11,34,23,78,45,55,0]
bubble_sort(array, array.length)
puts "sorted array: " + array.to_s
