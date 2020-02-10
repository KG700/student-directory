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
  puts "to edit any of your entries type 'edit'"
  puts "to finish, just hit return twice"
  #create an empty array
  students = []
  #get the first name
  name = gets.chomp
  puts "What cohort are they in?"
  cohort = gets.chomp
  cohort = 'Feb' if cohort.empty?
  
  #while the name is not empty, repeat this code
  while !name.empty? do
    #add the student hash to the array
    students << {name: name, cohort: cohort.to_sym, hobbies: "", country_of_birth: "", height: ""} if name != 'edit' && cohort != 'edit'
    puts "Now we have #{students.count} students"
    print(students)
    puts "Please enter the names of the students"
    puts "to edit any of your entries type 'edit' and to finish, just hit return twice"
    name = gets.chomp
    if name == 'edit'
      edit_input(students) 
    elsif !name.empty?
      puts "What cohort are they in?"
      cohort = gets.chomp
      edit_input(students) if cohort == 'edit'
      cohort = 'Feb' if cohort.empty?
    end
  end
  students
end

def input_instructions
end

def edit_input(students)
  puts "Enter the number of the student you would like to edit"
  number = gets.chomp.to_i
  puts "Would you like to update the 'name' or the 'cohort'?"
  update = gets.chomp
  puts "You have entered '#{students[number - 1][update.to_sym]}'. What would you like to change this to?"
  students[number - 1][update.to_sym] = gets.chomp
end
  
#nothing happens until we've called the methods
students = input_students
print_header
print(students)
print_footer(students)
