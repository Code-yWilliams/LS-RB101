=begin
Write a method that displays a 4-pointed diamond in an n x n grid,
where n is an odd integer that is supplied as an argument to the method.
You may assume that the argument will always be an odd integer.

Further Exploration:
Try modifying your solution or our solution so it prints only the outline of the diamond:
=end

def get_row_lengths(diamond_width)
  asterisks = []
  1.step(diamond_width, 2) {|step| asterisks << step}
  first_set = asterisks[0..-2].reverse
  asterisks + first_set
end


def diamonds(diamond_width)
  diamond = []
  get_row_lengths(diamond_width).each do |row|
    diamond << ("*" * row).center(diamond_width, " ")
  end
  puts diamond
end




# Further Exploration

def diamonds(diamond_width, outline=false)
  diamond = []
  if outline == true
    get_row_lengths(diamond_width).each do |row|
      diamond << ("*" * row).center(diamond_width, " ")
    end
    stripped_rows = diamond.map { |row| row.strip.split("") }
    stripped_rows.each do |sub_arr|
      if sub_arr.size > 1
        sub_arr[1..-2] = [" "] * (sub_arr.size - 2)
      end
    end
    outline_rows = stripped_rows.map {|sub_arr| sub_arr.join("").center(diamond_width, " ")}
    puts outline_rows
  else
    get_row_lengths(diamond_width).each do |row|
      diamond << ("*" * row).center(diamond_width, " ")
    end
    puts diamond
  end
end


diamonds(55, true)






