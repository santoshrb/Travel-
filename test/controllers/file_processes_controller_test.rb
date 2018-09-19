require 'test_helper'

class FileProcessesControllerTest < ActionController::TestCase
  setup do
    @file_process = file_processes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:file_processes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create file_process" do
    assert_difference('FileProcess.count') do
      post :create, file_process: { contact_no: @file_process.contact_no, contact_person: @file_process.contact_person, financer: @file_process.financer, status: @file_process.status, vehicle_booking_id: @file_process.vehicle_booking_id }
    end

    assert_redirected_to file_process_path(assigns(:file_process))
  end

  test "should show file_process" do
    get :show, id: @file_process
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @file_process
    assert_response :success
  end

  test "should update file_process" do
    patch :update, id: @file_process, file_process: { contact_no: @file_process.contact_no, contact_person: @file_process.contact_person, financer: @file_process.financer, status: @file_process.status, vehicle_booking_id: @file_process.vehicle_booking_id }
    assert_redirected_to file_process_path(assigns(:file_process))
  end

  test "should destroy file_process" do
    assert_difference('FileProcess.count', -1) do
      delete :destroy, id: @file_process
    end

    assert_redirected_to file_processes_path
  end
end
