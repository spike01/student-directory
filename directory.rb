students = [
 {:name => "Javier Silverio", :cohort => :august},
 {:name => "Elliot Lewis", :cohort => :august},
 {:name => "Ben Tillett", :cohort => :august},
 {:name => "Vincent Koch", :cohort => :august},
 {:name => "Michelle Ballard", :cohort => :august},
 {:name => "Nick Roberts", :cohort => :august},
 {:name => "Tatiana Soukiassian", :cohort => :august},
 {:name => "Mervé Silk", :cohort => :august},
 {:name => "Albert Vallverdu", :cohort => :august},
 {:name => "Lovis Schultze", :cohort => :august},
 {:name => "Henry Stanley", :cohort => :august},
 {:name => "Spike Lindsey", :cohort => :august},
 {:name => "Ruth Earle", :cohort => :august},
 {:name => "Andy Gates", :cohort => :august},
 {:name => "Faisal Aydarus", :cohort => :august},
 {:name => "Ethel Ng", :cohort => :august},
 {:name => "Kevin Daniells", :cohort => :august},
 {:name => "Maya Driver", :cohort => :august},
 {:name => "Leopold Kwok", :cohort => :august},
 {:name => "James McNeil", :cohort => :august},
 {:name => "Jerome Pratt", :cohort => :august},
 {:name => "David Wickes", :cohort => :august},
 {:name => "Chris Oatley", :cohort => :august},
 {:name => "Marc Singh", :cohort => :august},
]
# Prints the total num of students

def print_header
	puts "The students of the August cohort at Makers Academy:"
end

def print(names)
	names.each {|student| puts "#{student[:name]} (#{student[:cohort]} cohort)"}
end

def print_footer(names)
	puts "Overall, we have #{names.length} great students"
end


print_header
print(students)
print_footer(students)