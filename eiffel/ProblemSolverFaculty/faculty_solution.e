note
	description: "Summary description for {FACULTY_SOLUTION}."
	author: "Gruppe12"
	date: "$Date$"
	revision: "$Revision$"

--FACULTY_SOLUTION implemnts the SOLUTION Interface
class
	FACULTY_SOLUTION

inherit
	SOLUTION

create
	make

feature {NONE} -- Init Method. Creads procedure "make"
	make
		do
		end

feature {NONE} -- Attributes
	faculty: INTEGER

feature {ANY} -- Getter
	--For the Attribute faculty
	--Check that it is not nothing
	getFaculty:INTEGER
		do
			Result := faculty
		ensure
			Result /= 0
		end

feature {FACULTY_PROBLEM} -- Setter
	--For the Attribute faculty
	--Check that the number is or bigger than one
	set(number:INTEGER)
		require
			number >= 1
		do
			faculty := number
		end
end
