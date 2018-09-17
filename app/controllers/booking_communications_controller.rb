class BookingCommunicationsController < ApplicationController
  before_action :set_booking_communication, only: [:show, :edit, :update, :destroy]

  # GET /booking_communications
  # GET /booking_communications.json
  def index
    @booking_communications = BookingCommunication.all
  end

  # GET /booking_communications/1
  # GET /booking_communications/1.json
  def show
  end

  # GET /booking_communications/new
  def new
    @booking_communication = BookingCommunication.new
  end

  # GET /booking_communications/1/edit
  def edit
  end

  # POST /booking_communications
  # POST /booking_communications.json
  def create
    @booking_communication = BookingCommunication.new(booking_communication_params)

    respond_to do |format|
      if @booking_communication.save
        format.html { redirect_to @booking_communication, notice: 'Booking communication was successfully created.' }
        format.json { render :show, status: :created, location: @booking_communication }
      else
        format.html { render :new }
        format.json { render json: @booking_communication.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /booking_communications/1
  # PATCH/PUT /booking_communications/1.json
  def update
    respond_to do |format|
      if @booking_communication.update(booking_communication_params)
        format.html { redirect_to @booking_communication, notice: 'Booking communication was successfully updated.' }
        format.json { render :show, status: :ok, location: @booking_communication }
      else
        format.html { render :edit }
        format.json { render json: @booking_communication.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /booking_communications/1
  # DELETE /booking_communications/1.json
  def destroy
    @booking_communication.destroy
    respond_to do |format|
      format.html { redirect_to booking_communications_url, notice: 'Booking communication was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_booking_communication
      @booking_communication = BookingCommunication.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def booking_communication_params
      params.require(:booking_communication).permit(:vehicle_booking_id, :variant, :vc_number, :quality, :company_name, :designation, :customer_po_no, :insurance, :registration, :delivery_location, :expected_delivery, :sales_person, :ex_showroom_price, :insurance_amount, :registration_amount, :accessories_vat_amount, :txtenaea_warranty_amount, :amc_amount, :exchange_amount, :exchange_discount, :logistics_charges, :corporate_offer, :taxes_levies, :tatoal_recevivable_amount, :finance_by, :finance_amount, :down_payment, :emi_amount, :car_model, :make, :year_of_manufacture, :varluation_amount, :special_insurance)
    end
end
