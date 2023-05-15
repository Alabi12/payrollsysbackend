require "test_helper"

class PayrollEntriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @payroll_entry = payroll_entries(:one)
  end

  test "should get index" do
    get payroll_entries_url
    assert_response :success
  end

  test "should get new" do
    get new_payroll_entry_url
    assert_response :success
  end

  test "should create payroll_entry" do
    assert_difference("PayrollEntry.count") do
      post payroll_entries_url, params: { payroll_entry: { employee_id: @payroll_entry.employee_id, hours_worked: @payroll_entry.hours_worked, payroll_period_id: @payroll_entry.payroll_period_id, salary_id: @payroll_entry.salary_id, sick_hours: @payroll_entry.sick_hours, vacation_hours: @payroll_entry.vacation_hours } }
    end

    assert_redirected_to payroll_entry_url(PayrollEntry.last)
  end

  test "should show payroll_entry" do
    get payroll_entry_url(@payroll_entry)
    assert_response :success
  end

  test "should get edit" do
    get edit_payroll_entry_url(@payroll_entry)
    assert_response :success
  end

  test "should update payroll_entry" do
    patch payroll_entry_url(@payroll_entry), params: { payroll_entry: { employee_id: @payroll_entry.employee_id, hours_worked: @payroll_entry.hours_worked, payroll_period_id: @payroll_entry.payroll_period_id, salary_id: @payroll_entry.salary_id, sick_hours: @payroll_entry.sick_hours, vacation_hours: @payroll_entry.vacation_hours } }
    assert_redirected_to payroll_entry_url(@payroll_entry)
  end

  test "should destroy payroll_entry" do
    assert_difference("PayrollEntry.count", -1) do
      delete payroll_entry_url(@payroll_entry)
    end

    assert_redirected_to payroll_entries_url
  end
end
