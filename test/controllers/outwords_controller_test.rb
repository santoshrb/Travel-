require 'test_helper'

class OutwordsControllerTest < ActionController::TestCase
  setup do
    @outword = outwords(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:outwords)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create outword" do
    assert_difference('Outword.count') do
      post :create, outword: { amount: @outword.amount, date: @outword.date, employee_id: @outword.employee_id, handover_id_id: @outword.handover_id_id, handover_to: @outword.handover_to, purpose: @outword.purpose }
    end

    assert_redirected_to outword_path(assigns(:outword))
  end

  test "should show outword" do
    get :show, id: @outword
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @outword
    assert_response :success
  end

  test "should update outword" do
    patch :update, id: @outword, outword: { amount: @outword.amount, date: @outword.date, employee_id: @outword.employee_id, handover_id_id: @outword.handover_id_id, handover_to: @outword.handover_to, purpose: @outword.purpose }
    assert_redirected_to outword_path(assigns(:outword))
  end

  test "should destroy outword" do
    assert_difference('Outword.count', -1) do
      delete :destroy, id: @outword
    end

    assert_redirected_to outwords_path
  end
end
