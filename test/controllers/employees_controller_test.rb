require 'test_helper'

class EmployeesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @employee = employees(:one)
  end

  test "should get index" do
    get employees_url
    assert_response :success
  end

  test "should get new" do
    get new_employee_url
    assert_response :success
  end

  test "should create employee" do
    assert_difference('Employee.count') do
      post employees_url, params: { employee: { address: @employee.address, adhar_no: @employee.adhar_no, blood_group: @employee.blood_group, city: @employee.city, code: @employee.code, contact_no: @employee.contact_no, country: @employee.country, date_of_birth: @employee.date_of_birth, district: @employee.district, email: @employee.email, first_name: @employee.first_name, gender: @employee.gender, last_name: @employee.last_name, middle_name: @employee.middle_name, pin_code: @employee.pin_code, prefix: @employee.prefix, state: @employee.state, status: @employee.status } }
    end

    assert_redirected_to employee_url(Employee.last)
  end

  test "should show employee" do
    get employee_url(@employee)
    assert_response :success
  end

  test "should get edit" do
    get edit_employee_url(@employee)
    assert_response :success
  end

  test "should update employee" do
    patch employee_url(@employee), params: { employee: { address: @employee.address, adhar_no: @employee.adhar_no, blood_group: @employee.blood_group, city: @employee.city, code: @employee.code, contact_no: @employee.contact_no, country: @employee.country, date_of_birth: @employee.date_of_birth, district: @employee.district, email: @employee.email, first_name: @employee.first_name, gender: @employee.gender, last_name: @employee.last_name, middle_name: @employee.middle_name, pin_code: @employee.pin_code, prefix: @employee.prefix, state: @employee.state, status: @employee.status } }
    assert_redirected_to employee_url(@employee)
  end

  test "should destroy employee" do
    assert_difference('Employee.count', -1) do
      delete employee_url(@employee)
    end

    assert_redirected_to employees_url
  end
end
