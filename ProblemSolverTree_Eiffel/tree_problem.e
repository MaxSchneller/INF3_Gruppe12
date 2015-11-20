note
	description: "Summary description for {TREE_PROBLEM}."
	author: "Group 12. Christoph Dörr, Markus Rein, Max Schneller"
	date: "$Date$"
	revision: "$Revision$"

class
	TREE_PROBLEM

inherit
	DIVISIBLE_PROBLEM
	TREES


redefine
 make

feature {NONE} -- Initialization
	-- Initialization for "Current".
	solution: TREE_SOLUTION
	searchNum, lastNumb: INTEGER
	make(tmpTree : TREES)
		do
			current.setstarttree (tmpTree)
			create solution.make
			directlySolvable := FALSE
		end

--feature {NONE} -- Attributes
--	solution: TREE_SOLUTION
--	searchNum, lastNumb: INTEGER
feature {ANY} -- Setter
	root : detachable TREES
	--Method calls from the Client. Gives the numer in the tree.
	--method is called from computeSolution in DIVISIBLE_PROBLEM class
	set(number:INTEGER)
		do
			searchNum := number
			lastNum := root.node.getValue

			computeSolution
		end

	--Implements Method from DIVISIBLE_PROBLEM
	checkSolvability
		do
			--termination condition if the start numer is 0
			--faculty of 0 is 1
			if searchNum = lastNum then
				directlySolvable := true
				solution.set (true)
			end
		end

	--Implements Method from DIVISIBLE_PROBLEM
	divide
		do
			--formular of one faculty step
			if(searchNum < root.node.getleft.getValue) then
				lastNum := root.node.getLeft.getValue

			elseif( searchNum > root.node.getright.getValue) then
				lastNum := root.node.getRight.getvalue
			end
		end

	--Saves the solution in result
	getSolution: TREE_SOLUTION
		do
			RESULT := solution
		end

end
