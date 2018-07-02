require 'test_helper'

class DocumentMastersControllerTest < ActionController::TestCase
  setup do
    @document_master = document_masters(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:document_masters)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create document_master" do
    assert_difference('DocumentMaster.count') do
      post :create, document_master: { code: @document_master.code, description: @document_master.description, name: @document_master.name, status: @document_master.status }
    end

    assert_redirected_to document_master_path(assigns(:document_master))
  end

  test "should show document_master" do
    get :show, id: @document_master
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @document_master
    assert_response :success
  end

  test "should update document_master" do
    patch :update, id: @document_master, document_master: { code: @document_master.code, description: @document_master.description, name: @document_master.name, status: @document_master.status }
    assert_redirected_to document_master_path(assigns(:document_master))
  end

  test "should destroy document_master" do
    assert_difference('DocumentMaster.count', -1) do
      delete :destroy, id: @document_master
    end

    assert_redirected_to document_masters_path
  end
end
