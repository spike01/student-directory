require "csv"

class Students
	def initialize(name, cohort, hobby)
		@name 	= name
		@cohort = cohort
		@hobby 	= hobby
	end
end

@students = []

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
	when "3" then load_save("save")
	when "4" then load_save("load") 
	when "9" then exit 
	else puts "I don't know what you meant, try again."
	end
end

def student_add(name, cohort, hobby)
	@students << { name: name, cohort: cohort.to_sym, hobby: hobby }
end

def get_input
	STDIN.gets.chomp
end

def info_collect
	@name 	= get_input
	return if @name.empty?
	@cohort = get_input
	@cohort = "August" if @cohort.empty?
	@hobby 	= get_input
end

def plural
  "s" if @students.length > 1
end

def input_students
	puts "Please enter the names, cohort and hobby of the students"
	puts "To finish, just hit return thrice"
	# get the first name
	info_collect
	until @name.empty? 
		student_add(@name, @cohort, @hobby)
		puts "Now we have #{@students.length} student#{plural}"
		info_collect
	end
end

def show_students
	puts "The students of the August cohort at Makers Academy:"
	@students.each_with_index { |student, index| puts "#{index+1}: #{student[:name]} (#{student[:cohort]} cohort) #{student[:hobby]}" }
	puts "Overall, we have #{@students.length} great student#{plural}"	 
end

def save_students(filename = 'students.csv')
	CSV.open(filename, "w") do |csvpush|
		@students.each { |student| csvpush << student.values }
		end	 
	puts "Students saved!"
  
end

def load_save(choice)
  print "Where would you like to "  
  puts choice == "save" ? "save to?" : "load from?"
  filename = gets.chomp
  choice == "save" ? save_students(filename) : load_students(filename)            
end

def load_students(filename = 'students.csv')
	CSV.foreach(filename, "r") { |row| student_add(row[0], row[1], row[2]) }
	puts "Students loaded from file!"
end

def try_load_students
	filename = ARGV.first # 1st argument from cmd line
	return if filename.nil? # get out if no filename
	if File.exists?(filename) # if it exists
		load_students(filename)
		puts "Loaded #{@students.length} from #{filename}"
	else #if it doesn't exist
		puts "Sorry #{filename} doesn't exist."
		exit
	end
end

try_load_students
interactive_menu
