def interactive_menu
  students = []
  loop do
    # 1. Print the menu and ask the user what to do
    puts "1. Input the students"
    puts "2. Show the students"
    puts "9. Exit" # 9 because we'll be adding more items
    
    # 2. Read the input and save it into a variable
    selection = gets.chomp
    
    # 3. Do what the user has asked
    case selection
      when "1"
        students = input_students
      when "2"
        print_header
        print_cohort(students)
        print_footer(students)
      when "9"
        exit # this will cause the program to terminate
      else
        puts "I don't know what you meant, try again"
    end
  end
end

def print_header
  puts "The students at Makers Academy"
  puts "-------------"
end
def print(students)
  counter = 0
  while students.length > counter
    puts "#{counter + 1}.".center(4) + "#{students[counter][:name]}".center(10) + "#{students[counter][:cohort]} cohort ".center(20) + "height: #{students[counter][:height]}cm ".center(20) + "birth country: #{students[counter][:cob]}".center(25)
    counter += 1
  end
end

def print_cohort(students)
  existing_cohorts = [:January, :February, :March, :April, :May, :June, :July, :August, :September, :October, :November, :December, :"Not specified"]
  existing_cohorts.each do |cohort| 
    students.each { |student| puts "#{student[:name]}".center(10) + "#{student[:cohort]} cohort".center(20) + "height: #{student[:height]}cm".center(20) + "birth country: #{student[:cob]}".center(14) if student[:cohort] == cohort }
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great student#{'s' if students.size > 1}"
end

def input_students

  students = []

  loop do
    name = get_name
    break if name.empty?
    
    if name == 'edit'
      edit_input(students)
    else
      students << {name: name, cohort: get_cohort, height: get_height, cob: get_country_of_birth}
    end

    puts "Now we have #{students.size} student#{'s' if students.size > 1}"
    print(students)

  end
  students
end
  


def edit_input(students)
  puts "Enter the number of the student you would like to edit"
  number = gets.chomp.to_i
  puts "Would you like to update the name (type: 'name'), cohort (type: 'cohort'), height (type: 'height') or country of birth (type 'cob')?"
  update = gets.chomp
  puts "You have entered '#{students[number - 1][update.to_sym]}'. What would you like to change this to?"
  students[number - 1][update.to_sym] = gets.chomp
end

def get_name
  puts "Please enter the names of the students"
  puts "to edit any of your entries type 'edit' and to finish, just hit return twice"
  name = gets.delete "\n"
end

def get_cohort
  existing_cohorts = [:January, :February, :March, :April, :May, :June, :July, :August, :September, :October, :November, :December, :"Not specified"]
  while true
    puts "Cohort: "
    cohort_entered = gets.delete "\n"
    cohort_entered = cohort_entered.empty? ? 'Not specified'.to_sym : cohort_entered.to_sym
    cohort_verified = existing_cohorts.select { |cohort| cohort == cohort_entered}.join.to_sym
    break if !cohort_verified.empty?
  end
  cohort_verified
end

def get_height
  while true
    puts "Height (cm): "
    height = gets.delete("\n").to_i
    break if height > 0
  end
  height
end

def get_country_of_birth
  while true
    puts "Country of birth: "
    cob = gets.delete "\n"
    break if !cob.empty?
  end
  cob
end

interactive_menu
