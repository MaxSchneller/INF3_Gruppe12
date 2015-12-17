note
	description : "project application root class"
	date        : "$Date$"
	revision    : "$Revision$"

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
			p: TREE_PROBLEM
			s: TREE_SOLUTION

			test : INTEGER;
			tree : TREES;


		do


			create tree.make(11)
			tree.add(17)
			tree.add (19)
			tree.add (34)
			tree.add (2)

			create p.make



			--Test
			p.set (11)
			s := p.getsolution
			print(s.getResult)
			print("%N")

		end

end
