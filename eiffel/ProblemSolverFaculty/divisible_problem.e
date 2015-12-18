note
	description: "Summary description for {DIVISIBLE_PROBLEM}."
	author: "Gruppe12"
	date: "$Date$"
	revision: "$Revision$"

--DIVISIBLE_PROBLEM is the Child-Class for the PROBLEM Interface
--It is the upper class for FACULTY_PROBLEM and a Interface, too.
deferred class
	DIVISIBLE_PROBLEM

inherit
	PROBLEM

feature {ANY} -- Attributes
	directlySolvable: BOOLEAN

feature {ANY} -- Rutines
	--Abstract Method
	checkSolvability
		deferred
		end

	--Abstract Method
	--Call for not directly solvable
	divide
		require
			not directlySolvable
		deferred
		end

	--Method to compute a solution
	computeSolution
		do
			--Loop checks if it´s solavable and runs until directylySolvable is true
			--If it´s not solvable call the method divide. If splits the problem
			from
				checkSolvability
			until
				directlySolvable
			loop
				divide
				checkSolvability
			end
		end

end
