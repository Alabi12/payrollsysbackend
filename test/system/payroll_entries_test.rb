require "application_system_test_case"

class PayrollEntriesTest < ApplicationSystemTestCase
  setup do
    @payroll_entry = payroll_entries(:one)
  end

  test "visiting the index" do
    visit payroll_entries_url
    assert_selector "h1", text: "Payroll entries"
  end

  test "should create payroll entry" do
    visit payroll_entries_url
    click_on "New payroll entry"

    fill_in "Employee", with: @payroll_entry.employee_id
    fill_in "Hours worked", with: @payroll_entry.hours_worked
    fill_in "Payroll period", with: @payroll_entry.payroll_period_id
    fill_in "Salary", with: @payroll_entry.salary_id
    fill_in "Sick hours", with: @payroll_entry.sick_hours
    fill_in "Vacation hours", with: @payroll_entry.vacation_hours
    click_on "Create Payroll entry"

    assert_text "Payroll entry was successfully created"
    click_on "Back"
  end

  test "should update Payroll entry" do
    visit payroll_entry_url(@payroll_entry)
    click_on "Edit this payroll entry", match: :first

    fill_in "Employee", with: @payroll_entry.employee_id
    fill_in "Hours worked", with: @payroll_entry.hours_worked
    fill_in "Payroll period", with: @payroll_entry.payroll_period_id
    fill_in "Salary", with: @payroll_entry.salary_id
    fill_in "Sick hours", with: @payroll_entry.sick_hours
    fill_in "Vacation hours", with: @payroll_entry.vacation_hours
    click_on "Update Payroll entry"

    assert_text "Payroll entry was successfully updated"
    click_on "Back"
  end

  test "should destroy Payroll entry" do
    visit payroll_entry_url(@payroll_entry)
    click_on "Destroy this payroll entry", match: :first

    assert_text "Payroll entry was successfully destroyed"
  end
end
