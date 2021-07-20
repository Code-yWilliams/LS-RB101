=begin
Write a method that takes an integer argument, and returns an Array of all integers,
in sequence, between 1 and the argument.

You may assume that the argument will always be a valid integer that is greater than 0.

Further Exploration:
Food for thought: what do you think sequence should return if the argument is not greater than 0.
  For instance, what should you do if the argument is -1? Can you alter your method to handle this case?
=end

def sequence(int)
  result = []
  if int.positive?
    1.upto(int) do |num|
      result << num
    end
  elsif int.negative?
    int.upto(-1) do |num|
      result << num
    end
  else
    result << 0
  end
  result
end

p sequence(5) == [1, 2, 3, 4, 5]
p sequence(3) == [1, 2, 3]
p sequence(1) == [1]
p sequence(-8)

# OR
def sequence(number)
  (1..number).to_a
end