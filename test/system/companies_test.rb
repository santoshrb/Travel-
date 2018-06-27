require "application_system_test_case"

class CompaniesTest < ApplicationSystemTestCase
  setup do
    @company = companies(:one)
  end

  test "visiting the index" do
    visit companies_url
    assert_selector "h1", text: "Companies"
  end

  test "creating a Company" do
    visit companies_url
    click_on "New Company"

    fill_in "Address", with: @company.address
    fill_in "City", with: @company.city
    fill_in "Code", with: @company.code
    fill_in "Contact No", with: @company.contact_no
    fill_in "Country", with: @company.country
    fill_in "District", with: @company.district
    fill_in "Email", with: @company.email
    fill_in "Name", with: @company.name
    fill_in "Pin Code", with: @company.pin_code
    fill_in "State", with: @company.state
    fill_in "Status", with: @company.status
    click_on "Create Company"

    assert_text "Company was successfully created"
    click_on "Back"
  end

  test "updating a Company" do
    visit companies_url
    click_on "Edit", match: :first

    fill_in "Address", with: @company.address
    fill_in "City", with: @company.city
    fill_in "Code", with: @company.code
    fill_in "Contact No", with: @company.contact_no
    fill_in "Country", with: @company.country
    fill_in "District", with: @company.district
    fill_in "Email", with: @company.email
    fill_in "Name", with: @company.name
    fill_in "Pin Code", with: @company.pin_code
    fill_in "State", with: @company.state
    fill_in "Status", with: @company.status
    click_on "Update Company"

    assert_text "Company was successfully updated"
    click_on "Back"
  end

  test "destroying a Company" do
    visit companies_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Company was successfully destroyed"
  end
end
