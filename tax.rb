class Receipt

	SALES_TAX = 0.1
	IMPORT_TAX =  0.05
	def initialize 
		@receipt = []
	end

	def add_item(name, amount, is_imported, is_exempt, price)
		@receipt.push(name: name, amount: amount, is_imported?: is_imported, 
																is_exempt?: is_exempt, price: price.to_f)
	end

	def print
		taxes = 0
		total_price = 0

		@receipt.each do |item|
			sales_tax = !item[:is_exempt] ? item[:price] * SALES_TAX : 0
			import_tax = item[:is_imported] ? item[:price] * IMPORT_TAX : 0
			final_price = item[:price] + sales_tax + import_tax

			puts "#{item[:amount]} #{item[:name]}: $#{final_price}"
			taxes += sales_tax + import_tax
			total_price += final_price
		end
		puts "Total Taxes: $#{taxes}"
		puts "Total Sale: $#{total_price}"
	end
end

receipt1 = Receipt.new
receipt1.add_item("book", 1, false, true, 10.00)
receipt1.add_item("music cd", 1, false, false, 16.49)
receipt1.add_item("chocolate bar", 1, false, true, 0.85)
receipt1.print
puts
receipt2 =Receipt.new
receipt2.add_item("box of chocolates", 1, true, true, 10.50)
receipt2.add_item("imported bottle of perfume", 1, false, false, 54.65)
receipt2.print
puts
receipt3 = Receipt.new
receipt3.add_item("imprted bottle of perfume", 1, true, false, 32.19)
receipt3.add_item("packet of headache pills", 1, false, true, 9.75)
receipt3.add_item("imported box of chocolates", 1, true, true, 11.85)
receipt3.print
