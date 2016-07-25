class Quote < ApplicationRecord

	def self.import(file)
		if file
			spreadsheet = open_spreadsheet(file)
	  	header = spreadsheet.row(1)
	  	(2..spreadsheet.last_row).each do |i|
	    	row = Hash[[header, spreadsheet.row(i)].transpose]
	    	product = find_by_id(row["id"]) || new
	    	product.attributes = row.to_hash.slice(*row.to_hash.keys)
	    	product.save! if product.content
	  	end
	  end
	end

	def self.open_spreadsheet(file)
	  case File.extname(file.original_filename)
		  when ".csv" then Roo::CSV.new(file.path, packed: false, file_warning: :ignore)
		  when ".xls" then Roo::Excel.new(file.path, packed: false, file_warning: :ignore)
		  when ".xlsx" then Roo::Excelx.new(file.path, packed: false, file_warning: :ignore)
		  else raise "Unknown file type: #{file.original_filename}"
	  end
	end

end
