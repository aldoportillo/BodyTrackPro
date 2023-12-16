require "test_helper"

class FatPercentagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @fat_percentage = fat_percentages(:one)
  end

  test "should get index" do
    get fat_percentages_url
    assert_response :success
  end

  test "should get new" do
    get new_fat_percentage_url
    assert_response :success
  end

  test "should create fat_percentage" do
    assert_difference("FatPercentage.count") do
      post fat_percentages_url, params: { fat_percentage: { percent: @fat_percentage.percent, user_id: @fat_percentage.user_id } }
    end

    assert_redirected_to fat_percentage_url(FatPercentage.last)
  end

  test "should show fat_percentage" do
    get fat_percentage_url(@fat_percentage)
    assert_response :success
  end

  test "should get edit" do
    get edit_fat_percentage_url(@fat_percentage)
    assert_response :success
  end

  test "should update fat_percentage" do
    patch fat_percentage_url(@fat_percentage), params: { fat_percentage: { percent: @fat_percentage.percent, user_id: @fat_percentage.user_id } }
    assert_redirected_to fat_percentage_url(@fat_percentage)
  end

  test "should destroy fat_percentage" do
    assert_difference("FatPercentage.count", -1) do
      delete fat_percentage_url(@fat_percentage)
    end

    assert_redirected_to fat_percentages_url
  end
end
