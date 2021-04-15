def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  # get the first name
  name = gets.chomp
  # while name is not empty, repeat this code
  while !name.empty? do
    # add student hash to array
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"
    name = gets.chomp
  end
  # return the array of students
  return students
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)
  no_of_students = students.length
  counter = 1
  while counter <= no_of_students
    puts "#{counter}. #{students[counter-1][:name]} (#{students[counter-1][:cohort]} cohort)"
    counter +=1
  end
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end

students = input_students
print_header
print(students)
print_footer(students)