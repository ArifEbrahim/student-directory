def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  # get the first name
  name = gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
    puts "enter student cohort"
    cohort = gets.chomp
    students << {name: name, cohort: cohort}
    puts "Now we have #{students.count} students"
    # get another name from the user
    name = gets.chomp
  end
  # return the array of students
  students
end

def print_header
  puts "The students of my cohort at Makers Academy"
  puts "-------------"
end

def print(students)
  student_info = {}
  students.each do |student|
    unless student_info.include?(student[:cohort])
      student_info[student[:cohort]] = []
    end
    student_info[student[:cohort]].push(student[:name])
  end
  student_info.each do |key,value|
    puts "The following are in the #{key} cohort:"
    puts value
  end
end

def print_footer(students) 
  puts "Overall, we have #{students.count} great students"
end


students = input_students
print_header
print(students)
print_footer(students)