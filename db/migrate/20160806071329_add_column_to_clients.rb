class AddColumnToClients < ActiveRecord::Migration
  def change
    add_column :clients, :code, :string
  end
end
