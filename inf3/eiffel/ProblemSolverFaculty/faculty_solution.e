note
	description: "Summary description for {FACULTY_SOLUTION}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	FACULTY_SOLUTION

inherit
	SOLUTION

create
	make

feature {NONE} -- Init

	make
		do

		end

feature {NONE} -- Attributes
	faculty: INTEGER

feature {ANY} -- Getter

	getFaculty:INTEGER
		do
			Result := faculty
		ensure
			Result /= 0
		end

feature {FACULTY_PROBLEM} -- Setter

	set(number:INTEGER)
		require
			number >= 1
		do
			faculty := number
		end
end
