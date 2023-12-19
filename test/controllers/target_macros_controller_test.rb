require "test_helper"

class TargetMacrosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @target_macro = target_macros(:one)
  end

  test "should get index" do
    get target_macros_url
    assert_response :success
  end

  test "should get new" do
    get new_target_macro_url
    assert_response :success
  end

  test "should create target_macro" do
    assert_difference("TargetMacro.count") do
      post target_macros_url, params: { target_macro: { calories: @target_macro.calories, carb: @target_macro.carb, fat: @target_macro.fat, protein: @target_macro.protein, user_id: @target_macro.user_id } }
    end

    assert_redirected_to target_macro_url(TargetMacro.last)
  end

  test "should show target_macro" do
    get target_macro_url(@target_macro)
    assert_response :success
  end

  test "should get edit" do
    get edit_target_macro_url(@target_macro)
    assert_response :success
  end

  test "should update target_macro" do
    patch target_macro_url(@target_macro), params: { target_macro: { calories: @target_macro.calories, carb: @target_macro.carb, fat: @target_macro.fat, protein: @target_macro.protein, user_id: @target_macro.user_id } }
    assert_redirected_to target_macro_url(@target_macro)
  end

  test "should destroy target_macro" do
    assert_difference("TargetMacro.count", -1) do
      delete target_macro_url(@target_macro)
    end

    assert_redirected_to target_macros_url
  end
end
