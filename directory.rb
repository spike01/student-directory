students = [
 "Javier Silverio",
 "Elliot Lewis",
 "Ben Tillett",
 "Vincent Koch",
 "Michelle Ballard",
 "Nick Roberts",
 "Tatiana Soukiassian",
 "Mervé Silk",
 "Albert Vallverdu",
 "Lovis Schultze",
 "Henry Stanley",
 "Spike Lindsey",
 "Ruth Earle",
 "Andy Gates",
 "Faisal Aydarus",
 "Ethel Ng",
 "Kevin Daniells",
 "Maya Driver",
 "Leopold Kwok",
 "James McNeil",
 "Jerome Pratt",
 "David Wickes",
 "Chris Oatley",
 "Marc Singh"]
# Prints the total num of students

students.each { |student| puts student }

def print_header
	puts "The students of the August cohort at Makers Academy:"
end

def print(names)
	names.each {|name| puts name}
end

def print_footer(names)
	puts "Overall, we have #{names.length} great students"
end


print_header
print(students)
print_footer(students)