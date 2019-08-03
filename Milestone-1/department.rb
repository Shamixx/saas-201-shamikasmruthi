class Department
	attr_accessor :deptname , :sections, :studentslist, :sorted_stud_list
	def initialize(name)
		self.deptname=name
		self.sections={'A'=>3,'B'=>3,'C'=>3}
		self.studentslist={}
		self.sorted_stud_list={}
		
	end
	
	def show_details
	
		sorted
		self.sorted_stud_list.each do |key,val|
			puts "#{key} has roll no #{val}"
		end
		
	end
	def sorted
		alpha_sorted=[]
		num_sorted=[]
		alpha_sorted=studentslist.keys.sort_by{|k,v| k}
		num_sorted=studentslist.values
		alpha_sorted.each_with_index {|k,i|self.sorted_stud_list[k] = num_sorted[i]}
	end
	
	def show_details_sec(section)
		sorted
		self.sorted_stud_list.each do |key,val|
			puts "#{key} has roll no #{val}" if("#{val}"==section)		
		end
	end
#=begin
	def show_details_stud(stud_name)
		sorted
		stud_details=[]
		if ((stud_details=check(stud_name))!=-1)
		puts "#{stud_details[0]} has roll no #{stud_details[1]} is of section #{stud_details[1][-2]} and department #{self.deptname}"
		end
	end
#=end
		      

	def get_details(stud_name)
		studentslist[stud_name]
	end

	def get_name
		deptname
	end

	def add_rollno(stud_name,rollno)
		studentslist[stud_name]=rollno
		puts studentslist[stud_name]
	end		

	def remove_rollno(stud_name)
		studentslist.delete(stud_name)
	end

	def get_seats_in_section(section)
		 self.sections[section] 
	end

	def get_specific_section_rollno(section)
		sect=3-self.sections[section]+1
		sect=section+sect.to_s
		self.sections[section]=self.sections[section]-1
		return sect
	end
	
#=begin
	def check(stud_name)
		if (sorted_stud_list.include?(stud_name))
		return sorted_stud_list.assoc(stud_name)
		else
		return -1
		end
	end
#=end

	def get_section
		if self.sections['A'] >= 1
			sect=10-self.sections["A"]+1
			sect='A'+sect.to_s
			self.sections['A']=self.sections['A']-1
		elsif self.sections['B'] >=1
			sect=10-self.sections["B"]+1
			sect='B'+sect.to_s
			self.sections['B']=self.sections['B']-1
		elsif self.sections['C'] >= 1
			sect=10-self.sections["C"]+1
			sect='C'+sect.to_s
			self.sections['C']=self.sections['C']-1			
		else
			sect=0
		end
		return sect
	end

end


