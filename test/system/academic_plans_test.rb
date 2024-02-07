require "application_system_test_case"

class AcademicPlansTest < ApplicationSystemTestCase
  setup do
    @academic_plan = academic_plans(:one)
  end

  test "visiting the index" do
    visit academic_plans_url
    assert_selector "h1", text: "Academic plans"
  end

  test "should create academic plan" do
    visit academic_plans_url
    click_on "New academic plan"

    fill_in "Description", with: @academic_plan.description
    fill_in "Name", with: @academic_plan.name
    fill_in "Student", with: @academic_plan.student_id
    click_on "Create Academic plan"

    assert_text "Academic plan was successfully created"
    click_on "Back"
  end

  test "should update Academic plan" do
    visit academic_plan_url(@academic_plan)
    click_on "Edit this academic plan", match: :first

    fill_in "Description", with: @academic_plan.description
    fill_in "Name", with: @academic_plan.name
    fill_in "Student", with: @academic_plan.student_id
    click_on "Update Academic plan"

    assert_text "Academic plan was successfully updated"
    click_on "Back"
  end

  test "should destroy Academic plan" do
    visit academic_plan_url(@academic_plan)
    click_on "Destroy this academic plan", match: :first

    assert_text "Academic plan was successfully destroyed"
  end
end
