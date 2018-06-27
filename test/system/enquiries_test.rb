require "application_system_test_case"

class EnquiriesTest < ApplicationSystemTestCase
  setup do
    @enquiry = enquiries(:one)
  end

  test "visiting the index" do
    visit enquiries_url
    assert_selector "h1", text: "Enquiries"
  end

  test "creating a Enquiry" do
    visit enquiries_url
    click_on "New Enquiry"

    fill_in "Address", with: @enquiry.address
    fill_in "Email", with: @enquiry.email
    fill_in "Last Name", with: @enquiry.last_name
    fill_in "Middle Name", with: @enquiry.middle_name
    fill_in "Mobile No", with: @enquiry.mobile_no
    fill_in "Name First", with: @enquiry.name_first
    fill_in "Place", with: @enquiry.place
    fill_in "User", with: @enquiry.user
    click_on "Create Enquiry"

    assert_text "Enquiry was successfully created"
    click_on "Back"
  end

  test "updating a Enquiry" do
    visit enquiries_url
    click_on "Edit", match: :first

    fill_in "Address", with: @enquiry.address
    fill_in "Email", with: @enquiry.email
    fill_in "Last Name", with: @enquiry.last_name
    fill_in "Middle Name", with: @enquiry.middle_name
    fill_in "Mobile No", with: @enquiry.mobile_no
    fill_in "Name First", with: @enquiry.name_first
    fill_in "Place", with: @enquiry.place
    fill_in "User", with: @enquiry.user
    click_on "Update Enquiry"

    assert_text "Enquiry was successfully updated"
    click_on "Back"
  end

  test "destroying a Enquiry" do
    visit enquiries_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Enquiry was successfully destroyed"
  end
end
