require "test_helper"

class MusclePercentagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @muscle_percentage = muscle_percentages(:one)
  end

  test "should get index" do
    get muscle_percentages_url
    assert_response :success
  end

  test "should get new" do
    get new_muscle_percentage_url
    assert_response :success
  end

  test "should create muscle_percentage" do
    assert_difference("MusclePercentage.count") do
      post muscle_percentages_url, params: { muscle_percentage: { percent: @muscle_percentage.percent, user_id: @muscle_percentage.user_id } }
    end

    assert_redirected_to muscle_percentage_url(MusclePercentage.last)
  end

  test "should show muscle_percentage" do
    get muscle_percentage_url(@muscle_percentage)
    assert_response :success
  end

  test "should get edit" do
    get edit_muscle_percentage_url(@muscle_percentage)
    assert_response :success
  end

  test "should update muscle_percentage" do
    patch muscle_percentage_url(@muscle_percentage), params: { muscle_percentage: { percent: @muscle_percentage.percent, user_id: @muscle_percentage.user_id } }
    assert_redirected_to muscle_percentage_url(@muscle_percentage)
  end

  test "should destroy muscle_percentage" do
    assert_difference("MusclePercentage.count", -1) do
      delete muscle_percentage_url(@muscle_percentage)
    end

    assert_redirected_to muscle_percentages_url
  end
end
