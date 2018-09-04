#!/usr/bin/env ruby
def trader_du_dimanche(prices)

	day = 0
	low = 0
	high = 0
	max_profit = 0

	while (day < prices.length)
		buy = prices[day]

		(day..prices.length-1).each do |tomorrow|
			sell = prices[tomorrow]
			profit = sell - buy

			if profit > max_profit
				max_profit = profit
				low = prices.index(buy)
				high = prices.index(sell)
			end
		end

		day += 1
	end

	
	puts "#{[low, high]}"
	puts "Vous avez réalisé un bénéfice de #{prices[high]}€ - #{prices[low]}€ == #{prices[high] - prices[low]}€"
	puts "Grosso modo, si vous achetez le jour classé en position #{low} dans l'index et que vous revendiez le jour #{high} dans l'index, vous réaliserez un bénéfice de #{prices[high] - prices[low]}€, et ça c'est super cool!"



end


trader_du_dimanche([17,3,6,9,15,8,6,1,10])