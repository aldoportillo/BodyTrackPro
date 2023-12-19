require "application_system_test_case"

class TargetMacrosTest < ApplicationSystemTestCase
  setup do
    @target_macro = target_macros(:one)
  end

  test "visiting the index" do
    visit target_macros_url
    assert_selector "h1", text: "Target macros"
  end

  test "should create target macro" do
    visit target_macros_url
    click_on "New target macro"

    fill_in "Calories", with: @target_macro.calories
    fill_in "Carb", with: @target_macro.carb
    fill_in "Fat", with: @target_macro.fat
    fill_in "Protein", with: @target_macro.protein
    fill_in "User", with: @target_macro.user_id
    click_on "Create Target macro"

    assert_text "Target macro was successfully created"
    click_on "Back"
  end

  test "should update Target macro" do
    visit target_macro_url(@target_macro)
    click_on "Edit this target macro", match: :first

    fill_in "Calories", with: @target_macro.calories
    fill_in "Carb", with: @target_macro.carb
    fill_in "Fat", with: @target_macro.fat
    fill_in "Protein", with: @target_macro.protein
    fill_in "User", with: @target_macro.user_id
    click_on "Update Target macro"

    assert_text "Target macro was successfully updated"
    click_on "Back"
  end

  test "should destroy Target macro" do
    visit target_macro_url(@target_macro)
    click_on "Destroy this target macro", match: :first

    assert_text "Target macro was successfully destroyed"
  end
end
