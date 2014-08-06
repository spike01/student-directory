@students = []
name = ""

def interactive_menu
	loop do
		# First, print a menu and get the user's input
		print_menu
		menu_input(STDIN.gets.chomp)
	end
end

def print_menu
		puts "1. Input students"
		puts "2. Show students"
		puts "3. Save students"
		puts "4. Load students"
		puts "9. Exit"
end

def menu_input(selection)
	case selection
	when "1" then input_students
	when "2" then show_students
	when "3" then save_students
	when "4" then load_students
	when "9" then exit 
	else puts "I don't know what you meant, try again."
	end
end

def show_students
	print_header
	print_students_list
	print_footer
end

def student_add(name, cohort, hobby)
	@students << {:name => name, :cohort => cohort.to_sym, :hobby => hobby}
end

def get_input
	STDIN.gets.chomp
end

def input_students
	puts "Please enter the names, cohort and hobby of the students"
	puts "To finish, just hit return thrice"
	# get the first name
	name = get_input
	cohort = get_input
	cohort = :august if cohort.empty?
	hobby = get_input
	# while the name is not empty, repeat this code
	while !name.empty? do
	# add the student hash to the array
	student_add(name, cohort, hobby)
	puts "Now we have #{@students.length} student" if @students.length == 1
	puts "Now we have #{@students.length} students" if @students.length >= 2
	# get another name from the user
	name = get_input
	cohort = get_input
	cohort = :august if cohort.empty?
	hobby = get_input
	end
end

def print_header
	puts "The students of the August cohort at Makers Academy:"
end

def print_students_list
	@students.each_with_index { |student, index| puts "#{index+1} #{student[:name]} (#{student[:cohort]} cohort) #{student[:hobby]}"}
end

def print_footer
	puts "Overall, we have #{@students.length} great students"
end

def save_students
	# open the file for writing
	file = File.open("students.csv", "w")
	#iterate over students
	@students.each do |student|
		student_data = [student[:name], student[:cohort], student[:hobby]]
		csv_line = student_data.join(",")
		file.puts csv_line
	end
	puts "Students saved!"
	file.close
end

def load_students(filename = 'students.csv')
	file = File.open(filename, "r")
	file.readlines.each do |line|
		name, cohort, hobby = line.chomp.split(',')
		student_add(name, cohort, hobby)
		end
	file.close
	puts "Students loaded from file!"
end

def try_load_students
	filename = ARGV.first #1st argument from cmd line
	return if filename.nil? #get out if no filename
	if File.exists?(filename) #if it exists
		load_students(filename)
		puts "Loaded #{@students.length} from #{filename}"
	else #if it doesn't exist
		puts "Sorry #{filename} doesn't exist."
		exit
	end
end

try_load_students
interactive_menu

def print_by_cohort
	@students.sort[:cohort]
	puts "Here are the students by cohort:"
	@students.each { |student| puts "#{student[:name]}, #{student[:cohort]}" }
end

