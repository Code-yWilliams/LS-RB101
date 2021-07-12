def row_sum(row)
  numbers = []
  counter = 1
  
  until numbers[-1] == row * (row + 1)
    numbers << (2 * counter)
    counter += 1
  end


  numbers = numbers.reject {|element| element < numbers[-row]}
  numbers.sum
end

p row_sum(5)
  

