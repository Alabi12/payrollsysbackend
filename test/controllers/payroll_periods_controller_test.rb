require "test_helper"

class PayrollPeriodsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @payroll_period = payroll_periods(:one)
  end

  test "should get index" do
    get payroll_periods_url
    assert_response :success
  end

  test "should get new" do
    get new_payroll_period_url
    assert_response :success
  end

  test "should create payroll_period" do
    assert_difference("PayrollPeriod.count") do
      post payroll_periods_url, params: { payroll_period: { end_date: @payroll_period.end_date, start_date: @payroll_period.start_date } }
    end

    assert_redirected_to payroll_period_url(PayrollPeriod.last)
  end

  test "should show payroll_period" do
    get payroll_period_url(@payroll_period)
    assert_response :success
  end

  test "should get edit" do
    get edit_payroll_period_url(@payroll_period)
    assert_response :success
  end

  test "should update payroll_period" do
    patch payroll_period_url(@payroll_period), params: { payroll_period: { end_date: @payroll_period.end_date, start_date: @payroll_period.start_date } }
    assert_redirected_to payroll_period_url(@payroll_period)
  end

  test "should destroy payroll_period" do
    assert_difference("PayrollPeriod.count", -1) do
      delete payroll_period_url(@payroll_period)
    end

    assert_redirected_to payroll_periods_url
  end
end
