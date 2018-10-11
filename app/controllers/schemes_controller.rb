class SchemesController < ApplicationController
  before_action :set_scheme, only: [:show, :edit, :update, :destroy]

  # GET /schemes
  # GET /schemes.json
  def index
    if current_user.role == "Branch"
      employee = Employee.find_by(id: current_user.employee_id)
      @schemes = Scheme.where(branch_id: employee.branch_id)
    else
      @schemes = Scheme.all
    end
  end

  # GET /schemes/1
  # GET /schemes/1.json
  def show
  end

  # GET /schemes/new
  def new
    @scheme = Scheme.new
  end

  # GET /schemes/1/edit
  def edit
  end

  # POST /schemes
  # POST /schemes.json
  def create
    @scheme = Scheme.new(scheme_params)

    respond_to do |format|
      if @scheme.save
        format.html { redirect_to @scheme, notice: 'Scheme was successfully created.' }
        format.json { render :show, status: :created, location: @scheme }
      else
        format.html { render :new }
        format.json { render json: @scheme.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /schemes/1
  # PATCH/PUT /schemes/1.json
  def update
    respond_to do |format|
      if @scheme.update(scheme_params)
        format.html { redirect_to @scheme, notice: 'Scheme was successfully updated.' }
        format.json { render :show, status: :ok, location: @scheme }
      else
        format.html { render :edit }
        format.json { render json: @scheme.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /schemes/1
  # DELETE /schemes/1.json
  def destroy
    if Enquiry.exists?(scheme_id: @scheme.id)
      flash[:alert] = "Can not delete this Scheme,Its used in Enquiry"
    else
      @scheme.destroy
      flash[:notice] = 'Scheme was successfully destroyed'
    end
      respond_to do |format|
        format.html { redirect_to schemes_url }
        format.json { head :no_content }
      end
  end

  def scheme_detail
    @schemes = Scheme.all
    respond_to do |f|
      f.js
      f.xls {render template: 'schemes/scheme_detail.xls.erb'}
      f.html
      f.pdf do
        render pdf: ' scheme_detail',
        layout: 'pdf.html',
        orientation: 'Landscape',
        template: 'schemes/scheme_detail.pdf.erb',
        show_as_html: params[:debug].present?
        #margin:  { top:1,bottom:1,left:1,right:1 }
      end
    end
  end

  def import
    file = params[:file]
    if file.nil?
      flash[:alert] = "Please Select File!"
      redirect_to import_xl_schemes_path
    else
      Scheme.import(params[:file])
      redirect_to schemes_path, notice: "File imported."
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_scheme
      @scheme = Scheme.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def scheme_params
      params.require(:scheme).permit(:branch_id,:image2,:image3,:image4,:image5,:vehicle_type_id,:emi_amount,:total_amount,:interest,:avatar, :image1, :description,:scheme_type, :name, :budget, :down_payment, :installment_amount, :installment, :intrest, :from_date, :to_date, :status)
    end
end