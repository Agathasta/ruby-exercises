def stock_picker (stocks)
    max_profit = 0

    for i in (0...stocks.length)
        for j in ((i + 1)...stocks.length)
            if stocks[j] - stocks[i] > max_profit
                max_profit = stocks[j] - stocks[i]
                days = [i,j]
            end
        end
    end
    p days
end

stock_picker([17,3,6,9,15,8,6,2,10,1])