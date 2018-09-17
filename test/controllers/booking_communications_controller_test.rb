require 'test_helper'

class BookingCommunicationsControllerTest < ActionController::TestCase
  setup do
    @booking_communication = booking_communications(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:booking_communications)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create booking_communication" do
    assert_difference('BookingCommunication.count') do
      post :create, booking_communication: { accessories_vat_amount: @booking_communication.accessories_vat_amount, amc_amount: @booking_communication.amc_amount, car_model: @booking_communication.car_model, company_name: @booking_communication.company_name, corporate_offer: @booking_communication.corporate_offer, customer_po_no: @booking_communication.customer_po_no, delivery_location: @booking_communication.delivery_location, designation: @booking_communication.designation, down_payment: @booking_communication.down_payment, emi_amount: @booking_communication.emi_amount, ex_showroom_price: @booking_communication.ex_showroom_price, exchange_amount: @booking_communication.exchange_amount, exchange_discount: @booking_communication.exchange_discount, expected_delivery: @booking_communication.expected_delivery, finance_amount: @booking_communication.finance_amount, finance_by: @booking_communication.finance_by, insurance: @booking_communication.insurance, insurance_amount: @booking_communication.insurance_amount, logistics_charges: @booking_communication.logistics_charges, make: @booking_communication.make, quality: @booking_communication.quality, registration: @booking_communication.registration, registration_amount: @booking_communication.registration_amount, sales_person: @booking_communication.sales_person, special_insurance: @booking_communication.special_insurance, tatoal_recevivable_amount: @booking_communication.tatoal_recevivable_amount, taxes_levies: @booking_communication.taxes_levies, txtenaea_warranty_amount: @booking_communication.txtenaea_warranty_amount, variant: @booking_communication.variant, varluation_amount: @booking_communication.varluation_amount, vc_number: @booking_communication.vc_number, vehicle_booking_id: @booking_communication.vehicle_booking_id, year_of_manufacture: @booking_communication.year_of_manufacture }
    end

    assert_redirected_to booking_communication_path(assigns(:booking_communication))
  end

  test "should show booking_communication" do
    get :show, id: @booking_communication
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @booking_communication
    assert_response :success
  end

  test "should update booking_communication" do
    patch :update, id: @booking_communication, booking_communication: { accessories_vat_amount: @booking_communication.accessories_vat_amount, amc_amount: @booking_communication.amc_amount, car_model: @booking_communication.car_model, company_name: @booking_communication.company_name, corporate_offer: @booking_communication.corporate_offer, customer_po_no: @booking_communication.customer_po_no, delivery_location: @booking_communication.delivery_location, designation: @booking_communication.designation, down_payment: @booking_communication.down_payment, emi_amount: @booking_communication.emi_amount, ex_showroom_price: @booking_communication.ex_showroom_price, exchange_amount: @booking_communication.exchange_amount, exchange_discount: @booking_communication.exchange_discount, expected_delivery: @booking_communication.expected_delivery, finance_amount: @booking_communication.finance_amount, finance_by: @booking_communication.finance_by, insurance: @booking_communication.insurance, insurance_amount: @booking_communication.insurance_amount, logistics_charges: @booking_communication.logistics_charges, make: @booking_communication.make, quality: @booking_communication.quality, registration: @booking_communication.registration, registration_amount: @booking_communication.registration_amount, sales_person: @booking_communication.sales_person, special_insurance: @booking_communication.special_insurance, tatoal_recevivable_amount: @booking_communication.tatoal_recevivable_amount, taxes_levies: @booking_communication.taxes_levies, txtenaea_warranty_amount: @booking_communication.txtenaea_warranty_amount, variant: @booking_communication.variant, varluation_amount: @booking_communication.varluation_amount, vc_number: @booking_communication.vc_number, vehicle_booking_id: @booking_communication.vehicle_booking_id, year_of_manufacture: @booking_communication.year_of_manufacture }
    assert_redirected_to booking_communication_path(assigns(:booking_communication))
  end

  test "should destroy booking_communication" do
    assert_difference('BookingCommunication.count', -1) do
      delete :destroy, id: @booking_communication
    end

    assert_redirected_to booking_communications_path
  end
end
