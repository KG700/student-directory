def print_header
  puts "The students at Makers Academy"
  puts "-------------"
end
def print(students)
  counter = 0
  while students.length > counter
    puts "#{counter + 1}. #{students[counter][:name]} (#{students[counter][:cohort]} cohort)".center(36)
    counter += 1
  end
end

def print_cohort(students)
  existing_cohorts = [:January, :February, :March, :April, :May, :June, :July, :August, :September, :October, :November, :December, :"Not specified"]
  existing_cohorts.each do |cohort| 
    students.each { |student| puts "#{student[:name]} (#{student[:cohort]} cohort)" if student[:cohort] == cohort }
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great student#{'s' if students.size > 1}"
end

def input_students
  puts "Please enter the names of the students"
  puts "to edit any of your entries type 'edit' and to finish, just hit return twice"

  students = []
  #get the first name & cohort
  name = gets.chomp
  cohort = get_cohort
  
  #while the name is not empty, repeat this code
  while !name.empty? do
    #add the student hash to the array
    students << {name: name, cohort: cohort} if name != 'edit'
    puts "Now we have #{students.count} students"
    print(students)
    puts "Please enter the names of the students (or type 'edit' or hit return twice to finish)"
    name = gets.chomp
    if name == 'edit'
      edit_input(students)
    elsif !name.empty?
      cohort = get_cohort      
    end
  end
  students
end

def edit_input(students)
  puts "Enter the number of the student you would like to edit"
  number = gets.chomp.to_i
  puts "Would you like to update the 'name' or the 'cohort'?"
  update = gets.chomp
  puts "You have entered '#{students[number - 1][update.to_sym]}'. What would you like to change this to?"
  students[number - 1][update.to_sym] = gets.chomp
end

def get_name
end

def get_cohort
  existing_cohorts = [:January, :February, :March, :April, :May, :June, :July, :August, :September, :October, :November, :December, :"Not specified"]
  while true
    puts "Cohort: "
    cohort_entered = gets.chomp
    cohort_entered = cohort_entered.empty? ? 'Not specified'.to_sym : cohort_entered.to_sym
    cohort_verified = existing_cohorts.select { |cohort| cohort == cohort_entered}.join.to_sym
    break if !cohort_verified.empty?
  end
  cohort_verified
end

def get_height
end

def get country_of_birth
end

#nothing happens until we've called the methods
students = input_students
print_header
#print(students)
print_cohort(students)
print_footer(students)
