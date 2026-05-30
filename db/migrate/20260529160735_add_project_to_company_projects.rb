class AddProjectToCompanyProjects < ActiveRecord::Migration[8.1]
  def change
    add_reference :company_projects, :project, null: false, foreign_key: true
  end
end
