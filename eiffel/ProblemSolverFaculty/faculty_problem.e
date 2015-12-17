note
	description: "Summary description for {FACULTY_PROBLEM}."
	author: "Gruppe12"
	date: "$Date$"
	revision: "$Revision$"

--Implements the upper class DIVISIBLE_PROBLEM
class
	FACULTY_PROBLEM

inherit
	DIVISIBLE_PROBLEM

create
	make

feature {NONE} -- Initialization
	-- Initialization for `Current'.
	make
		do
			create solution.make
			directlySolvable := FALSE
		end

feature {NONE} -- Attributes
	solution: FACULTY_SOLUTION
	commitedNumb, resulution: INTEGER

feature {ANY} -- Setter

	--Method calls from the Client. Gives the numer for the faculty.
	--shouldn´t be 0. If not 0 save in the attributes and start with
	--method computeSolution in DIVISIBLE_PROBLEM class
	set(number:INTEGER)
		require
			number >= 0
		do
			commitedNumb := number
			resulution := number
			computeSolution
		end

	--Implements Method from DIVISIBLE_PROBLEM
	checkSolvability
		do
			--termination condition if the start numer is 0
			--faculty of 0 is 1
			if commitedNumb = 0 then
				directlySolvable := true
				solution.set (1)
			--termination condition of calculation
			elseif commitedNumb = 1 then
				directlySolvable := true
				solution.set (resulution)
			end
		end

	--Implements Method from DIVISIBLE_PROBLEM
	divide
		do
			--formular of one faculty step
			resulution := (commitedNumb-1) * resulution
			commitedNumb := commitedNumb - 1
		end

	--Saves the solution in result
	getSolution: FACULTY_SOLUTION
		do
			Result := solution
		end
end
