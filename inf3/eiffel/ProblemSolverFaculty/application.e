note
	description : "Faculty application root class"
	date        : "$Date$"
	revision    : "$Revision$"

--Applivation-class as the Client
--Inherits the upper class ARGUMENTS
class
	APPLICATION

inherit
	ARGUMENTS

create
	make

feature {NONE} 	-- Run application.
	make
		-- Initialization
		local
			p: FACULTY_PROBLEM
			s: FACULTY_SOLUTION

		do
			create p.make

			--Test1
			p.set (0)
			s := p.getsolution
			print(s.getfaculty)
			print("%N")


		end

end
