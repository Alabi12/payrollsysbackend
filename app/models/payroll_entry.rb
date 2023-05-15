class PayrollEntry < ApplicationRecord
  belongs_to :payroll_period
  belongs_to :employee
  belongs_to :salary
end
