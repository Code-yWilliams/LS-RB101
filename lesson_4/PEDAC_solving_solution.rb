

=begin

Problem:
Imagine a sequence of consecutive even integers beginning with 2.
The integers are grouped in rows, with the first row containing one integer,
the second row containing two integers, the third row containing three integers,
and so on. Given an integer representing the number of a particular row,
return an integer representing the sum of all the integers in that row.

Overall Algorithm:
1. Create an empty ‘rows’ array to contain all of the rows
2. Create the first row array and add it to the overall rows array
3. Repeat step 2 until all of the necessary rows have been created
	3A. All rows have been created when the length of the rows array is equal to the input integer
4. Sum the final row
5. Return the sum
____________________________________

Examples (sum_even_number_row)
row 1 --> sum of integers in row: 2
row 2 --> sum of integers in row: 10
row 3 --> sum of integers in row: 30
row 4 --> sum of integers in row: 68

Tests (sum_even_number_row):
p sum_even_number_row(1) == 2
p sum_even_number_row(2) == 10
p sum_even_number_row(4) == 68
=end

def sum_even_number_row(row_number)
  rows = []
  start_integer = 2
  #steps 2 & 3:
  (1..row_number).each do |current_row_number|
    rows << create_row(start_integer, current_row_number)
    start_integer = rows[-1][-1] + 2
  end

  rows[-1].sum # ToDo: sum the final row and return the sum
end


=begin
____________________________________
Sub-Problem: Create Row

Algorithm:
1. Create an empty array to contain the row integers
2. Add the starting integer
3. Increment the starting integer by 2 to get the next integer in the sequence
4. Repeat steps 2 and 3 until the array has reached the correct length
5. Return the array

Examples: (create_row)
start: 2,  length: 1 —> [2] 
start: 4,  length: 2 —> [4, 6]
start: 8,  length: 3 —> [8, 10, 12]
start: 14, length: 4 —> [14, 16, 18, 20]
start: 22, length: 5 —> [22, 24, 26, 28, 30]
calculating the start integer:
  RULE:first integer of row == (last integer of previous row) + 2
  1. get the last element of the rows array
  2. get the last integer of that row
  3. add 2 to the integer

Tests (create_row)
p create_row(2, 1) == [2]
p create_row(4, 2) == [4, 6]
p create_row(8, 3) == [8, 10, 12]

Code:
1. start the loop
2. add the start integer to the row
3. increment the start integer by 2
4. break out of the loop if length of row == row_length

=end

def create_row(start_integer, row_length)
  row = []
  current_integer = start_integer
  loop do
    row << current_integer
    current_integer += 2
    break if row.length == row_length
  end
  row
end
=begin 
Ran tests after creating this method

p create_row(2, 1) == [2]
p create_row(4, 2) == [4, 6]
p create_row(8, 3) == [8, 10, 12]
=end

p sum_even_number_row(1) == 2
p sum_even_number_row(2) == 10
p sum_even_number_row(4) == 68


=begin
Notes:
PEDAC is not linear - you will have to move back and forth / revisit steps as you move through the process
Switch from implementation mode to abstract problem solving mode when necessary
Don't try to problem solve at the code level
=end