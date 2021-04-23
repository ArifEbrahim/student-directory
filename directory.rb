require 'csv'

@students = []

def print_menu
  puts "1. input the students"
  puts "2. show the students"
  puts "3. save the list to students.csv"
  puts "4. load the list from students.csv"
  puts "9. exit"
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def process(selection)
  case selection
  when "1"
    puts "you picked input students"
    input_students
  when "2"
    puts "you picked show students"
    show_students
  when "3"
    puts "you picked save the list to CSV"
    save_students(get_filename)
  when "4"
    puts "you picked load the list from CSV"
    load_students(get_filename)
  when "9"
    puts "you picked exit"
    exit
  else
    puts "i don't know what you mean"
  end
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  name = STDIN.gets.chomp
  while !name.empty? do
    @students << {name: name, cohort: :november}
    puts "Now we have #{@students.count} students"
    name = STDIN.gets.chomp
  end
end

def show_students
  print_header
  print_student_list
  print_footer
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_student_list
  @students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer
  puts "Overall, we have #{@students.count} great students"
end

def save_students(filename = "students.csv")
  CSV.open(filename,"w") do |csv|
    @students.each do |student|
      csv << [student[:name], student[:cohort]]
    end
  end
end

def load_students(filename = "students.csv")
  CSV.foreach(filename) do |line|
    name = line[0]
    cohort = line[1]
    @students << {name: name, cohort: cohort.to_sym}
  end
  puts "Loaded #{@students.count} from #{filename}"
end

def try_load_students
  filename = ARGV.first
  if filename.nil?
    puts "Loading students.csv by default since no other file given"
    load_students
  elsif File.exists?(filename)
    load_students(filename)
  else
    puts "Sorry, #{filename} doesn't exist"
    exit
  end
end

def get_filename
  puts "Enter file name ending in .csv"
  filename = gets.chomp
  return filename
end

try_load_students
interactive_menu
