=begin
Write a method that takes the 3 angles of a triangle as arguments,
and returns a symbol :right, :acute, :obtuse, or :invalid depending
on whether the triangle is a right, acute, obtuse, or invalid triangle.

You may assume integer valued angles so you don't have to worry about
floating point errors. You may also assume that the arguments are specified
in degrees.
=end

def valid?(a, b, c)
  return false if [a, b, c].include?(0)
  return false if a + b + c != 180
  return true
end

def right?(a, b, c)
  [a, b, c].include?(90)
end

def acute?(a, b, c)
  [a, b, c].all? { |angle| angle < 90}
end

def obtuse?(a, b, c)
  !acute?(a, b, c)
end

def triangle(a, b, c)
  return :invalid if !valid?(a, b, c)
  return :right if right?(a, b, c)
  return :acute if acute?(a, b, c)
  return :obtuse if obtuse?(a, b, c)
end

p triangle(60, 70, 50) == :acute
p triangle(30, 90, 60) == :right
p triangle(120, 50, 10) == :obtuse
p triangle(0, 90, 90) == :invalid
p triangle(50, 50, 50) == :invalid