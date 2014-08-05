def input_students
	puts "Please enter the names of the students"
	puts "To finish, just hit return twice"
	#create an empty array
	students = []
	# get the first name
	name = gets.chomp
	# while the name is not empty, repeat this code
	while !name.empty? do
	# add the student hash to the array
	students << {:name => name, :cohort => :november}
	puts "Now we have #{students.length} students"
	# get another name from the user
	name = gets.chomp
	end
	students
end

def print_header
	puts "The students of the August cohort at Makers Academy:"
end

def print(students)
	students.each_with_index { |student, index| puts "#{index+1} #{student[:name]} (#{student[:cohort]} cohort)"}
end

def print_A(students)
	puts "And the students whose names start with A are:"
	students.each { |student| puts "#{student[:name]} (#{student[:cohort]} cohort)" if student[:name].start_with?("A") }
end

def print_short(students)
	puts "Students with names shorter than 12 chars:"
	students.each { |student| puts "#{student[:name]}" if student[:name].length < 12 }
end

def print_footer(names)
	puts "Overall, we have #{names.length} great students"
end



students = input_students

print_header
print(students)
print_A(students)
print_short(students)
print_footer(students)