students = [
  {name: "Dr. Hannibal Lecter", cohort: :november},
    {name: "Darth Vader", cohort: :november},
    {name: "Nurse Ratched", cohort: :november},
    {name: "Michael Corleone", cohort: :november},
    {name: "Alex DeLarge", cohort: :november},
    {name: "The Wicked Witch of the West", cohort: :november},
    {name: "Terminator", cohort: :november},
    {name: "Freddy Krueger", cohort: :november},
    {name: "The Joker", cohort: :november},
    {name: "Joffrey Baratheon", cohort: :november},
    {name: "Norman Bates", cohort: :november}
]

@students = []

def add_student(name)
  @students << {name: name, cohort: :november}
end


def input_students
  puts "Please enter the names of the students"
  puts "To finish, hit return twice"

name = STDIN.gets.chomp

while !name.empty? do
  add_student(name)
    if @students.count == 1
      puts "Now we have #{@students.count} student"
    else
      puts "Now we have #{@students.count} students"
    end
  name = STDIN.gets.chomp
  end
end


def print_header
  puts "The students of my cohort at Makers Academy"
  puts "-------------"
end

def print_students_list
  @students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to file "
  puts "4. Load the list from file "
  puts "9. Exit" # 9 because we'll be adding more items
end

def show_students
  print_header
  print_students_list
  print_footer
end

def process(selection)
  case selection
    when "1"
      input_students
    when "2"
      show_students
    when "9"
      exit
    when "3"
      save_students
    when "4"
      puts "Please enter the name of the file"
      puts "or leave empty to load students.csv"
      load_filename= gets.chomp
      load_filename.empty? ? load_students : load_students(load_filename)
    else
      puts "I don't know what you mean, try again"
  end
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def save_students
  puts "Please enter the filename"
  filename = gets.chomp
  # open the file for writing
  file = File.open(filename, "w") do |file|
  # iterate over the array of students
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
 end
  puts "**File saved successfully**"
end

def load_students
  file = File.open("students.csv", "r") do |file|
  file.readlines.each do |line|
  name, cohort = line.chomp.split(',')
    add_student(name)
  end
  end
  puts "**File loaded successfully**"
end

def try_load_students
  filename = ARGV.first# first argument from the command line
  if filename.nil?
    puts "Loaded the default file: students.csv"
    load_students
  elsif File.exists?(filename)
    load_students(filename)
     puts "Loaded #{@students.count} from #{filename}"
  else # if it doesn't exist
    puts "Sorry, #{filename} doesn't exist."
    exit # quit the program
  end
end

try_load_students
interactive_menu
