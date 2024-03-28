require "application_system_test_case"

class LinesTest < ApplicationSystemTestCase
  setup do
    @line = lines(:one)
  end

  test "visiting the index" do
    visit lines_url
    assert_selector "h1", text: "Lines"
  end

  test "should create line" do
    visit lines_url
    click_on "New line"

    fill_in "Description", with: @line.description
    fill_in "Lineable", with: @line.lineable_id
    fill_in "Lineable type", with: @line.lineable_type
    fill_in "Quantity", with: @line.quantity
    fill_in "Total price", with: @line.total_price
    fill_in "Unit price", with: @line.unit_price
    click_on "Create Line"

    assert_text "Line was successfully created"
    click_on "Back"
  end

  test "should update Line" do
    visit line_url(@line)
    click_on "Edit this line", match: :first

    fill_in "Description", with: @line.description
    fill_in "Lineable", with: @line.lineable_id
    fill_in "Lineable type", with: @line.lineable_type
    fill_in "Quantity", with: @line.quantity
    fill_in "Total price", with: @line.total_price
    fill_in "Unit price", with: @line.unit_price
    click_on "Update Line"

    assert_text "Line was successfully updated"
    click_on "Back"
  end

  test "should destroy Line" do
    visit line_url(@line)
    click_on "Destroy this line", match: :first

    assert_text "Line was successfully destroyed"
  end
end
