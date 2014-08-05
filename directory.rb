@students = []

def interactive_menu
	loop do
		# First, print a menu and get the user's input
		print_menu
		selection = gets.chomp
		case selection
			when "1"
				input_students
			when "2"
				show_students
			when "9"
				exit # program terminates
			else
				puts "I don't know what you meant, try again"
		end
	end
end

def print_menu
		puts "1. Input students"
		puts "2. Show students"
		puts "9. Exit"
end

def show_students
	print_header
	print
	print_footer
end

def input_students
	puts "Please enter the names, cohort and hobby of the students"
	puts "To finish, just hit return thrice"
	# get the first name
	name = gets.chomp
	cohort = gets.chomp.downcase.to_sym
	cohort = :august if cohort.empty?
	hobby = gets.chomp
	# while the name is not empty, repeat this code
	while !name.empty? do
	# add the student hash to the array
	@students << {:name => name, :cohort => cohort, :hobby => hobby}
	puts "Now we have #{@students.length} student" if @students.length == 1
	puts "Now we have #{@students.length} students" if @students.length >= 2
	# get another name from the user
	name = gets.chomp
	cohort = gets.chomp.downcase.to_sym
	cohort = :august if cohort.empty?
	hobby = gets.chomp
	end
end

def print_header
	puts "The students of the August cohort at Makers Academy:"
end

def print
	@students.each_with_index { |student, index| puts "#{index+1} #{student[:name]} (#{student[:cohort]} cohort) #{student[:hobby]}"}
end

def print_by_cohort
	@students.sort[:cohort]
	puts "Here are the students by cohort:"
	@students.each { |student| puts "#{student[:name]}, #{student[:cohort]}" }
end

=begin
def print_while(students)
	puts "(Printing students with while condition)"
	i = 0
	until i >= students.length 
		puts "#{students[i][:name]}".center(20, "-------")
		i += 1
	end
end

def print_A(students)
	puts "And the students whose names start with A are:"
	students.each { |student| puts "#{student[:name]}" if student[:name].start_with?("A") }
end

def print_short(names)
	puts "Students with names shorter than 12 chars:"
	names.each { |student| puts "#{student[:name]}" if student[:name].length < 12 }
end
=end

def print_footer
	puts "Overall, we have #{@students.length} great students"
end



#students = input_students

#print_header
#print(students)
#print_A(students)

#print_footer(students)
#print_while(students)
#print_by_cohort(students)

interactive_menu