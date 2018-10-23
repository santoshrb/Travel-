require 'test_helper'

class InwordsControllerTest < ActionController::TestCase
  setup do
    @inword = inwords(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:inwords)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create inword" do
    assert_difference('Inword.count') do
      post :create, inword: { amount: @inword.amount, contact_no: @inword.contact_no, date: @inword.date, employee_id: @inword.employee_id, payment_type: @inword.payment_type, receipt_no: @inword.receipt_no, vehicle_booking_id: @inword.vehicle_booking_id, vendor_name: @inword.vendor_name }
    end

    assert_redirected_to inword_path(assigns(:inword))
  end

  test "should show inword" do
    get :show, id: @inword
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @inword
    assert_response :success
  end

  test "should update inword" do
    patch :update, id: @inword, inword: { amount: @inword.amount, contact_no: @inword.contact_no, date: @inword.date, employee_id: @inword.employee_id, payment_type: @inword.payment_type, receipt_no: @inword.receipt_no, vehicle_booking_id: @inword.vehicle_booking_id, vendor_name: @inword.vendor_name }
    assert_redirected_to inword_path(assigns(:inword))
  end

  test "should destroy inword" do
    assert_difference('Inword.count', -1) do
      delete :destroy, id: @inword
    end

    assert_redirected_to inwords_path
  end
end
