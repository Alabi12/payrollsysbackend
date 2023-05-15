require "application_system_test_case"

class PayrollPeriodsTest < ApplicationSystemTestCase
  setup do
    @payroll_period = payroll_periods(:one)
  end

  test "visiting the index" do
    visit payroll_periods_url
    assert_selector "h1", text: "Payroll periods"
  end

  test "should create payroll period" do
    visit payroll_periods_url
    click_on "New payroll period"

    fill_in "End date", with: @payroll_period.end_date
    fill_in "Start date", with: @payroll_period.start_date
    click_on "Create Payroll period"

    assert_text "Payroll period was successfully created"
    click_on "Back"
  end

  test "should update Payroll period" do
    visit payroll_period_url(@payroll_period)
    click_on "Edit this payroll period", match: :first

    fill_in "End date", with: @payroll_period.end_date
    fill_in "Start date", with: @payroll_period.start_date
    click_on "Update Payroll period"

    assert_text "Payroll period was successfully updated"
    click_on "Back"
  end

  test "should destroy Payroll period" do
    visit payroll_period_url(@payroll_period)
    click_on "Destroy this payroll period", match: :first

    assert_text "Payroll period was successfully destroyed"
  end
end
