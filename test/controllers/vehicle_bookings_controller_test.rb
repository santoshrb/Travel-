require 'test_helper'

class VehicleBookingsControllerTest < ActionController::TestCase
  setup do
    @vehicle_booking = vehicle_bookings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:vehicle_bookings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create vehicle_booking" do
    assert_difference('VehicleBooking.count') do
      post :create, vehicle_booking: { adhar: @vehicle_booking.adhar, adhar_guarantor1: @vehicle_booking.adhar_guarantor1, adhar_guarantor: @vehicle_booking.adhar_guarantor, bs: @vehicle_booking.bs, bs_guarantor1: @vehicle_booking.bs_guarantor1, bs_guarantor: @vehicle_booking.bs_guarantor, itr: @vehicle_booking.itr, itr_guarantor1: @vehicle_booking.itr_guarantor1, itr_guarantor: @vehicle_booking.itr_guarantor, licence: @vehicle_booking.licence, light_bill: @vehicle_booking.light_bill, light_bill_guarantor1: @vehicle_booking.light_bill_guarantor1, light_bill_guarantor: @vehicle_booking.light_bill_guarantor, native_light_bill: @vehicle_booking.native_light_bill, pan: @vehicle_booking.pan, pan_guarantor1: @vehicle_booking.pan_guarantor1, pan_guarantor: @vehicle_booking.pan_guarantor, rent_agr: @vehicle_booking.rent_agr, rent_agr_guarantor1: @vehicle_booking.rent_agr_guarantor1, rent_agr_guarantor: @vehicle_booking.rent_agr_guarantor, status: @vehicle_booking.status }
    end

    assert_redirected_to vehicle_booking_path(assigns(:vehicle_booking))
  end

  test "should show vehicle_booking" do
    get :show, id: @vehicle_booking
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @vehicle_booking
    assert_response :success
  end

  test "should update vehicle_booking" do
    patch :update, id: @vehicle_booking, vehicle_booking: { adhar: @vehicle_booking.adhar, adhar_guarantor1: @vehicle_booking.adhar_guarantor1, adhar_guarantor: @vehicle_booking.adhar_guarantor, bs: @vehicle_booking.bs, bs_guarantor1: @vehicle_booking.bs_guarantor1, bs_guarantor: @vehicle_booking.bs_guarantor, itr: @vehicle_booking.itr, itr_guarantor1: @vehicle_booking.itr_guarantor1, itr_guarantor: @vehicle_booking.itr_guarantor, licence: @vehicle_booking.licence, light_bill: @vehicle_booking.light_bill, light_bill_guarantor1: @vehicle_booking.light_bill_guarantor1, light_bill_guarantor: @vehicle_booking.light_bill_guarantor, native_light_bill: @vehicle_booking.native_light_bill, pan: @vehicle_booking.pan, pan_guarantor1: @vehicle_booking.pan_guarantor1, pan_guarantor: @vehicle_booking.pan_guarantor, rent_agr: @vehicle_booking.rent_agr, rent_agr_guarantor1: @vehicle_booking.rent_agr_guarantor1, rent_agr_guarantor: @vehicle_booking.rent_agr_guarantor, status: @vehicle_booking.status }
    assert_redirected_to vehicle_booking_path(assigns(:vehicle_booking))
  end

  test "should destroy vehicle_booking" do
    assert_difference('VehicleBooking.count', -1) do
      delete :destroy, id: @vehicle_booking
    end

    assert_redirected_to vehicle_bookings_path
  end
end
