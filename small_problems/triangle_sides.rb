=begin
Write a method that takes the lengths of the 3 sides of a triangle as arguments,
and returns a symbol :equilateral, :isosceles, :scalene, or :invalid depending on
whether the triangle is equilateral, isosceles, scalene, or invalid.
=end

def possible?(a, b, c)
  sides = [a, b, c].sort!
  (sides[0] + sides[1] > sides[2]) && (!sides.include?(0))
end

def equilateral?(a, b, c)
  true if (a == b) && (a == c)
end

def isosceles?(a, b, c)
  true if a == b || a == c || c == b
end

def triangle(a, b, c)
  return :invalid if !possible?(a, b, c)
  return :equilateral if equilateral?(a, b, c)
  return :isosceles if isosceles?(a, b, c)
  return :scalene
end

p triangle(3, 3, 3) == :equilateral
p triangle(3, 3, 1.5) == :isosceles
p triangle(3, 4, 5) == :scalene
p triangle(0, 3, 3) == :invalid
p triangle(3, 1, 1) == :invalid