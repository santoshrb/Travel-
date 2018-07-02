require 'test_helper'

class FinancerMastersControllerTest < ActionController::TestCase
  setup do
    @financer_master = financer_masters(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:financer_masters)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create financer_master" do
    assert_difference('FinancerMaster.count') do
      post :create, financer_master: { address: @financer_master.address, code: @financer_master.code, contact_no: @financer_master.contact_no, contact_person: @financer_master.contact_person, description: @financer_master.description, email: @financer_master.email, name: @financer_master.name, pin_code: @financer_master.pin_code, place: @financer_master.place, status: @financer_master.status }
    end

    assert_redirected_to financer_master_path(assigns(:financer_master))
  end

  test "should show financer_master" do
    get :show, id: @financer_master
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @financer_master
    assert_response :success
  end

  test "should update financer_master" do
    patch :update, id: @financer_master, financer_master: { address: @financer_master.address, code: @financer_master.code, contact_no: @financer_master.contact_no, contact_person: @financer_master.contact_person, description: @financer_master.description, email: @financer_master.email, name: @financer_master.name, pin_code: @financer_master.pin_code, place: @financer_master.place, status: @financer_master.status }
    assert_redirected_to financer_master_path(assigns(:financer_master))
  end

  test "should destroy financer_master" do
    assert_difference('FinancerMaster.count', -1) do
      delete :destroy, id: @financer_master
    end

    assert_redirected_to financer_masters_path
  end
end
