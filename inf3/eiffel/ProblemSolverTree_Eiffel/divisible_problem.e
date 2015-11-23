note
	description: "Summary description for {DIVISIBLE_PROBLEM}."
	author: "Group 12. Christoph Dörr, Markus Rein, Max Schneller"
	date: "$Date$"
	revision: "$Revision$"

--DIVISIBLE_PROBLEM is the Child-Class for the PROBLEM Interface
--It is the upper class for FACULTY_PROBLEM and a Interface, too.
deferred class
	DIVISIBLE_PROBLEM

inherit
	PROBLEM

	feature --Saves the StartTree in this Class
	startTree : detachable TREES


feature{NONE} --Constructor sets the StartTree
	make(tmpTree : TREES)
	do
		current.setstarttree (tmpTree)
	end

feature --Set/Get the StartTree
	getStartTree : detachable TREES
	do
		Result := startTree
	ensure
		Result = startTree
	end

	setStartTree(tmpTree : TREES)
	do
		startTree := tmpTree
	ensure
		startTree = tmpTree
	end



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
