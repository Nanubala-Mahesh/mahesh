class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
    	t.string :name
    	t.string :copany
    	t.string :mobile
    	t.string :email
    	t.string :website

      t.timestamps null: false
      #t.datatime :created_at
      #t.datetime :updated_at
    end
  end
end


# in place of string some more methods are integer, float, text, boolean, time, datetime