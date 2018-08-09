class Scheme < ApplicationRecord
	belongs_to :vehicle_type
	has_many :enquiries
	validates :name, presence:true,uniqueness:{case_sensitive:false}
	validates :vehicle_type, presence:true
	validates :budget, presence:true
	validates :down_payment, presence:true
	validates :installment, presence:true
	validates :intrest, presence:true
	# validates :status, presence:true

	has_attached_file :avatar, styles: { medium: '300x300>', thumb: '100x100>' }, default_url: 'missing.png'
  	validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

  	has_attached_file :image1, styles: { medium: '300x300>', thumb: '100x100>' }, default_url: 'missing.png'
  	validates_attachment_content_type :image1, content_type: /\Aimage\/.*\Z/

  	def import
  		spreadsheet = open_spreadsheet(file)
	   	(2..spreadsheet.last_row).each do |i| 

	    	code = spreadsheet.cell(i,'B')
	      name = spreadsheet.cell(i,'C')
	    
	      if code == nil || name == nil
	      else
	        if code == 0
	          code = spreadsheet.cell(i,'B').to_i
	        else
	          code = spreadsheet.cell(i,'B')
	        end
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
	        	FinancerMaster.create(code: code,name: name,status: status,description: description,pin_code: pin_code,address: address,place: place,contact_no: contact_no,email: email,contact_person: contact_person,status: status)     
	        else
	          @financer_master.update(code: code,name: name,status: status,description: description,pin_code: pin_code,
	          	address: address,place: place,contact_no: contact_no,email: email,contact_person: contact_person,status: status)
	        end
	      end#if code == nil
	    end#do
  	end

  	def self.open_spreadsheet(file)
    case File.extname(file.original_filename)
      when ".csv" then Roo::CSV.new(file.path, file_warning: :ignore)
      when ".xls" then Roo::Excel.new(file.path, file_warning: :ignore)
      when ".xlsx" then Roo::Excelx.new(file.path, file_warning: :ignore)
      else raise "Unknown file type: #{file.original_filename}"
    end
  end

end
