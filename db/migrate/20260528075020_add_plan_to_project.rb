class AddPlanToProject < ActiveRecord::Migration[8.1]
  def change
    add_column :projects, :plan, :string
  end
end
