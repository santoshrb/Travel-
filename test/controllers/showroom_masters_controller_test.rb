require 'test_helper'

class ShowroomMastersControllerTest < ActionController::TestCase
  setup do
    @showroom_master = showroom_masters(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:showroom_masters)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create showroom_master" do
    assert_difference('ShowroomMaster.count') do
      post :create, showroom_master: { address: @showroom_master.address, code: @showroom_master.code, contact_no: @showroom_master.contact_no, contact_person: @showroom_master.contact_person, description: @showroom_master.description, email: @showroom_master.email, name: @showroom_master.name, pin_code: @showroom_master.pin_code, place: @showroom_master.place, status: @showroom_master.status }
    end

    assert_redirected_to showroom_master_path(assigns(:showroom_master))
  end

  test "should show showroom_master" do
    get :show, id: @showroom_master
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @showroom_master
    assert_response :success
  end

  test "should update showroom_master" do
    patch :update, id: @showroom_master, showroom_master: { address: @showroom_master.address, code: @showroom_master.code, contact_no: @showroom_master.contact_no, contact_person: @showroom_master.contact_person, description: @showroom_master.description, email: @showroom_master.email, name: @showroom_master.name, pin_code: @showroom_master.pin_code, place: @showroom_master.place, status: @showroom_master.status }
    assert_redirected_to showroom_master_path(assigns(:showroom_master))
  end

  test "should destroy showroom_master" do
    assert_difference('ShowroomMaster.count', -1) do
      delete :destroy, id: @showroom_master
    end

    assert_redirected_to showroom_masters_path
  end
end
