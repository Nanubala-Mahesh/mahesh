class AddColumnEmployeeCodeToEmployees < ActiveRecord::Migration
  def change
  	add_column :employees, :employees_code, :string
  end
end
