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
    @vehicle_booking_id = @booking_communication.vehicle_booking_id
  end

  # POST /booking_communications
  # POST /booking_communications.json
  def create

    @booking_communication = BookingCommunication.new(booking_communication_params)
    @booking_communications = BookingCommunication.all
    respond_to do |format|
      if @booking_communication.save
        #@booking_communication = BookingCommunication.new
        format.js { @flag = true }
      else
        flash.now[:alert] = 'Booking Already Exist.'
        format.js { @flag = false }
      end
    end
  end

  # PATCH/PUT /booking_communications/1
  # PATCH/PUT /booking_communications/1.json
  def update
    respond_to do |format|
      if @booking_communication.update(booking_communication_params)
        # format.html { redirect_to @booking_communication, notice: 'Booking communication was successfully updated.' }
        # format.json { render :show, status: :ok, location: @booking_communication }
        format.js { @flag = true }
      else
        format.js { @flag = false }
        # format.html { render :edit }
        # format.json { render json: @booking_communication.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /booking_communications/1
  # DELETE /booking_communications/1.json
  def destroy
    @booking_communication.destroy
    @booking_communications = BookingCommunication.all
    # respond_to do |format|
    #   format.html { redirect_to booking_communications_url, notice: 'Booking communication was successfully destroyed.' }
    #   format.json { head :no_content }
    # end
  end

  # def bank_master
  #    @banks = Bank.all
  #    respond_to do |f|
  #     f.js
  #     f.xls {render template: 'banks/bank_master.xls.erb'}
  #     f.html
  #     f.pdf do
  #       render pdf: ' bank_master',
  #       layout: 'pdf.html',
  #       orientation: 'Landscape',
  #       template: 'banks/bank_master.pdf.erb',
  #       show_as_html: params[:debug].present?
  #       #margin:  { top:1,bottom:1,left:1,right:1 }
  #           end
  #         end
  #   end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_booking_communication
      @booking_communication = BookingCommunication.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def booking_communication_params
      params.require(:booking_communication).permit(:accessories,:extended_warranty,:amc,:other,:other1,:vehicle_booking_id, :variant, :vc_number, :quality, :company_name, :designation, :customer_po_no, :insurance, :registration, :delivery_location, :expected_delivery, :sales_person, :ex_showroom_price, :insurance_amount, :registration_amount, :accessories_vat_amount, :txtenaea_warranty_amount, :amc_amount, :exchange_amount, :exchange_discount, :logistics_charges, :corporate_offer, :taxes_levies, :tatoal_recevivable_amount, :finance_by, :finance_amount, :down_payment, :emi_amount, :car_model, :make, :year_of_manufacture, :varluation_amount, :special_insurance)
    end
end
