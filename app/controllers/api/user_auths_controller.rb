class Api::UserAuthsController < ApplicationController

    skip_before_action :load_action
    skip_before_action :authenticate!
    skip_before_filter :require_login
  include ActionController::MimeResponds
  include ActionController::Cookies
  include ActionView::Helpers::DateHelper
  include ApplicationHelper
  # http_basic_authenticate_with :email => "vish.hake04@gmail.com", :password => "12345678"

   skip_before_filter :authenticate_user!
   skip_before_filter :verify_authenticity_token, :if => Proc.new { |c| c.request.format == 'application/json' }

  respond_to :json

  def user_sign_in
    if request.format != :json
      render :status=>406, :json=>{:status=>"Failure",:message=>"The request must be json"}
      return
    end
    email = params[:email]
    password = params[:password]
    if email.nil? or password.nil?
      render :status=>400,:json=>{:status=>"Failure",:message=>"The request must contain the email and password."}
      return
    end
    @user = User.find_by_email(email.downcase) 
    if @user.nil?
      logger.info("User #{email} failed signin, user cannot be found.")
      render :status=>401, :json=>{:status=>"Failure",:message=>"Invalid email"}
      return
    end
    if not @user.valid_password?(password)
      logger.info("User #{email} failed signin, password \"#{password}\" is invalid")
      render :status=>401, :json=>{:status=>"Failure",:message=>"Invalid password."}
    else
      render :status=>200, :json=>{ :member_id => @user.id, :role => @user.role, :gender => @user.try(:employee).try(:gender)}
    end
  end

  def company_profile
  	all_company_type = Company.all
    render :json => all_company_type.present? ? all_company_type.collect{|d| {:id => d.try(:id),:code => d.try(:code), :name => d.try(:name), :address => d.try(:address), :country => d.try(:country), :state => d.try(:state), :district => d.try(:district), :city => d.try(:city), :pin_code => d.try(:pin_code), :email => d.try(:email), :contact_no => d.try(:contact_no), :status => d.try(:status)}} : []
  end

  def branch_list
  	all_branch_list = Branch.all
    render :json => all_branch_list.present? ? all_branch_list.collect{|d| {:id => d.try(:id),:code => d.try(:code), :name => d.try(:name), :address => d.try(:address), :email => d.try(:email), :contact_no => d.try(:contact_no), :status => d.try(:status), :company => d.try(:company).try(:name)}} : []
  end

  def create_employee1
    code = params[:code]
    prefix = params[:prefix]
    first_name = params[:first_name]
    middle_name = params[:middle_name]
    last_name = params[:last_name]
    gender = params[:gender]
    email = params[:email]
    contact_no = params[:contact_no]
    blood_group = params[:blood_group]
    date_of_birth = params[:date_of_birth]
    address = params[:address]
    pin_code = params[:pin_code]
    country = params[:county]
    state = params[:state]
    district = params[:district]
    city= params[:city]
    adhar_no = params[:adhar_no]
    status = params[:status]
    company_id = params[:company_id]
    branch_id = params[:branch_id]
    @employee1 = Employee.create(code: code,prefix: prefix, first_name: first_name, middle_name: middle_name, last_name: last_name, gender: gender, email: email,
     contact_no: contact_no,blood_group: blood_group,date_of_birth: date_of_birth, address: address, pin_code: pin_code, country: country,state: state,
     district: district, city: city,adhar_no: adhar_no,status: status, company_id: company_id, branch_id: branch_id)
    render :status=>200, :json=>{:status=> "Employee Created successfully!"}
  end

  def create_enquiry
    mobile_no = params[:mobile_no]
    name_first = params[:first_name]
    middle_name = params[:middle_name]
    last_name = params[:last_name]
    email = params[:email]
    address = params[:address]
    place = params[:place]
    user_id = params[:user_id]
    @enquiry = Enquiry.create(mobile_no: mobile_no, name_first: name_first, middle_name: middle_name, last_name: last_name, email: email,address: address, place: place, user_id: user_id)
  	  render :status=>200, :json=>{:status=> "Enquiry Created successfully!"}
  end

   def create_scheme
    scheme_type = params[:scheme_type]
    name = params[:name]
    budget = params[:budget]
    down_payment = params[:down_payment]
    installment = params[:installment]
    installment_amount = params[:installment_amount]
    intrest = params[:intrest]
    from_date = params[:from_date]
    to_date = params[:to_date]
    status = params[:status]
    @scheme = Scheme.create(scheme_type: scheme_type, name: name, budget: budget, down_payment: down_payment, installment: installment,
          installment_amount: installment_amount, intrest: intrest, from_date: from_date)
      render :status=>200, :json=>{:status=> "Scheme Created successfully!"}
  end

  def enquiry_list
  	all_enquiry_list = Enquiry.all
    render :json => all_enquiry_list.present? ? all_enquiry_list.collect{|d| {:id => d.try(:id),:mobile_no => d.try(:mobile_no), :name_first => d.try(:name_first), :middle_name => d.try(:middle_name), :last_name => d.try(:last_name), :place => d.try(:place), :address => d.try(:address), :email => d.try(:email), :user_id => d.try(:user_id), :scheme_id => d.try(:scheme_id), :scheme_name => d.try(:scheme).try(:name), :enquiry_date => d.try(:enquiry_date), :description => d.try(:description) }} : []
  end

  def schemes_list
    all_schemes_list = Scheme.where(status: true)
    render :json => all_schemes_list.present? ? all_schemes_list.collect{|d| {:id => d.try(:id),:scheme_type => d.try(:scheme_type), :name => d.try(:name), :budget => d.try(:budget), :down_payment => d.try(:down_payment), :installment => d.try(:installment), :installment_amount => d.try(:installment_amount), :intrest => d.try(:intrest), :from_date => d.try(:from_date), :to_date => d.try(:to_date), :status => d.try(:status)}} : []
  end

  def employee_list
    all_employee_list = Employee.where(status: true)
    render :json => all_employee_list.present? ? all_employee_list.collect{|d| {:id => d.try(:id),:code => d.try(:code), :prefix => d.try(:prefix), :first_name => d.try(:first_name), :middle_name => d.try(:middle_name), :last_name => d.try(:last_name), :gender => d.try(:gender), :email => d.try(:email), :contact_no => d.try(:contact_no), :blood_group => d.try(:blood_group), :date_of_birth => d.try(:date_of_birth), :address => d.try(:address), :pin_code => d.try(:pin_code), :country => d.try(:country), :state => d.try(:state), :district => d.try(:district), :adhar_no => d.try(:adhar_no), :city => d.try(:city), :status => d.try(:status), :company => d.try(:company).try(:name), :branch => d.try(:branch).try(:name) }} : []
  end

  def enquiry_wise_schemes
    scheme_id = params[:scheme_id]
    scheme = Scheme.where(scheme_id)
    render :json => scheme.present? ? scheme.collect{|d| {:id => d.try(:id),:scheme_type => d.try(:scheme_type), :name => d.try(:name), :budget => d.try(:budget), :down_payment => d.try(:down_payment), :installment => d.try(:installment), :installment_amount => d.try(:installment_amount), :intrest => d.try(:intrest), :from_date => d.try(:from_date), :to_date => d.try(:to_date), :status => d.try(:status)}} : []
  end

  def all_vehical_type
    all_vehicle_type = VehicleType.where(status: true)
    render :json => all_vehicle_type.present? ? all_vehicle_type.collect{|vt| {:id => vt.try(:id), :code => vt.try(:code), :name => vt.try(:name), :description => vt.try(:description), :status => vt.try(:status) }} : []
  end

  def create_branch
    code = params[:branch_code]
    name = params[:name]
    address = params[:address]
    email = params[:email]
    contact_no = params[:contact_no]
    status = params[:status]
    company = params[:company_id]
    Branch.create(code: code, name: name, address: address, email: email, contact_no: contact_no, status: status, company_id: company)
    render :status=>200, :json=>{:status=> "Branch was successfully created"}
  end

  def create_vehicle
    code = params[:code]
    name = params[:name]
    description = params[:description]
    status = params[:status]
    VehicleType.create(code: code, name: name, description: description, status: status)
    render :status=>200, :json=>{:status=> "Vehicle type was successfully created."}
  end

  def create_document_list
    employee_id = params[:employee_id]
    document_master_id = params[:document_master_id]
    vehicle_booking_id = params[:vehicle_booking_id]
    status = params[:status]
    DocumentList.create(employee_id: employee_id, document_master_id: document_master_id, vehicle_booking_id: vehicle_booking_id, status: status)
    render :status=>200, :json=>{:status=> "Document list was successfully created."}
  end

  def all_document_list
    @document_list = DocumentList.all
    render :json => @document_list.present? ? @document_list.collect{|dl| { :id => dl.try(:id), :employee_id => dl.try(:employee_id), prefix: dl.try(:employee).try(:prefix), first_name: dl.try(:employee).try(:first_name), middle_name: dl.try(:employee).try(:middle_name), last_name: dl.try(:employee).try(:last_name), :document_master_id => dl.try(:document_master).try(:name), :vehicle_booking_id => dl.try(:vehicle_booking_id), :status => dl.try(:status)  }} : []
  end

  def create_document_master
    code = params[:code]
    name = params[:name]
    description = params[:description]
    status = params[:status]
    DocumentMaster.create(code: code, name: name, description: description, status: status)
    render :status=>200, :json=>{:status=> "Document Master was successfully created."}
  end

  def all_document_master
    document_master = DocumentMaster.all
    render :json => document_master.present? ? document_master.collect{|vt| {:id => vt.try(:id), :code => vt.try(:code), :name => vt.try(:name), :description => vt.try(:description), :status => vt.try(:status) }} : []
  end

  def all_financer_master
    @financer_master = FinancerMaster.all
    render :json => @financer_master.present? ? @financer_master.collect{|fm| {:id => fm.try(:id), :code => fm.try(:code), :name => fm.try(:name), :description => fm.try(:description), :pin_code => fm.try(:pin_code), :place => fm.try(:place), :address => fm.try(:address), :contact_no => fm.try(:contact_no), :email => fm.try(:email), :contact_person => fm.try(:contact_person), :status => fm.try(:status) }} : []
  end

  def create_financer_master
    code = params[:code]
    name = params[:name]
    description = params[:description]
    pin_code = params[:pin_code]
    place = params[:place]
    address = params[:address]
    contact_no = params[:contact_no]
    email = params[:email]
    contact_person = params[:contact_person]
    status = params[:status]
    FinancerMaster.create(code: code, name: name, description: description, pin_code: pin_code, place: place, address: address, contact_no: contact_no, email: email, contact_person: contact_person, status: status)
    render :status=>200, :json=>{:status=> "Financer Master was successfully created."}
  end

  def create_showroom_master
    code = params[:code]
    name = params[:name]
    description = params[:description]
    pin_code = params[:pin_code]
    place = params[:place]
    address = params[:address]
    contact_no = params[:contact_no]
    email = params[:email]
    contact_person = params[:contact_person]
    status = params[:status]
    ShowroomMaster.create(code: code, name: name, description: description, pin_code: pin_code, place: place, address: address, contact_no: contact_no, email: email, contact_person: contact_person, status: status)
    render :status=>200, :json=>{:status=> "Showroom Master was successfully created."}
  end

  def all_showroom_master
    @showroom_master = ShowroomMaster.all
    render :json => @showroom_master.present? ? @showroom_master.collect{|fm| {:id => fm.try(:id), :code => fm.try(:code), :name => fm.try(:name), :description => fm.try(:description), :pin_code => fm.try(:pin_code), :place => fm.try(:place), :address => fm.try(:address), :contact_no => fm.try(:contact_no), :email => fm.try(:email), :contact_person => fm.try(:contact_person), :status => fm.try(:status) }} : []
  end

  def current_employee
    employee_id = params[:employee_id]
    employee = Employee.where(id: employee_id)
    render :json => employee.present? ? employee.collect{|d| {:id => d.try(:id),:code => d.try(:code), :prefix => d.try(:prefix), :first_name => d.try(:first_name), :middle_name => d.try(:middle_name), :last_name => d.try(:last_name), :gender => d.try(:gender), :email => d.try(:email), :contact_no => d.try(:contact_no), :blood_group => d.try(:blood_group), :date_of_birth => d.try(:date_of_birth), :address => d.try(:address), :pin_code => d.try(:pin_code), :country => d.try(:country), :state => d.try(:state), :district => d.try(:district), :adhar_no => d.try(:adhar_no), :city => d.try(:city), :status => d.try(:status), :company => d.try(:company).try(:name), :branch => d.try(:branch).try(:name) }} : []
  end

  def create_booking
    employee_id = params[:employee_id]
    pan_card = params[:pan_card]
    adhar_card = params[:adhar_card]
    licence_no = params[:licence_no]
    light_bill = params[:light_bill]
    rent_aggrement = params[:rent_aggrement]
    bs = params[:bs]
    itr = params[:itr]
    native_light_bill = params[:native_light_bill]
    guarantor_pan = params[:guarantor_pan]
    guarantor_adhar = params[:guarantor_adhar]
    guarantor_light_bill = params[:guarantor_light_bill]
    garantor_rent_aggrement = params[:garantor_rent_aggrement]
    guarantor_BS = params[:guarantor_BS]
    guarantor_ITR = params[:guarantor_ITR]
    guarantor1_pancard = params[:guarantor1_pancard]
    guarantor1_adharcard = params[:guarantor1_adharcard]
    guarantor1_lightbill = params[:guarantor1_lightbill]
    guarantor1_rent_aggrement = params[:guarantor1_rent_aggrement]
    guarantor1_BS = params[:guarantor1_BS]
    guarantor1_ITR = params[:guarantor1_ITR]
    status = params[:status]
    enquiry = enquiry[:enquiry_id]
    @vehicle_booking = VehicleBooking.create(pan: pan_card, adhar: adhar_card, licence: licence_no, light_bill: light_bill, rent_agr: rent_aggrement, bs: bs, itr: itr, native_light_bill: native_light_bill, pan_guarantor: guarantor_pan, adhar_guarantor: guarantor_adhar, light_bill_guarantor: guarantor1_lightbill, rent_agr_guarantor: garantor_rent_aggrement, bs_guarantor: guarantor_BS, itr_guarantor: guarantor_ITR, pan_guarantor1: guarantor1_pancard, adhar_guarantor1: guarantor1_adharcard, light_bill_guarantor1: guarantor1_lightbill, rent_agr_guarantor1: guarantor1_rent_aggrement, bs_guarantor1: guarantor1_BS, itr_guarantor1: guarantor1_ITR, status: status, enquiry_id: enquiry)
    render :status=>200, :json=>{:status=> "Vehicle booking was successfully created."}
  end

  def enquiry_type
    @booking = VehicleBooking.all.pluck(:enquiry_id)
    all_enquiry = Enquiry.where.not(id: @booking)
    render :json => all_enquiry.present? ? all_enquiry.collect{|e| {:id => d.try(:id), :mobile_no => d.try(:mobile_no), :name_first => d.try(:name_first) }} : []
  end
end

