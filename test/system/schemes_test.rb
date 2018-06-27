require "application_system_test_case"

class SchemesTest < ApplicationSystemTestCase
  setup do
    @scheme = schemes(:one)
  end

  test "visiting the index" do
    visit schemes_url
    assert_selector "h1", text: "Schemes"
  end

  test "creating a Scheme" do
    visit schemes_url
    click_on "New Scheme"

    fill_in "Budget", with: @scheme.budget
    fill_in "Down Payment", with: @scheme.down_payment
    fill_in "From Date", with: @scheme.from_date
    fill_in "Installment", with: @scheme.installment
    fill_in "Intrest", with: @scheme.intrest
    fill_in "Name", with: @scheme.name
    fill_in "Status", with: @scheme.status
    fill_in "To Date", with: @scheme.to_date
    fill_in "Type", with: @scheme.type
    click_on "Create Scheme"

    assert_text "Scheme was successfully created"
    click_on "Back"
  end

  test "updating a Scheme" do
    visit schemes_url
    click_on "Edit", match: :first

    fill_in "Budget", with: @scheme.budget
    fill_in "Down Payment", with: @scheme.down_payment
    fill_in "From Date", with: @scheme.from_date
    fill_in "Installment", with: @scheme.installment
    fill_in "Intrest", with: @scheme.intrest
    fill_in "Name", with: @scheme.name
    fill_in "Status", with: @scheme.status
    fill_in "To Date", with: @scheme.to_date
    fill_in "Type", with: @scheme.type
    click_on "Update Scheme"

    assert_text "Scheme was successfully updated"
    click_on "Back"
  end

  test "destroying a Scheme" do
    visit schemes_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Scheme was successfully destroyed"
  end
end
