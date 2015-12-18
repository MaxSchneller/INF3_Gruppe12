note
	description: "Binary Application main class"
	author: "Group 12. Christoph Dörr, Markus Rein, Max Schneller"
	date: "$Date$"
	revision: "$Revision$"

class
	APPLICATION

inherit
	ARGUMENTS

create
	make

feature -- Initialization
	
	tree : TREES;
	existing : BOOLEAN;
	existing_deleteted : BOOLEAN;

feature {ANY}
	make
		do
			create tree.make(10)
			tree.add(15)
			tree.add (15)
			tree.add (20)
			tree.add (17)

			existing := tree.hasElement(15)
			print("15 exist: " + existing.out)

			io.new_line
			existing := tree.hasElement(5)
			print("5 exist: " + existing.out)
			io.new_line
			existing := tree.hasElement(20)
			print("20 exist: " + existing.out)
			io.put_new_line




			tree.remove (15)
			tree.remove (15)
			tree.remove (20)
			tree.remove (17)
			io.new_line

			existing_deleteted := tree.hasElement(15)
			print("15 exist: " + existing_deleteted.out)
			io.new_line
			existing_deleteted := tree.hasElement(5)
			print("5 exist: " + existing_deleteted.out)
			io.new_line
			existing_deleteted := tree.hasElement(20)
			print("20 exist: " + existing_deleteted.out)
			io.new_line

			tree.remove (10)
			existing_deleteted := tree.hasElement(10)
			print("10 exist: " + existing_deleteted.out)

			io.new_line
			io.put_new_line


		end


end

