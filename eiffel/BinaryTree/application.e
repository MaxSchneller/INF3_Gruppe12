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
	test : INTEGER;
	tree : TREES;
	res : BOOLEAN;
	res2 : BOOLEAN;

feature {ANY}
	make
		do
			create tree.make(10)
			tree.add(15)
			tree.add (15)
			tree.add (20)
			tree.add (17)

			res := tree.hasElement(15)
			print("15 exist: " + res.out)

			io.new_line
			res := tree.hasElement(5)
			print("5 exist: " + res.out)
			io.new_line
			res := tree.hasElement(20)
			print("20 exist: " + res.out)
			io.put_new_line




			tree.remove (15)
			tree.remove (5)
			tree.remove (20)
			tree.remove (17)
			io.new_line

			res2 := tree.hasElement(15)
			print("15 exist: " + res2.out)
			io.new_line
			res2 := tree.hasElement(5)
			print("5 exist: " + res2.out)
			io.new_line
			res2 := tree.hasElement(20)
			print("20 exist: " + res2.out)
			io.new_line

			tree.remove (10)
			res2 := tree.hasElement(10)
			print("10 exist: " + res2.out)

			io.new_line
			io.put_new_line


		end


end

