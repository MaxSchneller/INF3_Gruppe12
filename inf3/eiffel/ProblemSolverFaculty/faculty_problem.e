note
	description: "Summary description for {FACULTY_PROBLEM}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	FACULTY_PROBLEM

inherit
	DIVISIBLE_PROBLEM

create
	make

feature {NONE} -- Initialization

	make
			-- Initialization for `Current'.
		do
			create solution.make
			directlySolvable := FALSE
		end

feature {NONE} -- Attributes
	solution: FACULTY_SOLUTION
	commitedNumb, resulution: INTEGER

feature {ANY} -- Setter

	set(number:INTEGER)
		require
			number > 0
		do
			commitedNumb := number
			resulution := number
			computeSolution
		end

	checkSolvability
		do
			if commitedNumb = 1 then
				directlySolvable := true
				solution.set (resulution)
			elseif commitedNumb = 0 then
				directlySolvable := true
				solution.set (1)
			end
		end

	divide
		do
			resulution := (commitedNumb-1) * resulution
			commitedNumb := commitedNumb - 1
		end

	getSolution: FACULTY_SOLUTION
		do
			Result := solution
		end
end
