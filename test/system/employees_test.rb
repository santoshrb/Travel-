require "application_system_test_case"

class EmployeesTest < ApplicationSystemTestCase
  setup do
    @employee = employees(:one)
  end

  test "visiting the index" do
    visit employees_url
    assert_selector "h1", text: "Employees"
  end

  test "creating a Employee" do
    visit employees_url
    click_on "New Employee"

    fill_in "Address", with: @employee.address
    fill_in "Adhar No", with: @employee.adhar_no
    fill_in "Blood Group", with: @employee.blood_group
    fill_in "City", with: @employee.city
    fill_in "Code", with: @employee.code
    fill_in "Contact No", with: @employee.contact_no
    fill_in "Country", with: @employee.country
    fill_in "Date Of Birth", with: @employee.date_of_birth
    fill_in "District", with: @employee.district
    fill_in "Email", with: @employee.email
    fill_in "First Name", with: @employee.first_name
    fill_in "Gender", with: @employee.gender
    fill_in "Last Name", with: @employee.last_name
    fill_in "Middle Name", with: @employee.middle_name
    fill_in "Pin Code", with: @employee.pin_code
    fill_in "Prefix", with: @employee.prefix
    fill_in "State", with: @employee.state
    fill_in "Status", with: @employee.status
    click_on "Create Employee"

    assert_text "Employee was successfully created"
    click_on "Back"
  end

  test "updating a Employee" do
    visit employees_url
    click_on "Edit", match: :first

    fill_in "Address", with: @employee.address
    fill_in "Adhar No", with: @employee.adhar_no
    fill_in "Blood Group", with: @employee.blood_group
    fill_in "City", with: @employee.city
    fill_in "Code", with: @employee.code
    fill_in "Contact No", with: @employee.contact_no
    fill_in "Country", with: @employee.country
    fill_in "Date Of Birth", with: @employee.date_of_birth
    fill_in "District", with: @employee.district
    fill_in "Email", with: @employee.email
    fill_in "First Name", with: @employee.first_name
    fill_in "Gender", with: @employee.gender
    fill_in "Last Name", with: @employee.last_name
    fill_in "Middle Name", with: @employee.middle_name
    fill_in "Pin Code", with: @employee.pin_code
    fill_in "Prefix", with: @employee.prefix
    fill_in "State", with: @employee.state
    fill_in "Status", with: @employee.status
    click_on "Update Employee"

    assert_text "Employee was successfully updated"
    click_on "Back"
  end

  test "destroying a Employee" do
    visit employees_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Employee was successfully destroyed"
  end
end
