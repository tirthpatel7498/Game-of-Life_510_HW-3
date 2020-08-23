do 
   --Create a table....Life
    Life = {}
    local metaTable = { __index = Life }

    -- Function to initially create a table...
    function Life:createTable(r, c)
        local table = {}

        for i = 1, r do
			local row = {}
			for j = 1, c do
				row[j] = 0
			end
            table[i] = row
            --io.write(table[i])
        end
        
        return setmetatable({
            table = table,
            r = r,
            c = c,

        }, metaTable)
    end

    -- function to set the element to be "alive"....represented by "1"
    function Life:setLife(x,y)
        self.table[x][y] = 1
    end

    -- function to set the element to be "dead"....represented by "-"
    function Life:unsetLife(x,y)
        self.table[x][y] = 0
    end


    function Life:print_matrix()
		local table = self.table
		for i = 1, self.r+2 do
			io.write('*')
		end
		print('')
		for i = 1, self.r do
			io.write('*')
			for j = 1, self.c do
				if table[i][j] == 0 then
					io.write('.')
				else 
					io.write('O')
				end
			end
			print('*')
		end	
		for i = 1, self.r+2 do
			io.write('*')
		end
		print('')
    end
    
    function Life:moveToNewGen()
        --firstly we need to create a copy of the previous table because any changes to the original table may affect the individual cell outcomes...
        local table2 = self.table
        for i = 1, self.r do
			for j = 1, self.c do
				local s = 0
				for p = i-1,i+1 do
					for q = j-1,j+1 do
						if p > 0 and p <= self.r and q > 0 and q <= self.c then
							s = s + self.table[p][q]
						end
					end
				end
				s = s - self.table[i][j]
				if s == 3 or (s+self.table[i][j]) == 3 then
					table2[i][j] = 1
				else
					table2[i][j] = 0
				end
			end
        end
        local table = table2

    end    


end
local life = Life:createTable(7,7)

life:setLife(3,3)
life:setLife(1,2)
life:setLife(2,3)
life:setLife(3,1)
life:setLife(3,2)


life:print_matrix(7,7)

life:moveToNewGen()

life:print_matrix(7,7)