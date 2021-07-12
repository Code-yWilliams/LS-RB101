=begin
Write a method that takes a positive integer, n, as an argument,
and displays a right triangle whose sides each have n stars.
The hypotenuse of the triangle (the diagonal side in the images below)
should have one end at the lower-left of the triangle,
and the other end at the upper-right.

Further Exploration:
Try modifying your solution so it prints the triangle upside
down from its current orientation.
Try modifying your solution again so that you can display the
triangle with the right angle at any corner of the grid.
=end

def triangle(length)
  count = 1
  padding = (length - 1)
  until count > length
    puts (" " * padding) + ("*" * count)
    count += 1
    padding -= 1
  end
end

triangle(5)
triangle(9)

# Further Exploration
# Try modifying your solution so it prints the triangle upside down
# from its current orientation.

def triangleb(length)
  count = length
  padding = 0
  until count == 0
    puts (" " * padding) + ("*" * count)
    count -= 1
    padding += 1
  end
end

triangleb(5)
triangleb(9)

# Try modifying your solution again so that you can display
# the triangle with the right angle at any corner of the grid.

def trianglec(length, quadrant)
  case quadrant
  when 1
    count = length
    until count == 0
      puts ("*" * count)
      count -= 1
    end
  when 2
    count = length
    padding = 0
    until count == 0
      puts (" " * padding) + ("*" * count)
      count -= 1
      padding += 1
    end
  when 3
    count = 1
    padding = (length - 1)
    until count > length
      puts (" " * padding) + ("*" * count)
      count += 1
      padding -= 1
    end
  when 4
    count = 1
    until count > length
      puts ("*" * count)
      count += 1
    end
  end
end

trianglec(10, 1)
trianglec(10, 2)
trianglec(10, 3)
trianglec(10, 4)

