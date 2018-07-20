require 'test_helper'

class DocumentListsControllerTest < ActionController::TestCase
  setup do
    @document_list = document_lists(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:document_lists)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create document_list" do
    assert_difference('DocumentList.count') do
      post :create, document_list: { document_master_id: @document_list.document_master_id, employee_id: @document_list.employee_id, status: @document_list.status, vehicle_booking_id: @document_list.vehicle_booking_id }
    end

    assert_redirected_to document_list_path(assigns(:document_list))
  end

  test "should show document_list" do
    get :show, id: @document_list
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @document_list
    assert_response :success
  end

  test "should update document_list" do
    patch :update, id: @document_list, document_list: { document_master_id: @document_list.document_master_id, employee_id: @document_list.employee_id, status: @document_list.status, vehicle_booking_id: @document_list.vehicle_booking_id }
    assert_redirected_to document_list_path(assigns(:document_list))
  end

  test "should destroy document_list" do
    assert_difference('DocumentList.count', -1) do
      delete :destroy, id: @document_list
    end

    assert_redirected_to document_lists_path
  end
end
