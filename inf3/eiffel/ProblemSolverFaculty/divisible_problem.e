note
	description: "Summary description for {DIVISIBLE_PROBLEM}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

deferred class
	DIVISIBLE_PROBLEM

inherit
	PROBLEM

feature {ANY} -- Attributes
	directlySolvable: BOOLEAN

feature {ANY} -- Rutines

	checkSolvability
		deferred
		end

	divide
		require
			not directlySolvable
		deferred
		ensure

		end

	computeSolution
		require

		do
			from
				checkSolvability
			until
				directlySolvable
			loop
				divide
				checkSolvability
			end
		ensure

		end
end
