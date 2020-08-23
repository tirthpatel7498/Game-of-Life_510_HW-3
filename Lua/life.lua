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
end
local life = Life:createTable(7,7)

life:setLife(3,3)
life:setLife(1,2)
life:setLife(2,3)
life:setLife(3,1)
life:setLife(3,2)


life:print_matrix(7,7)