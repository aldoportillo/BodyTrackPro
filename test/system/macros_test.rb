require "application_system_test_case"

class MacrosTest < ApplicationSystemTestCase
  setup do
    @macro = macros(:one)
  end

  test "visiting the index" do
    visit macros_url
    assert_selector "h1", text: "Macros"
  end

  test "should create macro" do
    visit macros_url
    click_on "New macro"

    fill_in "Added sugar", with: @macro.added_sugar
    fill_in "Calories", with: @macro.calories
    fill_in "Carb", with: @macro.carb
    fill_in "Fat", with: @macro.fat
    fill_in "Protein", with: @macro.protein
    fill_in "Sugar", with: @macro.sugar
    fill_in "User", with: @macro.user_id
    click_on "Create Macro"

    assert_text "Macro was successfully created"
    click_on "Back"
  end

  test "should update Macro" do
    visit macro_url(@macro)
    click_on "Edit this macro", match: :first

    fill_in "Added sugar", with: @macro.added_sugar
    fill_in "Calories", with: @macro.calories
    fill_in "Carb", with: @macro.carb
    fill_in "Fat", with: @macro.fat
    fill_in "Protein", with: @macro.protein
    fill_in "Sugar", with: @macro.sugar
    fill_in "User", with: @macro.user_id
    click_on "Update Macro"

    assert_text "Macro was successfully updated"
    click_on "Back"
  end

  test "should destroy Macro" do
    visit macro_url(@macro)
    click_on "Destroy this macro", match: :first

    assert_text "Macro was successfully destroyed"
  end
end
