def interactive_menu
  @students = [] #an empty array accessible to all methods
  try_load_students
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit" # 9 because we'll be adding more items
end

def process(selection)
    case selection
      when "1"
        input_students
      when "2"
        show_students
      when "3"
        save_students
      when "4"
        load_students
      when "9"
        exit # this will cause the program to terminate
      else
        puts "I don't know what you meant, try again"
    end
  end

def show_students
  print_header
  print_students_list_by_cohort
  print_footer
end

def print_header
  puts "The students at Makers Academy"
  puts "-------------"
end
def print_students_list
  counter = 0
  while @students.length > counter
    puts "#{counter + 1}.".center(4) + "#{@students[counter][:name]}".center(10) + "#{@students[counter][:cohort]} cohort ".center(20) + "height: #{@students[counter][:height]}cm ".center(20) + "birth country: #{@students[counter][:cob]}".center(25)
    counter += 1
  end
end

def print_students_list_by_cohort
  existing_cohorts = [:January, :February, :March, :April, :May, :June, :July, :August, :September, :October, :November, :December, :"Not specified"]
  existing_cohorts.each do |cohort| 
    @students.each { |student| puts "#{student[:name]}".center(10) + "#{student[:cohort]} cohort".center(20) + "height: #{student[:height]}cm".center(20) + "birth country: #{student[:cob]}".center(14) if student[:cohort] == cohort }
  end
end

def print_footer
  puts "Overall, we have #{@students.count} great student#{'s' if @students.size > 1}"
end

def input_students

  loop do
    name = get_name
    break if name.empty?
    
    if name == 'edit'
      edit_input
    else
      @students << {name: name, cohort: get_cohort, height: get_height, cob: get_country_of_birth}
    end

    puts "Now we have #{@students.size} student#{'s' if @students.size > 1}"
    print_students_list

  end
end
  


def edit_input
  puts "Enter the number of the student you would like to edit"
  number = STDIN.gets.chomp.to_i
  puts "Would you like to update the name (type: 'name'), cohort (type: 'cohort'), height (type: 'height') or country of birth (type 'cob')?"
  update = STDIN.gets.chomp
  puts "You have entered '#{@students[number - 1][update.to_sym]}'. What would you like to change this to?"
  @students[number - 1][update.to_sym] = STDIN.gets.chomp
end

def get_name
  puts "Please enter the names of the students"
  puts "to edit any of your entries type 'edit' and to finish, just hit return twice"
  name = STDIN.gets.delete "\n"
end

def get_cohort
  existing_cohorts = [:January, :February, :March, :April, :May, :June, :July, :August, :September, :October, :November, :December, :"Not specified"]
  while true
    puts "Cohort: "
    cohort_entered = STDIN.gets.delete "\n"
    cohort_entered = cohort_entered.empty? ? 'Not specified'.to_sym : cohort_entered.to_sym
    cohort_verified = existing_cohorts.select { |cohort| cohort == cohort_entered}.join.to_sym
    break if !cohort_verified.empty?
  end
  cohort_verified
end

def get_height
  while true
    puts "Height (cm): "
    height = STDIN.gets.delete("\n").to_i
    break if height > 0
  end
  height
end

def get_country_of_birth
  while true
    puts "Country of birth: "
    cob = STDIN.gets.delete "\n"
    break if !cob.empty?
  end
  cob
end

def save_students
  # open the file for writing
  file = File.open("students.csv", "w")
  # iterate over the array of students
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

def load_students( filename = "students.csv" )
  file = File.open(filename, "r")
  file.readlines.each do |line|
    name, cohort = line.chomp.split(',')
    @students << {name: name, cohort: cohort.to_sym, height: 0, cob: "NA"}
  end
  file.close
end

def try_load_students
  filename = ARGV.first #first argument from the command line
  return if filename.nil? # get out of the method if it isn't given
  if File.exists? (filename)
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else # if it doesn't exist
    puts "Sorry, #{filename} doesn't exist"
    exit # quit the program"
  end
end

interactive_menu
