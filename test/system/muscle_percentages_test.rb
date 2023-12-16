require "application_system_test_case"

class MusclePercentagesTest < ApplicationSystemTestCase
  setup do
    @muscle_percentage = muscle_percentages(:one)
  end

  test "visiting the index" do
    visit muscle_percentages_url
    assert_selector "h1", text: "Muscle percentages"
  end

  test "should create muscle percentage" do
    visit muscle_percentages_url
    click_on "New muscle percentage"

    fill_in "Percent", with: @muscle_percentage.percent
    fill_in "User", with: @muscle_percentage.user_id
    click_on "Create Muscle percentage"

    assert_text "Muscle percentage was successfully created"
    click_on "Back"
  end

  test "should update Muscle percentage" do
    visit muscle_percentage_url(@muscle_percentage)
    click_on "Edit this muscle percentage", match: :first

    fill_in "Percent", with: @muscle_percentage.percent
    fill_in "User", with: @muscle_percentage.user_id
    click_on "Update Muscle percentage"

    assert_text "Muscle percentage was successfully updated"
    click_on "Back"
  end

  test "should destroy Muscle percentage" do
    visit muscle_percentage_url(@muscle_percentage)
    click_on "Destroy this muscle percentage", match: :first

    assert_text "Muscle percentage was successfully destroyed"
  end
end
