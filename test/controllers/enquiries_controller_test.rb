require 'test_helper'

class EnquiriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @enquiry = enquiries(:one)
  end

  test "should get index" do
    get enquiries_url
    assert_response :success
  end

  test "should get new" do
    get new_enquiry_url
    assert_response :success
  end

  test "should create enquiry" do
    assert_difference('Enquiry.count') do
      post enquiries_url, params: { enquiry: { address: @enquiry.address, email: @enquiry.email, last_name: @enquiry.last_name, middle_name: @enquiry.middle_name, mobile_no: @enquiry.mobile_no, name_first: @enquiry.name_first, place: @enquiry.place, user: @enquiry.user } }
    end

    assert_redirected_to enquiry_url(Enquiry.last)
  end

  test "should show enquiry" do
    get enquiry_url(@enquiry)
    assert_response :success
  end

  test "should get edit" do
    get edit_enquiry_url(@enquiry)
    assert_response :success
  end

  test "should update enquiry" do
    patch enquiry_url(@enquiry), params: { enquiry: { address: @enquiry.address, email: @enquiry.email, last_name: @enquiry.last_name, middle_name: @enquiry.middle_name, mobile_no: @enquiry.mobile_no, name_first: @enquiry.name_first, place: @enquiry.place, user: @enquiry.user } }
    assert_redirected_to enquiry_url(@enquiry)
  end

  test "should destroy enquiry" do
    assert_difference('Enquiry.count', -1) do
      delete enquiry_url(@enquiry)
    end

    assert_redirected_to enquiries_url
  end
end
