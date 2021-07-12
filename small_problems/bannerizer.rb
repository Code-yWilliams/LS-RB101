=begin
Write a method that will take a short line of text, and print it within a box.

Example:

print_in_box('To boldly go where no one has gone before.')
+--------------------------------------------+
|                                            |
| To boldly go where no one has gone before. |
|                                            |
+--------------------------------------------+

You may assume that the input will always fit in your terminal window.
=end

def print_in_box(string)
  if string.length > 76
    puts "String is too long and will be shortened."
    string.chop! until string.length <= 76
  end
  box_width = string.length + 2
  puts "+#{"".center(box_width, "-")}+"
  puts "|#{"".center(box_width, " ")}|"
  puts "|#{string.center(box_width, " ")}|"
  puts "|#{"".center(box_width, " ")}|"
  puts "+#{"".center(box_width, "-")}+"
end

print_in_box("What you want bitch?")
print_in_box("Hi")
print_in_box("Hi there. My name is Cody Williams and I am here to invite you to a party that I will be hosting at my house next Monday.")
