note
	description: "Summary description for {TREE_SOLUTION}."
	author: "Group 12. Christoph Dörr, Markus Rein, Max Schneller"
	date: "$Date$"
	revision: "$Revision$"

class
	TREE_SOLUTION

inherit
	SOLUTION

create
	make

feature {NONE} -- Init Method. Creads procedure "make"
	make
		do
		end

feature {NONE} -- Attributes
	theResult: BOOLEAN

feature {ANY} -- Getter
	--Check if it is not nothing
	getResult:BOOLEAN
		do
			Result := theResult
		ensure
			Result /= 0
		end

feature {TREE_PROBLEM} -- Setter
	--Check that the number is or bigger than one
	set(solution: BOOLEAN)
		require
			number /= 0
		do
			print("SOLUTION FOUND!")
		end
end



