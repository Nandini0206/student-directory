
# let's put all students into an array
students = [
  {name: "Dr. Hannibal Lecter", cohort: :november, sport: :swimming, :country :lithuania},
    {name: "Darth Vader", cohort: :november, sport: :football :country :america},
    {name: "Nurse Ratched", cohort: :november, sport: :tennis, :country :america},
    {name: "Michael Corleone", cohort: :november, sport: :football, :country :italy},
    {name: "Alex DeLarge", cohort: :november, sport: :hockey, :country :england},
    {name: "The Wicked Witch of the West", cohort: :november, sport: :basketball, :country :america},
    {name: "Terminator", cohort: :november, sport: :badminton, :country :america},
    {name: "Freddy Krueger", cohort: :november, sport: :rugby, :country :america},
    {name: "The Joker", cohort: :november, sport: :rugby, :country :america},
    {name: "Joffrey Baratheon", cohort: :november, sport: :swimming, :country :westeros},
    {name: "Norman Bates", cohort: :november, sport: :tennis, :country :america}
]

def input_students
  puts "Please enter the names of the students"
  puts "To finish, hit return twice"

students = []
name = gets.chomp

  while !name.empty? do
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"
    name = gets.chomp
  end

students
end

def print_header
  puts "The students of my cohort at Makers Academy"
  puts "-------------"
end

def print(students)
  students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end

students = input_students
print_header
print(students)
print_footer(students)
