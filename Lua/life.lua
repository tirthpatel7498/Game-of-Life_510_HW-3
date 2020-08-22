--Create a table....Life
Life = {}

-- Function to initially create a table...
function createTable(row, col)
    for i = 0, row-1 do
        for j = 0, col-1 do
            Life[i][j] = "-"
        end
    end
end

-- function to set the element to be "alive"....represented by "1"
function setLife(x,y)
    Life[x][y] = "1"
end
-- function to set the element to be "dead"....represented by "-"
function unsetLife(x,y)
    Life[x][y] = "-"
end








