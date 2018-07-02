class FinancerMaster < ActiveRecord::Base
  validates :code, presence:true,uniqueness:{case_sensitive:false}
  validates :name, presence:true

  def self.import(file)
   	spreadsheet = open_spreadsheet(file)
   	(2..spreadsheet.last_row).each do |i| 

    	code = spreadsheet.cell(i,'B').to_i
      if code == 0
        code = spreadsheet.cell(i,'B')
      else
        code = spreadsheet.cell(i,'B').to_i
      end
      name = spreadsheet.cell(i,'C')
      description = spreadsheet.cell(i,'D')
      pin_code = spreadsheet.cell(i,'E')
      place = spreadsheet.cell(i,'F')
      address = spreadsheet.cell(i,'G')
      contact_no = spreadsheet.cell(i,'H')
      email = spreadsheet.cell(i,'I')
      contact_person = spreadsheet.cell(i,'J')
    
      @status = spreadsheet.cell(i,'K')
      if @status == "Active"
      	status = true
      else
  			status = false
  		end 

      @financer_master = FinancerMaster.find_by(name: name)
      if @financer_master.nil?
      	FinancerMaster.create(code: code,name: name,status: status,description: description,pin_code: pin_code,
      		address: address,place: place,contact_no: contact_no,email: email,contact_person: contact_person,status: status)     
      else
        @financer_master.update(code: code,name: name,status: status,description: description,pin_code: pin_code,
        	address: address,place: place,contact_no: contact_no,email: email,contact_person: contact_person,status: status)
      end
    end#do
  end#def


  def self.open_spreadsheet(file)
    case File.extname(file.original_filename)
      when ".csv" then Roo::CSV.new(file.path, file_warning: :ignore)
      when ".xls" then Roo::Excel.new(file.path, file_warning: :ignore)
      when ".xlsx" then Roo::Excelx.new(file.path, file_warning: :ignore)
      else raise "Unknown file type: #{file.original_filename}"
    end
  end

end
