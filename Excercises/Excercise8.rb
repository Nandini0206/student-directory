# let's put all students into an array

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

def input_students
  puts "Please enter the names of the student"
  puts "To finish, hit return twice"

  students = []
  name = gets.chomp

  puts "Please enter the cohort of the student"
  cohort = gets.chomp

  while !name.empty? || !cohort.empty? do
    students << {name: name, cohort: cohort}
    puts "Now we have #{students.count} students"
    name = gets.chomp
    cohort = gets.chomp
  end
    students
end

def print_header
  puts "The students of my cohort at Makers Academy"
  puts "-------------"
end

def print(students)
 students.each do |student|
    puts "#{student[:name].empty? ? "unkown" : student[:name]} (#{student[:cohort].empty? ? "unkown" : student[:cohort]} cohort)"
  end
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end

def print_by_cohort(students)
  if students.empty?
    puts "No students available"
  else
    cohorts = students.map do |student|
      student[:cohort]
    end
    cohorts.uniq.each do |cohort|
      puts "#{cohort} cohort".upcase
      students.each do |student|
        puts student[:name] if student[:cohort] == cohort
      end
    end
  end
end

students = input_students
print_header
print_by_cohort(students)
print_footer(students)
