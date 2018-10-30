class InwordsController < ApplicationController
  before_action :set_inword, only: [:show, :edit, :update, :destroy]

  # GET /inwords
  # GET /inwords.json
  def index
    @inwords = Inword.all
  end

  # GET /inwords/1
  # GET /inwords/1.json
  def show
  end

  # GET /inwords/new
  def new
    @inword = Inword.new
    @inwords = Inword.all
  end

  # GET /inwords/1/edit
  def edit
    @vehicle_booking_id = @inword.vehicle_booking_id
  end

  # POST /inwords
  # POST /inwords.json
  def create
    @inword = Inword.new(inword_params)
    @inwords = Inword.all

    #respond_to do |format|
      if @inword.save
        @inword = Inword.new
        @inwords = Inword.all
        #format.js { @flag = true }
        # format.html { redirect_to @inword, notice: 'Inword was successfully created.' }
        # format.json { render :show, status: :created, location: @inword }
      else
        flash.now[:alert] = "Inword Already Exist"
        # format.html { render :new }
        # format.json { render json: @inword.errors, status: :unprocessable_entity }
         #format.js { @flag = false }
      end
    #end
    redirect_to vehicle_bookings_path
  end

  # PATCH/PUT /inwords/1
  # PATCH/PUT /inwords/1.json
  def update
    @inword.update(inword_params)
    @inword = Inword.new
    @inwords = Inword.all
    redirect_to new_inword_path
  end

  # DELETE /inwords/1
  # DELETE /inwords/1.json
  def destroy
    @inword.destroy
    @inwords = Inword.all
    # respond_to do |format|
    #   format.html { redirect_to inwords_url, notice: 'Inword was successfully destroyed.' }
    #   format.json { head :no_content }
    # end
  end

  def create_inword
    @inword = Inword.new(inword_params)
    @inwords = Inword.all
    vehicle_booking_id = inword_params["vehicle_booking_id"]
  
    #respond_to do |format|
      if @inword.save
        @inwords = Inword.all
        @inword = Inword.new
      else
        flash.now[:alert] = 'Inword Already Exist.'
        
      end
    #end
    redirect_to new_inword_path
  end

  def show_inword_detail
    inword_id = params[:inword_id]
    @inword = Inword.find_by(id: inword_id)
  end

  def datewise_inword
  end

  def show_datewise_inword
    from = params[:salary][:from]
    to = params[:salary][:to]
    @inwords = Inword.where(date: from.to_date..to.to_date)
    
    respond_to do |f|
      f.js
      f.xls {render template: 'inwords/show_datewise_inword.xls.erb'}
      f.html
      f.pdf do
        render pdf: ' show_datewise_inword',
        layout: 'pdf.html',
        orientation: 'Landscape',
        template: 'inwords/show_datewise_inword.pdf.erb',
        show_as_html: params[:debug].present?
        #margin:  { top:1,bottom:1,left:1,right:1 }
      end
    end
  end

  def bookingwise_inword
  end

  def show_bookingwise_inword
    vehicle_booking_id = params[:salary][:vehicle_booking_id]
    @inwords = Inword.where(vehicle_booking_id: vehicle_booking_id)
    
    respond_to do |f|
      f.js
      f.xls {render template: 'inwords/show_bookingwise_inword.xls.erb'}
      f.html
      f.pdf do
        render pdf: ' show_bookingwise_inword',
        layout: 'pdf.html',
        orientation: 'Landscape',
        template: 'inwords/show_bookingwise_inword.pdf.erb',
        show_as_html: params[:debug].present?
        #margin:  { top:1,bottom:1,left:1,right:1 }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_inword
      @inword = Inword.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def inword_params
      params.require(:inword).permit(:date, :vehicle_booking_id, :payment_type, :amount, :receipt_no, :employee_id, :vendor_name, :contact_no)
    end
end
