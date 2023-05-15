json.extract! payroll_entry, :id, :payroll_period_id, :employee_id, :salary_id, :hours_worked, :vacation_hours, :sick_hours, :created_at, :updated_at
json.url payroll_entry_url(payroll_entry, format: :json)
