class AddFieldsToUsers < ActiveRecord::Migration[8.1]
  def change
    add_column :users, :organization_name, :string
    add_column :users, :plan, :string
  end
end
