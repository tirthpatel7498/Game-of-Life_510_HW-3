do 
   --Create a table....GOL
    GOL = {}
    local metaTable = { __index = GOL }

    -- Function to initially create a table...
    function GOL:createTable(r, c)
        local table = {}
        for i = 1, r do
			local row = {}
			for j = 1, c do
				row[j] = 0
			end
            table[i] = row
        end
        
        return setmetatable({
            table = table,
            r = r,
            c = c,

        }, metaTable)
    end

    -- function to set the element to be "alive"....represented by "1"
    function GOL:setLife(x,y)
        self.table[x][y] = 1
    end

    function GOL:printTable()
		local table = self.table
		print('')
		for i = 1, self.r do
			for j = 1, self.c do
				if table[i][j] == 0 then
					io.write('. ')
				else 
					io.write('O ')
				end
			end
			--print('*')
			io.write('\n')
		end	
		
		print('')
    end
    
    function GOL:moveToNewGen()
        --firstly we need to create a copy of the previous table because any changes to the original table may affect the individual cell outcomes...
		local table2 = self.table
		
		--Lets make changes to table2 and then compy the table 2 into main table
        for i = 1, self.r do
			for j = 1, self.c do
				local numOfNeighbors = 0
				for r1 = i,i+1 do --
					for c1 = j,j+1 do --
						if r1 <= self.r and c1 > 0 and c1 <= self.c then --
							numOfNeighbors = numOfNeighbors + self.table[r1][c1]
						end
					end
				end
				-- remove the current cell from numOfNeighbors
				numOfNeighbors = numOfNeighbors - self.table[i][j]
				if self.table[i][j] == 1 then
					if numOfNeighbors < 2 and numOfNeighbors > 3 then
						table2[i][j] = 0
					end
				else
					if numOfNeighbor == 3 then
						table2[i][j] = 1
					end
				end
				
			end
        end
        --
    end    


end

local life = GOL:createTable(17,17)

-- Setting up initial generation...
life:setLife(2, 4);
life:setLife(2, 5);
life:setLife(2, 6);
life:setLife(2, 10);
life:setLife(2, 11);
life:setLife(2, 12);
life:setLife(4, 2);
life:setLife(4, 7);
life:setLife(4, 9);
life:setLife(4, 14);
life:setLife(5, 2);
life:setLife(5, 7);
life:setLife(5, 9);
life:setLife(5, 14);
life:setLife(6, 2);
life:setLife(6, 7);
life:setLife(6, 9);
life:setLife(6, 14);
life:setLife(7, 4);
life:setLife(7, 5);
life:setLife(7, 6);
life:setLife(7, 10);
life:setLife(7, 11);
life:setLife(7, 12);
life:setLife(9, 4);
life:setLife(9, 5);
life:setLife(9, 6);
life:setLife(9, 10);
life:setLife(9, 11);
life:setLife(9, 12);
life:setLife(10, 2);
life:setLife(10, 7);
life:setLife(10, 9);
life:setLife(10, 14);
life:setLife(11, 2);
life:setLife(11, 7);
life:setLife(11, 9);
life:setLife(11, 14);
life:setLife(12, 2);
life:setLife(12, 7);
life:setLife(12, 9);
life:setLife(12, 14);
life:setLife(14, 4);
life:setLife(14, 5);
life:setLife(14, 6);
life:setLife(14, 10);
life:setLife(14, 11);
life:setLife(14, 12);


-- Lets print out the next generations
gen = 0
io.write("Generation: ", gen, "\n")
life:printTable()
gen = gen+1
while(gen <= 30) do
	life:moveToNewGen()
	io.write("Generation: ", gen, "\n")
	life:printTable()
	io.write("\n")
    gen = gen+1
end
