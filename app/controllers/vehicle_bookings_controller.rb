class VehicleBookingsController < ApplicationController
  before_action :set_vehicle_booking, only: [:show, :edit, :update, :destroy]

  # GET /vehicle_bookings
  # GET /vehicle_bookings.json
  def index
    @vehicle_bookings = VehicleBooking.all
  end

  def branchwise_booking
    enquiry = Enquiry.where(user_id: current_user.id).pluck(:id)
    @branchwise_bookings = VehicleBooking.where(enquiry_id: enquiry)
  end
  # GET /vehicle_bookings/1
  # GET /vehicle_bookings/1.json
  def show
   @vehicle_booking
  end

  # GET /vehicle_bookings/new
  def new
    @vehicle_booking = VehicleBooking.new
  end

  # GET /vehicle_bookings/1/edit
  def edit
    @vehicle_booking = VehicleBooking.find(params[:id])
  end

  # POST /vehicle_bookings
  # POST /vehicle_bookings.json
  def create
    @vehicle_booking = VehicleBooking.new(vehicle_booking_params)

    respond_to do |format|
      if @vehicle_booking.save
        enquiry = Enquiry.find_by(id: @vehicle_booking.enquiry_id)
        enquiry.update(status: 'Booked')
        format.html { redirect_to @vehicle_booking, notice: 'Vehicle booking was successfully created.' }
        format.json { render :show, status: :created, location: @vehicle_booking }
        @document_masters = DocumentMaster.where(status: true)
        @document_masters.each do |doc|
          DocumentList.create(document_master_id: doc.id,vehicle_booking_id: @vehicle_booking.id,status: false)
        end
      else
        format.html { render :new }
        format.json { render json: @vehicle_booking.errors, status: :unprocessable_entity }
      end
    end
  end

  def ajax_document_list
    @vehicle_booking_id = params[:id]
    @document_lists = DocumentList.where(vehicle_booking_id: params[:id])
  end

  def booking_info
    @vehicle_booking = VehicleBooking.find(params[:id])
  end

  def document_list_confirm
    @document_list_ids = params[:document_list_ids]
    vehicle_booking_id = params[:vehicle_booking_id]

    if @document_list_ids.nil?
      flash[:alert] = "Please Select the Checkbox"
    else
      @document_list_ids.each do |doc|
        @employee = current_user.employee_id
        DocumentList.find_by(id: doc).update(status: true,employee_id: @employee)
        flash[:notice] = "Confirmed Successfully"
      end 
    end
    redirect_to request.referrer
  end

  # PATCH/PUT /vehicle_bookings/1
  # PATCH/PUT /vehicle_bookings/1.json
  def update
    respond_to do |format|
      enquiry = @vehicle_booking.enquiry_id
      if @vehicle_booking.update(vehicle_booking_params)
        updated_enquiry = vehicle_booking_params['enquiry_id']
        if enquiry.nil?
          @vehicle_booking.update(enquiry_id: updated_enquiry)
        else
          if updated_enquiry == ""
            @vehicle_booking.update(enquiry_id: enquiry)
          else
            @vehicle_booking.update(enquiry_id: updated_enquiry)
          end
        end
        format.html { redirect_to @vehicle_booking, notice: 'Vehicle booking was successfully updated.' }
        format.json { render :show, status: :ok, location: @vehicle_booking }
      else
        format.html { render :edit }
        format.json { render json: @vehicle_booking.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vehicle_bookings/1
  # DELETE /vehicle_bookings/1.json
  def destroy
    @vehicle_booking.destroy
    respond_to do |format|
      format.html { redirect_to vehicle_bookings_url, notice: 'Vehicle booking was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def bookings_detail
    @vehicle_booking = VehicleBooking.find(params[:booking_id])
    respond_to do |f|
      f.js
      f.xls {render template: 'vehicle_bookings/bookings_detail.xls.erb'}
      f.html
      f.pdf do
        render pdf: ' bookings_detail',
        layout: 'pdf.html',
        orientation: 'Landscape',
        template: 'vehicle_bookings/bookings_detail.pdf.erb',
        show_as_html: params[:debug].present?
        #margin:  { top:1,bottom:1,left:1,right:1 }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vehicle_booking
      @vehicle_booking = VehicleBooking.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vehicle_booking_params
      params.require(:vehicle_booking).permit(:enquiry_id,:pan, :adhar, :licence, :light_bill, :rent_agr, :bs, :itr, :native_light_bill, :pan_guarantor, :adhar_guarantor, :light_bill_guarantor, :rent_agr_guarantor, :bs_guarantor, :itr_guarantor, :pan_guarantor1, :adhar_guarantor1, :light_bill_guarantor1, :rent_agr_guarantor1, :bs_guarantor1, :itr_guarantor1, :status)
    end
end
