class EmployeesController < ApplicationController
  before_action :set_employee, only: [:show, :edit, :update, :destroy]

  # GET /employees
  # GET /employees.json
  def index
    @employees = Employee.all
  end

  # GET /employees/1
  # GET /employees/1.json
  def show
  end

  # GET /employees/new
  def new
    @employee = Employee.new
  end

  # GET /employees/1/edit
  def edit
  end

  # POST /employees
  # POST /employees.json
  def create
    @employee = Employee.new(employee_params)

    respond_to do |format|
      if @employee.save
        format.html { redirect_to @employee, notice: 'Employee was successfully created.' }
        format.json { render :show, status: :created, location: @employee }
        User.create(employee_id: @employee.id,role: "Branch",password: "12345678",email: @employee.email)
      else
        format.html { render :new }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /employees/1
  # PATCH/PUT /employees/1.json
  def update
    respond_to do |format|
      if @employee.update(employee_params)
        format.html { redirect_to @employee, notice: 'Employee was successfully updated.' }
        format.json { render :show, status: :ok, location: @employee }
      else
        format.html { render :edit }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /employees/1
  # DELETE /employees/1.json
  def destroy
    @employee.destroy
    respond_to do |format|
      format.html { redirect_to employees_url, notice: 'Employee was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def assign_role
      @employees = Employee.joins('LEFT JOIN users on users.employee_id = employees.id where users.employee_id is null')
    
  end

  def submit_form
    employee_id = params[:login][:employee_id]
    role_id = params[:role_id]
    employee = Employee.find_by(id: employee_id)
    #employee = Employee.find(params['login']['employee_id'])
    User.create(contact_no: employee.contact_no,email: employee.email,password: "12345678",role_id: role_id,employee_id: employee_id)
    flash[:notice] = "Role assigned successfully!"
    redirect_to assign_role_employees_path
  end#def

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_employee
      @employee = Employee.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def employee_params
      params.require(:employee).permit(:company_id,:branch_id,:code, :prefix, :first_name, :middle_name, :last_name, :date_of_birth, :gender, :contact_no, :email, :blood_group, :address, :country, :state, :district, :city, :pin_code, :adhar_no, :status)
    end
end
