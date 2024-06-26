require "application_system_test_case"

class QuotationsTest < ApplicationSystemTestCase
  setup do
    @quotation = quotations(:one)
  end

  test "visiting the index" do
    visit quotations_url
    assert_selector "h1", text: "Quotations"
  end

  test "should create quotation" do
    visit quotations_url
    click_on "New quotation"

    fill_in "Customer", with: @quotation.customer_id
    fill_in "Due at", with: @quotation.due_at
    fill_in "Issue at", with: @quotation.issue_at
    fill_in "Number", with: @quotation.number
    fill_in "Status", with: @quotation.status
    click_on "Create Quotation"

    assert_text "Quotation was successfully created"
    click_on "Back"
  end

  test "should update Quotation" do
    visit quotation_url(@quotation)
    click_on "Edit this quotation", match: :first

    fill_in "Customer", with: @quotation.customer_id
    fill_in "Due at", with: @quotation.due_at
    fill_in "Issue at", with: @quotation.issue_at
    fill_in "Number", with: @quotation.number
    fill_in "Status", with: @quotation.status
    click_on "Update Quotation"

    assert_text "Quotation was successfully updated"
    click_on "Back"
  end

  test "should destroy Quotation" do
    visit quotation_url(@quotation)
    click_on "Destroy this quotation", match: :first

    assert_text "Quotation was successfully destroyed"
  end
end
