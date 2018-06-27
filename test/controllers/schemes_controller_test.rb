require 'test_helper'

class SchemesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @scheme = schemes(:one)
  end

  test "should get index" do
    get schemes_url
    assert_response :success
  end

  test "should get new" do
    get new_scheme_url
    assert_response :success
  end

  test "should create scheme" do
    assert_difference('Scheme.count') do
      post schemes_url, params: { scheme: { budget: @scheme.budget, down_payment: @scheme.down_payment, from_date: @scheme.from_date, installment: @scheme.installment, intrest: @scheme.intrest, name: @scheme.name, status: @scheme.status, to_date: @scheme.to_date, type: @scheme.type } }
    end

    assert_redirected_to scheme_url(Scheme.last)
  end

  test "should show scheme" do
    get scheme_url(@scheme)
    assert_response :success
  end

  test "should get edit" do
    get edit_scheme_url(@scheme)
    assert_response :success
  end

  test "should update scheme" do
    patch scheme_url(@scheme), params: { scheme: { budget: @scheme.budget, down_payment: @scheme.down_payment, from_date: @scheme.from_date, installment: @scheme.installment, intrest: @scheme.intrest, name: @scheme.name, status: @scheme.status, to_date: @scheme.to_date, type: @scheme.type } }
    assert_redirected_to scheme_url(@scheme)
  end

  test "should destroy scheme" do
    assert_difference('Scheme.count', -1) do
      delete scheme_url(@scheme)
    end

    assert_redirected_to schemes_url
  end
end
