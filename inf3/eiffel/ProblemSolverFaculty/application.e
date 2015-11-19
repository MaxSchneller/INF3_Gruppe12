note
	description : "Faculty application root class"
	date        : "$Date$"
	revision    : "$Revision$"

class
	APPLICATION

inherit
	ARGUMENTS

create
	make

feature {NONE} -- Initialization

	make
			-- Run application.
		local
			p: FACULTY_PROBLEM
			s: FACULTY_SOLUTION
		do
			create p.make
			p.set (4)
			s := p.getsolution
			print(s.getfaculty)
			print("%N")
			p.set (1)
			s := p.getsolution
			print(s.getfaculty)
		end

end
