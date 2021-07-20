=begin
Write a method that determines the mean (average) of the three scores passed to it,
and returns the letter value associated with that grade.

Numerical Score Letter	Grade
90 <= score <= 100	'A'
80 <= score < 90	'B'
70 <= score < 80	'C'
60 <= score < 70	'D'
0 <= score < 60	'F'
Tested values are all between 0 and 100. There is no need to check for negative values
or values greater than 100.

How would you handle this if there was a possibility of extra credit grades causing it to exceed 100 points?
=end

Grades = {
  "A" => (90..100),
  "B" => (80..89),
  "C" => (70..89),
  "D" => (60..69),
  "F" => (0..59)
}

def get_grade(score_1, score_2, score_3)
  average = ((score_1 + score_2 + score_3) / 3).ceil
  key = Grades.select do |key, value|
    value.include?(average)
  end
  key.keys[0]
end

p get_grade(95, 90, 93) == "A"
p get_grade(50, 50, 95) == "D"


# Further Exploration
def get_grade(s1, s2, s3)
  result = (s1 + s2 + s3)/3

  case 
  when result >= 100 then 'A+'
  when (90..99).include?(result) then "A"
  when (80..89).include?(result) then 'B'
  when (70..79).include?(result) then 'C'
  when (60..69).include?(result)  then 'D'
  else              'F'
  end
end

