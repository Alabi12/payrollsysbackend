class CreatePayrollEntries < ActiveRecord::Migration[7.0]
  def change
    create_table :payroll_entries do |t|
      t.references :payroll_period, null: false, foreign_key: true
      t.references :employee, null: false, foreign_key: true
      t.references :salary, null: false, foreign_key: true
      t.decimal :hours_worked
      t.decimal :vacation_hours
      t.decimal :sick_hours

      t.timestamps
    end
  end
end
