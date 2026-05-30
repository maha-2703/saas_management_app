class CreateCompanyProjects < ActiveRecord::Migration[8.1]
  def change
    create_table :company_projects do |t|
      t.string :title
      t.string :details
      t.date :expected_completion_date
      t.belongs_to :project, null: false, foreign_key: true

      t.timestamps
    end
  end
end
