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

  	def self.import(file)
  		spreadsheet = open_spreadsheet(file)
	   	(2..spreadsheet.last_row).each do |i| 

	    	vehicle_type = spreadsheet.cell(i,'B')
	    	scheme_name = spreadsheet.cell(i,'C')

	    	if vehicle_type == nil || scheme_name == nil
	      else
		    	@vehicle_type = VehicleType.find_by(name: vehicle_type)
		    	if @vehicle_type.nil?
		    	  create_new = VehicleType.create(name: vehicle_type,status: true)
		    	  new_type = create_new.id
		    	else
		    		new_type = @vehicle_type.id
		    	end

		     
		        budget = spreadsheet.cell(i,'D')
		        down_payment = spreadsheet.cell(i,'E')
		        emi = spreadsheet.cell(i,'F')
		        interest = spreadsheet.cell(i,'G')
		        emi_amount = spreadsheet.cell(i,'H')
		        total_amount = spreadsheet.cell(i,'I')
		        interest_amount = spreadsheet.cell(i,'J')
		        installment_amount = spreadsheet.cell(i,'K')
		        from_date = spreadsheet.cell(i,'L')
		        to_date = spreadsheet.cell(i,'M')
		        @status = spreadsheet.cell(i,'N')
		        description = spreadsheet.cell(i,'O')
		        if @status == "Active"
		        	status = true
		        else
		    			status = false
		    		end 
byebug
		        @scheme = Scheme.find_by(name: scheme_name)
		        if @scheme.nil?
		        	Scheme.create(vehicle_type_id: new_type,name: scheme_name,budget: budget,down_payment: down_payment,installment: emi,intrest: interest,emi_amount: emi_amount,
		        		total_amount: total_amount,installment_amount: installment_amount,from_date: from_date,to_date: to_date,status: status,
		        		description: description)     
		        else
		          @scheme.update(vehicle_type_id: new_type,name: scheme_name,budget: budget,down_payment: down_payment,installment: emi,intrest: interest,emi_amount: emi_amount,
		          	total_amount: total_amount,installment_amount: installment_amount,from_date: from_date,to_date: to_date,status: status,
		          	description: description)
		        end#@scheme.nil?
		    end#if vehicle_type.nil?
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
