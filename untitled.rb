class Receipt

	SALES_TAX = 0.1
	IMPORT_TAX =  0.05
	def initialize 
		@receipt = []
	end

	def add_item(name, amount, is_imported, is_exempt, price)
		@receipt.push(irname: name, amount: amount, is_imported: is_imported, 
																is_exempt: is_exempt, price: price.to_f)
	end

	def print
		taxes = 0
		total_price = 0

		@receipt.each do |item|
			sales_tax = !item[:is_exempt] ? @receipt[:price] * SALES_TAX : 0
			import_tax = item[:is_imported] ? @receipt[:price] * IMPORT_TAX : 0
			final_price = item[:price] + sales_tax + import_tax

			puts "#{item[:amount]} #{item[:name]}: $#{final_price}"
			taxes += sales_tax + import_tax
			total_price += final_price
		end
		puts "Total Taxes: $#{taxes}"
		puts "Total Sale: $#{total_price}"
	end
end

receipt = Receipt.new
receipt.add_item("book", 1, false, true, 10.00)
receipt.print
