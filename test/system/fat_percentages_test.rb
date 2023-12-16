require "application_system_test_case"

class FatPercentagesTest < ApplicationSystemTestCase
  setup do
    @fat_percentage = fat_percentages(:one)
  end

  test "visiting the index" do
    visit fat_percentages_url
    assert_selector "h1", text: "Fat percentages"
  end

  test "should create fat percentage" do
    visit fat_percentages_url
    click_on "New fat percentage"

    fill_in "Percent", with: @fat_percentage.percent
    fill_in "User", with: @fat_percentage.user_id
    click_on "Create Fat percentage"

    assert_text "Fat percentage was successfully created"
    click_on "Back"
  end

  test "should update Fat percentage" do
    visit fat_percentage_url(@fat_percentage)
    click_on "Edit this fat percentage", match: :first

    fill_in "Percent", with: @fat_percentage.percent
    fill_in "User", with: @fat_percentage.user_id
    click_on "Update Fat percentage"

    assert_text "Fat percentage was successfully updated"
    click_on "Back"
  end

  test "should destroy Fat percentage" do
    visit fat_percentage_url(@fat_percentage)
    click_on "Destroy this fat percentage", match: :first

    assert_text "Fat percentage was successfully destroyed"
  end
end
