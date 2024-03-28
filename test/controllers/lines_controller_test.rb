require "test_helper"

class LinesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @line = lines(:one)
  end

  test "should get index" do
    get lines_url
    assert_response :success
  end

  test "should get new" do
    get new_line_url
    assert_response :success
  end

  test "should create line" do
    assert_difference("Line.count") do
      post lines_url, params: { line: { description: @line.description, lineable_id: @line.lineable_id, lineable_type: @line.lineable_type, quantity: @line.quantity, total_price: @line.total_price, unit_price: @line.unit_price } }
    end

    assert_redirected_to line_url(Line.last)
  end

  test "should show line" do
    get line_url(@line)
    assert_response :success
  end

  test "should get edit" do
    get edit_line_url(@line)
    assert_response :success
  end

  test "should update line" do
    patch line_url(@line), params: { line: { description: @line.description, lineable_id: @line.lineable_id, lineable_type: @line.lineable_type, quantity: @line.quantity, total_price: @line.total_price, unit_price: @line.unit_price } }
    assert_redirected_to line_url(@line)
  end

  test "should destroy line" do
    assert_difference("Line.count", -1) do
      delete line_url(@line)
    end

    assert_redirected_to lines_url
  end
end
