class EnquiriesController < ApplicationController
  before_action :set_enquiry, only: [:show, :edit, :update, :destroy]

  # GET /enquiries
  # GET /enquiries.json
  def index
    @enquiries = Enquiry.all.order.('enquiry_date desc' )
  end

  def branchwise_enquiry
    @branchwise_enquiries = Enquiry.where(user_id: current_user.id)
  end

  # GET /enquiries/1
  # GET /enquiries/1.json
  def show
  end

  # GET /enquiries/new
  def new
    @enquiry = Enquiry.new
  end

  # GET /enquiries/1/edit
  def edit
  end

  # POST /enquiries
  # POST /enquiries.json
  def create
    @enquiry = Enquiry.new(enquiry_params)

    respond_to do |format|
      if @enquiry.save
        format.html { redirect_to @enquiry, notice: 'Enquiry was successfully created.' }
        format.json { render :show, status: :created, location: @enquiry }
      else
        format.html { render :new }
        format.json { render json: @enquiry.errors, status: :unprocessable_entity }
      end
    end
  end

  def display_scheme
    vehicle_type_id = params[:enquiry][:vehicle_type_id]
    @schemes = Scheme.where(vehicle_type_id: vehicle_type_id)
    @enquiry = Enquiry.new
  end


  def show_enquiry
    @enquiry = Enquiry.find(params[:enquiry_id])
    #@enquiries = Enquiry.all
    respond_to do |f|
      f.js
      f.html
      f.pdf do
        render pdf: ' show_enquiry',
        layout: 'pdf.html',
        orientation: 'portrait',
        template: 'enquiries/show_enquiry.pdf.erb',
        show_as_html: params[:debug].present?
        #margin:  { top:1,bottom:1,left:1,right:1 }
      end
    end
  end

  # PATCH/PUT /enquiries/1
  # PATCH/PUT /enquiries/1.json
  def update
    respond_to do |format|
        user_id = enquiry_params["user_id"].to_i
      if @enquiry.update(enquiry_params)
        @enquiry.update(user_id: user_id)
        format.html { redirect_to @enquiry, notice: 'Enquiry was successfully updated.' }
        format.json { render :show, status: :ok, location: @enquiry }
      else
        format.html { render :edit }
        format.json { render json: @enquiry.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /enquiries/1
  # DELETE /enquiries/1.json
  def destroy
    @enquiry.destroy
    respond_to do |format|
      format.html { redirect_to enquiries_url, notice: 'Enquiry was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def datewise_report
  end

  def show_datewise_enquiry
    from = params[:salary][:from]
    to = params[:salary][:to]
    @enquiries = Enquiry.where(enquiry_date: from.to_date..to.to_date)
  end

  def datewise_enquiry_report
    from = params[:salary][:from]
    to = params[:salary][:to]
    @enquiries = Enquiry.where(enquiry_date: from.to_date..to.to_date)

    
    respond_to do |f|
      f.js
      f.xls {render template: 'enquiries/show_datewise_enquiry.xls.erb'}
      f.html
      f.pdf do
        render pdf: ' show_datewise_enquiry',
        layout: 'pdf.html',
        orientation: 'Landscape',
        template: 'enquiries/show_datewise_enquiry.pdf.erb',
        show_as_html: params[:debug].present?
        #margin:  { top:1,bottom:1,left:1,right:1 }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_enquiry
      @enquiry = Enquiry.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def enquiry_params
      params.require(:enquiry).permit(:status,:description,:scheme_id,:enquiry_date,:mobile_no, :name_first, :middle_name, :last_name, :email, :address, :place, :user_id)
    end
end
