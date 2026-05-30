json.extract! company_project, :id, :title, :details, :expected_completion_date, :project_id, :created_at, :updated_at
json.url company_project_url(company_project, format: :json)
