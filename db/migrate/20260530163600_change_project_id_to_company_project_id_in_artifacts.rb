class ChangeProjectIdToCompanyProjectIdInArtifacts < ActiveRecord::Migration[8.1]
  def change
    remove_column :artifacts, :project_id

    add_reference :artifacts,
                  :company_project,
                  foreign_key: true

  end
end


