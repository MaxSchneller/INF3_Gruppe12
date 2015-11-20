 note
	description: "Summary description for {TREES}. "
	author: "Group 12. Christoph Dörr, Markus Rein, Max Schneller"
	date: "$Date$"
	revision: "$Revision$"

class
	TREES

create
		make

feature -- Initialization
	node : NODE;

feature
-- creates the Tree
	make(binaryTreeNumber : INTEGER)
		do
			create	node.make(binaryTreeNumber, Void)
		end

feature
	--Start the "hasElementFunctionRekursiv" if the node /= void
	hasElement(binaryTreeNumber : INTEGER) : BOOLEAN
	require
		binaryTreeNumber.abs >= 0
	do
		if attached current.node as mainNode then
			Result := hasElementFunctionRekursiv(binaryTreeNumber, mainNode)
		end
	end

feature {NONE}
--
	hasElementFunctionRekursiv(binaryTreeNumber : Integer; root : NODE) : BOOLEAN
	require
		binaryTreeNumber.abs >= 0
		root /= Void
		do
		    	if (binaryTreeNumber = root.getvalue) then
                	Result := true
			  	elseif (binaryTreeNumber < root.getValue) then
                	if attached root.getLeft as mainNode then
						Result := hasElementFunctionRekursiv(binaryTreeNumber, mainNode)
                    end
                elseif (binaryTreeNumber > root.getValue)then
                	if attached root.getright as mainNode then
                        Result := hasElementFunctionRekursiv(binaryTreeNumber, mainNode)
                    end
                end
		end


feature
--Start the "addFunctionRekursiv" Function if the node /= Void
	add(binaryTreeNumber : INTEGER)
	require
		binaryTreeNumber.abs >= 0


	do
		if hasElement(binaryTreeNumber)=false then



		if attached Current.node as mainNode then


			addFunctionRekursiv(mainNode, binaryTreeNumber)
end
		end
	ensure
		haselement (binaryTreeNumber)
	end

feature{TREES}
	--
	addFunctionRekursiv(n : NODE; binaryTreeNumber : INTEGER)
	require
		binaryTreeNumber.abs >= 0
	local localNode : NODE
		do
                if (binaryTreeNumber < n.getValue) then
                	if attached n.getLeft as mainNode then
						addFunctionRekursiv(mainNode, binaryTreeNumber)
                    else
                        create localNode.make(binaryTreeNumber,n)
                        n.setLeft( localNode);
                    end
                end
                if (binaryTreeNumber > n.getValue) then
                	if attached n.getright as mainNode then
                        addFunctionRekursiv(mainNode, binaryTreeNumber);
                    else
                        create localNode.make(binaryTreeNumber,n)
                        n.setRight( localNode );
                    end
                end
        ensure
        	haselement (binaryTreeNumber) = true
        end


feature
	remove(binaryTreeNumber : INTEGER)
	require
		binaryTreeNumber.abs >= 0
	do
		if attached current.node as mainNode then
			removeFunctionRekursiv(binaryTreeNumber, mainNode)
		end
	ensure
		hasElement(binaryTreeNumber) = False
	end

feature{NONE}
	--
	removeFunctionRekursiv(binaryTreeNumber: INTEGER; root : NODE)
	require
		binaryTreeNumber.abs >= 0
		root /= Void
	local localNode : detachable NODE smallNode : detachable NODE


	do
		-- Check if Delete-Value == first leave on left side and has no other leaves
   		-- then --> delete it
		if attached root.getLeft as mainNode1 then
				if( mainNode1.getValue = binaryTreeNumber and mainNode1.getleft = Void and mainNode1.getright = void)then
			        root.setParent(Void)
			        root.setLeft (Void)
			       end
		end

    	-- Check if Delete-Value == first leave on right side and has no other leaves
   		-- then --> delete it
		if attached root.getRight as mainNode2 then
				if( mainNode2.getValue = binaryTreeNumber and mainNode2.getleft = Void and mainNode2.getright = void)then
			        root.setParent(Void)
			        root.setRight (Void)
			       end
		end


	--IF the root Value is I and there is no other leave delete/or set the main tree = void
		if( binaryTreeNumber = root.getValue and root.getright = Void and root.getleft = Void)then
			root.setvalue (0)
			--remove(root)Only works with Integer ?!
    	elseif (binaryTreeNumber < root.getValue) then
    	--IF i < root.getValue is the value(i) on the left side of the tree then go in this node
        	if attached root.getleft as mainNode then
				removeFunctionRekursiv(binaryTreeNumber, mainNode)
			end
    	else
    	--Is the Value bigger than the root node
        	if (binaryTreeNumber > root.getValue) then
        		--Search in the right part of the tree
             	if attached root.getRight as mainNode then
					removeFunctionRekursiv(binaryTreeNumber, mainNode)
				end
         	else --The node to be deleted have been found
         	--the Node to be deleted has only a left Leave         	
            	if (root.getleft = Void) then
                	if attached root.getRight as mainNode5 then
						root.setValue(mainNode5.getValue)
						root.setParent(mainNode5.getParent)
						root.setLeft (mainNode5.getLeft)
						root.setRight(mainNode5.getRight)
						mainNode5.setValue(0)
					end
             	else -- Node to be deletet has no right Leave
                	if (root.getright = Void) then
                		if attached root.getLeft as mainNode then
							root.setValue(mainNode.getValue)
							root.setParent (mainNode.getParent)
							root.setLeft (mainNode.getLeft)
							root.setRight(mainNode.getRight)
						end
               		else -- there are two children
               		--Search the smallest child from the node to be deleted
                		if attached root.getRight as mainNode then
                			if attached root.getleft as mainNode2 then
                				if(mainNode.getValue < mainNode2.getValue) then
                					smallNode := root.getLeft
                				elseif(mainNode.getValue > mainNode.getValue)then
                					smallNode := root.getRight
                				else
                					smallNode := root
                				end
                			end
						end
                  		if (localNode = root) then --No node have been found
						--Change the Node to delete with the smallest child
						--Node has been deleted
                      		if attached root.getRight as mainNode then
								root.setValue(mainNode.getValue)
							end

                    	--change the tree
                    		localNode := root.getRight;
                    		if attached root.getLeft as mainNode then
								root.setright(mainNode.getRight)
							end
						--delete the storage place
                    		--free(localNode);

                  		else
                  			--smallest child found
                 		 	if attached root.getLeft as mainNode then
								root.setValue(mainNode.getValue)
							end
                  		end
                	end
                end
 			end
		end
	end
end
