def print_header
  puts "The students of my cohort at Makers Academy"
  puts "-------------"
end
def print(students)
  counter = 0
  while students.length > counter
    puts "#{counter + 1}. #{students[counter][:name]} (#{students[counter][:cohort]} cohort)".center(36)
    counter += 1
  end
end
def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end

def input_students
  puts "Please enter the names of the students"
  puts "to finish, just hit return twice"
  #create an empty array
  students = []
  #get the first name
  name = gets.chomp
  #while the name is not empty, repeat this code
  while !name.empty? do
    #add the student hash to the array
    students << {name: name, cohort: :november, hobbies: "", country_of_birth: "", height: ""}
    puts "Now we have #{students.count} students"
    name = gets.chomp
  end
  students
end
  
#nothing happens until we've called the methods
students = input_students
print_header
print(students)
print_footer(students)
