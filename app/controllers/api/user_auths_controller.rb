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
    User.create(employee_id: @employee1.id,role: "Branch",password: "12345678",email: email)
    render :status=>200, :json=>{:status=> "Employee Created successfully!"}
  end

  def create_enquiry
    mobile_no = params[:mobile_no]
    name_first = params[:first_name]
    middle = params[:middle_name]
    if middle == "undefined"
      middle_name = " "
    else
      middle_name = middle
    end
    last_name = params[:last_name]
    email1 = params[:email]
    if email1 == "undefined"
      email = " "
    else
      email = email1
    end
    address = params[:address]
    place = params[:place]
    user_id = params[:user_id]
    date = params[:date]
    scheme_id = params[:scheme_id]
    description = params[:description]
    @enquiry = Enquiry.create(mobile_no: mobile_no, name_first: name_first, middle_name: middle_name, last_name: last_name,  email: email,address: address, place: place, user_id: user_id, enquiry_date: date, scheme_id: scheme_id, description: description, status: true)
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
    @scheme = Scheme.create(scheme_type: scheme_type, name: name, budget: budget, down_payment: down_payment, installment: installment, installment_amount: installment_amount, intrest: intrest, from_date: from_date)
    render :status=>200, :json=>{:status=> "Scheme Created successfully!"}
  end

  def enquiry_list
  	all_enquiry_list = Enquiry.all.order("id DESC")
    render :json => all_enquiry_list.present? ? all_enquiry_list.collect{|d| {:id => d.try(:id),:mobile_no => d.try(:mobile_no), :name_first => d.try(:name_first), :middle_name => d.try(:middle_name), :last_name => d.try(:last_name), :place => d.try(:place), :address => d.try(:address), :email => d.try(:email), :user_id => d.try(:user_id), :scheme_id => d.try(:scheme_id), :scheme_name => d.try(:scheme).try(:name), :enquiry_date => d.try(:enquiry_date), :description => d.try(:description), :employee_name => d.try(:user).try(:employee).try(:first_name) }} : []
  end

  def schemes_list
    all_schemes_list = Scheme.where(status: true).order("id DESC")
    render :json => all_schemes_list.present? ? all_schemes_list.collect{|d| {:id => d.try(:id),:scheme_type => d.try(:scheme_type), :name => d.try(:name), :budget => d.try(:budget), :down_payment => d.try(:down_payment), :installment => d.try(:installment), :installment_amount => d.try(:installment_amount), :intrest => d.try(:intrest), :from_date => d.try(:from_date), :to_date => d.try(:to_date), :status => d.try(:status), :vehicle_type => d.try(:vehicle_type).try(:name)}} : []
  end

  def employee_list
    all_employee_list = Employee.where(status: true)
    render :json => all_employee_list.present? ? all_employee_list.collect{|d| {:id => d.try(:id),:code => d.try(:code), :prefix => d.try(:prefix), :first_name => d.try(:first_name), :middle_name => d.try(:middle_name), :last_name => d.try(:last_name), :gender => d.try(:gender), :email => d.try(:email), :contact_no => d.try(:contact_no), :blood_group => d.try(:blood_group), :date_of_birth => d.try(:date_of_birth), :address => d.try(:address), :pin_code => d.try(:pin_code), :country => d.try(:country), :state => d.try(:state), :district => d.try(:district), :adhar_no => d.try(:adhar_no), :city => d.try(:city), :status => d.try(:status), :company => d.try(:company).try(:name), :branch => d.try(:branch).try(:name) }} : []
  end

  def enquiry_wise_schemes
    scheme_id = params[:scheme_id]
    scheme = Scheme.where(id: scheme_id)
    render :json => scheme.present? ? scheme.collect{|d| {:id => d.try(:id),:scheme_type => d.try(:scheme_type), :name => d.try(:name), :budget => d.try(:budget), :down_payment => d.try(:down_payment), :installment => d.try(:installment), :installment_amount => d.try(:installment_amount), :intrest => d.try(:intrest), :from_date => d.try(:from_date), :to_date => d.try(:to_date), :status => d.try(:status), :vehicle_type => d.try(:vehicle_type).try(:name), :description => d.try(:description) }} : []
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
    render :json => @financer_master.present? ? @financer_master.collect{|fm| {:id => fm.try(:id), :code => fm.try(:code), :name => fm.try(:name), :description => fm.try(:description), :pin_code => fm.try(:pin_code), :place => fm.try(:place), :address => fm.try(:address), :contact_no => fm.try(:contact_no), :email => fm.try(:email), :contact_person => fm.try(:contact_person), :status => fm.try(:status),:branch_id => fm.try(:branch_id), :branch => fm.try(:branch).try(:name)  }} : []
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
    branch_id = params[:branch_id]
    FinancerMaster.create(code: code, name: name, description: description, pin_code: pin_code, place: place, address: address, contact_no: contact_no, email: email, contact_person: contact_person, status: status, branch_id: branch_id)
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
    branch_id  = params[:branch_id]
    ShowroomMaster.create(code: code, name: name, description: description, pin_code: pin_code, place: place, address: address, contact_no: contact_no, email: email, contact_person: contact_person, status: status, branch_id: branch_id)
    render :status=>200, :json=>{:status=> "Showroom Master was successfully created."}
  end

  def all_showroom_master
    @showroom_master = ShowroomMaster.all
    render :json => @showroom_master.present? ? @showroom_master.collect{|fm| {:id => fm.try(:id), :code => fm.try(:code), :name => fm.try(:name), :description => fm.try(:description), :pin_code => fm.try(:pin_code), :place => fm.try(:place), :address => fm.try(:address), :contact_no => fm.try(:contact_no), :email => fm.try(:email), :contact_person => fm.try(:contact_person), :status => fm.try(:status), :branch => fm.try(:branch).try(:name), :branch_id => fm.try(:branch_id)  }} : []
  end

  def current_employee
    user_id = params[:employee_id]
    u = User.find(user_id)
    emp = u.employee_id
    d = Employee.find(emp)
    render :status=>200, :json=>{ :id => d.try(:id),:code => d.try(:code), :prefix => d.try(:prefix), :first_name => d.try(:first_name), :middle_name => d.try(:middle_name), :last_name => d.try(:last_name), :gender => d.try(:gender), :email => d.try(:email), :contact_no => d.try(:contact_no), :blood_group => d.try(:blood_group), :date_of_birth => d.try(:date_of_birth), :address => d.try(:address), :pin_code => d.try(:pin_code), :country => d.try(:country), :state => d.try(:state), :district => d.try(:district), :adhar_no => d.try(:adhar_no), :city => d.try(:city), :status => d.try(:status), :company => d.try(:company).try(:name), :branch => d.try(:branch).try(:name) }
  end

  def create_booking
    employee_id = params[:member_id]
    pan_card = params[:pan]
    adhar_card = params[:adhar]
    licence_no = params[:licence]
    light_bill = params[:light_bill]
    rent_aggrement = params[:rent_agr]
    bs = params[:bs]
    itr = params[:itr]
    native_light_bill = params[:native_light_bill]
    guarantor_pan = params[:pan_guarantor]
    guarantor_adhar = params[:adhar_guarantor]
    guarantor_light_bill = params[:light_bill_guarantor]
    garantor_rent_aggrement = params[:rent_agr_guarantor]
    guarantor_BS = params[:bs_guarantor]
    guarantor_ITR = params[:guarantor_unit]
    guarantor1_pancard = params[:pan_guarantor1]
    guarantor1_adharcard = params[:adhar_guarantor1]
    guarantor1_lightbill = params[:light_bill_guarantor1]
    guarantor1_rent_aggrement = params[:rent_agr_guarantor1]
    guarantor1_BS = params[:bs_guarantor1]
    guarantor1_ITR = params[:guarantor1_unit]
    status = params[:status]
    enquiry = params[:enquiry_id]
    date = params[:date]
    agent_id = params[:agent_id]
    executive_id = params[:executive_id]
    @vehicle_booking = VehicleBooking.new(user_id: employee_id, pan: pan_card, adhar: adhar_card, licence: licence_no, light_bill: light_bill,
      rent_agr: rent_aggrement, bs: bs, itr: itr, native_light_bill: native_light_bill, pan_guarantor: guarantor_pan, 
      adhar_guarantor: guarantor_adhar, light_bill_guarantor: guarantor_light_bill, rent_agr_guarantor: garantor_rent_aggrement,
      bs_guarantor: guarantor_BS, itr_guarantor: guarantor_ITR, pan_guarantor1: guarantor1_pancard, adhar_guarantor1: guarantor1_adharcard,
      light_bill_guarantor1: guarantor1_lightbill, rent_agr_guarantor1: guarantor1_rent_aggrement, bs_guarantor1: guarantor1_BS, 
      itr_guarantor1: guarantor1_ITR, status: status, enquiry_id: enquiry, date: date, executive_id: executive_id,agent_id: agent_id)
   
    if @vehicle_booking.save
      enquiry = Enquiry.find_by(id: @vehicle_booking.enquiry_id)
      enquiry.update(status: 'Booked')
      @document_masters = DocumentMaster.where(status: true)
      @document_masters.each do |doc|
        DocumentList.create(document_master_id: doc.id,vehicle_booking_id: @vehicle_booking.id,status: false)
      end
      render :status=>200, :json=>{:status=> "Vehicle booking was successfully created."}
    else
      render :status=>200, :json=>{:status=> "Booking Already Exist"}
    end
  end

  def vehicle_booking_list
    employee = params[:member_id]
    from_date = params[:fromdate]
    to_date = params[:todate]
    booking = VehicleBooking.where(date: from_date.to_date..to_date.to_date)
    render :json => booking.present? ? booking.collect{|d|
      created_by = Employee.find_by(id: d.user_id)
      pre = created_by.try(:prefix)
      fnm = created_by.try(:first_name)
      lnm = created_by.try(:last_name)
      {:id => d.try(:id), :pan => d.try(:pan), :adhar => d.try(:adhar), :licence => d.try(:licence),
      :light_bill => d.try(:light_bill), :rent_agr => d.try(:rent_agr), :bs => d.try(:bs), :itr => d.try(:itr), :native_light_bill => d.try(:native_light_bill),
      :pan_guarantor => d.try(:pan_guarantor), :adhar_guarantor => d.try(:adhar_guarantor), :light_bill_guarantor => d.try(:light_bill_guarantor),
      :rent_agr_guarantor => d.try(:rent_agr_guarantor), :bs_guarantor => d.try(:bs_guarantor), :itr_guarantor => d.try(:itr_guarantor), 
      :pan_guarantor1 => d.try(:pan_guarantor1), :adhar_guarantor1 => d.try(:adhar_guarantor1), :light_bill_guarantor1 => d.try(:light_bill_guarantor1), 
      :rent_agr_guarantor1 => d.try(:rent_agr_guarantor1), :bs_guarantor1 => d.try(:bs_guarantor1), :itr_guarantor1 => d.try(:itr_guarantor1),
      :status => d.try(:status), :enquiry_id => d.try(:enquiry).try(:name_first), :vehicle_type_id => d.try(:vehicle_type).try(:name), :phone_number => d.try(:enquiry).try(:mobile_no), :date => d.try(:date), :enquiry_pre => d.try(:enquiry).try(:user).try(:employee).try(:prefix), :enquiry_fnm => d.try(:enquiry).try(:user).try(:employee).try(:first_name), :enquiry_mnm => d.try(:enquiry).try(:user).try(:employee).try(:middle_name), :enquiry_lnm => d.try(:enquiry).try(:user).try(:employee).try(:last_name), 
      :executive_pre => d.try(:executive).try(:prefix), :executive_fnm => d.try(:executive).try(:first_name), :executive_lnm => d.try(:executive).try(:last_name), :agent_fnm => d.try(:agent).try(:first_name), :agent_mnm => d.try(:agent).try(:middel_name), :agent_lnm => d.try(:agent).try(:last_name), :created_by_pre => pre, :created_by_fnm => fnm, :created_by_lnm => lnm }} : []
  end

  def enquiry_type
    @booking = VehicleBooking.all.pluck(:enquiry_id)
    all_enquiry = Enquiry.where.not(id: @booking)
    render :json => all_enquiry.present? ? all_enquiry.collect{|d| {:id => d.try(:id), :mobile_no => d.try(:mobile_no), :name_first => d.try(:name_first) }} : []
  end

  def particular_enquiry_list
    employee = params[:member_id]
    all_enquiry_list = Enquiry.where(user_id: employee).order("id DESC")
    render :json => all_enquiry_list.present? ? all_enquiry_list.collect{|d| {:id => d.try(:id),:mobile_no => d.try(:mobile_no), :name_first => d.try(:name_first), :middle_name => d.try(:middle_name), :last_name => d.try(:last_name), :place => d.try(:place), :address => d.try(:address), :email => d.try(:email), :user_id => d.try(:user_id), :scheme_id => d.try(:scheme_id), :scheme_name => d.try(:scheme).try(:name), :enquiry_date => d.try(:enquiry_date), :description => d.try(:description), :employee_name => d.try(:user).try(:employee).try(:first_name) }} : []
  end

  def particular_vehicle_booking_list
    employee = params[:member_id]
    from_date = params[:fromdate]
    to_date = params[:todate]
    booking = VehicleBooking.where(user_id: employee, date: from_date.to_date..to_date.to_date)
    render :json => booking.present? ? booking.collect{|d|
      created_by = Employee.find_by(id: d.user_id)
      pre = created_by.try(:prefix)
      fnm = created_by.try(:first_name)
      lnm = created_by.try(:last_name)
      {:id => d.try(:id), :pan => d.try(:pan), :adhar => d.try(:adhar), :licence => d.try(:licence),
      :light_bill => d.try(:light_bill), :rent_agr => d.try(:rent_agr), :bs => d.try(:bs), :itr => d.try(:itr), :native_light_bill => d.try(:native_light_bill),
      :pan_guarantor => d.try(:pan_guarantor), :adhar_guarantor => d.try(:adhar_guarantor), :light_bill_guarantor => d.try(:light_bill_guarantor),
      :rent_agr_guarantor => d.try(:rent_agr_guarantor), :bs_guarantor => d.try(:bs_guarantor), :itr_guarantor => d.try(:itr_guarantor), 
      :pan_guarantor1 => d.try(:pan_guarantor1), :adhar_guarantor1 => d.try(:adhar_guarantor1), :light_bill_guarantor1 => d.try(:light_bill_guarantor1), 
      :rent_agr_guarantor1 => d.try(:rent_agr_guarantor1), :bs_guarantor1 => d.try(:bs_guarantor1), :itr_guarantor1 => d.try(:itr_guarantor1),
      :status => d.try(:status), :enquiry_id => d.try(:enquiry).try(:name_first), :vehicle_type_id => d.try(:vehicle_type).try(:name), :phone_number => d.try(:enquiry).try(:mobile_no), :date => d.try(:date), :enquiry_pre => d.try(:enquiry).try(:user).try(:employee).try(:prefix), :enquiry_fnm => d.try(:enquiry).try(:user).try(:employee).try(:first_name), :enquiry_mnm => d.try(:enquiry).try(:user).try(:employee).try(:middle_name), :enquiry_lnm => d.try(:enquiry).try(:user).try(:employee).try(:last_name), 
      :executive_pre => d.try(:executive).try(:prefix), :executive_fnm => d.try(:executive).try(:first_name), :executive_lnm => d.try(:executive).try(:last_name), :agent_fnm => d.try(:agent).try(:first_name), :agent_mnm => d.try(:agent).try(:middel_name), :agent_lnm => d.try(:agent).try(:last_name), :created_by_pre => pre, :created_by_fnm => fnm, :created_by_lnm => lnm }} : []
  end

  def date_wise_schemes_list
    from_date = params[:fromdate]
    to_date = params[:todate]    
    all_schemes_list = Scheme.where(status: true).where("? BETWEEN from_date AND to_date", to_date).order("id DESC")
    render :json => all_schemes_list.present? ? all_schemes_list.collect{|d| {:id => d.try(:id),:scheme_type => d.try(:scheme_type), :name => d.try(:name), :budget => d.try(:budget), :down_payment => d.try(:down_payment), :installment => d.try(:installment), :installment_amount => d.try(:installment_amount), :intrest => d.try(:intrest), :from_date => d.try(:from_date), :to_date => d.try(:to_date), :status => d.try(:status), :vehicle_type => d.try(:vehicle_type).try(:name)}} : []
  end

  def agent_list
    @agent = Agent.all
    render :json => @agent.present? ? @agent.collect{|a| {:id => a.try(:id), :first_name => a.try(:first_name), :middel_name => a.try(:middel_name), :last_name => a.try(:last_name), :mobile_number => a.try(:mobile_number), :status => a.try(:status) }} : []
  end

  def create_agent
    fname = params[:first_name]
    mname = params[:middel_name]
    lname = params[:last_name]
    mobile_number = params[:mobile_number]
    status = params[:status]
    @agent = Agent.create(first_name: fname, middel_name: mname, last_name: lname, mobile_number: mobile_number, status: status)
    render :status=>200, :json=>{:status=> "Agent Created successfully!"}
  end

  def destroy_agent 
    agent_id = params[:agent_id]
    @agent = Agent.find(agent_id)
    @agent.destroy
    render :status=>200, :json=>{:status=> "Agent Successfully Destroy"}    
  end

  def destroy_financer 
    financer_id = params[:financer_id]
    @financer = FinancerMaster.find(financer_id)
    @financer.destroy
    render :status=>200, :json=>{:status=> "Financer Successfully Destroy"}    
  end

  def destroy_showroom
    showroom_id = params[:showroom_id]
    @showroom = ShowroomMaster.find(showroom_id)
    @showroom.destroy
    render :status=>200, :json=>{:status=> "Showroom Master Successfully Destroy"}
  end

  def destroy_schemes
    scheme_id = params[:scheme_id]
    scheme = Scheme.find(scheme_id)
    scheme.destroy
    # scheme = Enquiry.where(scheme_id: scheme_id).present?
    render :status=>200, :json=>{:status => "Scheme Successfully Destroy" }    
  end

  def destroy_vehicle
    vehicle_id = params[:vehicle_id]
    vehicale = VehicleType.find(vehicle_id)
    vehicale.destroy
    render :status=>200, :json=>{:status=> "Vehicle Successfully Destroy"}
  end

  def destroy_document
    document_id = params[:document_id]
    document = DocumentMaster.find(document_id)
    document.destroy
    render :status=>200, :json=>{:status=> "Document Master Successfully Destroy"}
  end

  def particular_date_wise_schemes_list
    employee_id = params[:employee_id]
    from_date = params[:fromdate]
    to_date = params[:todate]
    employee = Employee.find(employee_id)
    @schemes = Scheme.where(branch_id: employee.branch_id, from_date: from_date..to_date)
    render :json => @schemes.present? ? @schemes.collect{|d| {:id => d.try(:id),:scheme_type => d.try(:scheme_type), :name => d.try(:name), :budget => d.try(:budget), :down_payment => d.try(:down_payment), :installment => d.try(:installment), :installment_amount => d.try(:installment_amount), :intrest => d.try(:intrest), :from_date => d.try(:from_date), :to_date => d.try(:to_date), :status => d.try(:status), :vehicle_type => d.try(:vehicle_type).try(:name)}} : []
  end
end