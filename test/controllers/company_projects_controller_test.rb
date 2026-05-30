require "test_helper"

class CompanyProjectsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @company_project = company_projects(:one)
  end

  test "should get index" do
    get company_projects_url
    assert_response :success
  end

  test "should get new" do
    get new_company_project_url
    assert_response :success
  end

  test "should create company_project" do
    assert_difference("CompanyProject.count") do
      post company_projects_url, params: { company_project: { details: @company_project.details, expected_completion_date: @company_project.expected_completion_date, project_id: @company_project.project_id, title: @company_project.title } }
    end

    assert_redirected_to company_project_url(CompanyProject.last)
  end

  test "should show company_project" do
    get company_project_url(@company_project)
    assert_response :success
  end

  test "should get edit" do
    get edit_company_project_url(@company_project)
    assert_response :success
  end

  test "should update company_project" do
    patch company_project_url(@company_project), params: { company_project: { details: @company_project.details, expected_completion_date: @company_project.expected_completion_date, project_id: @company_project.project_id, title: @company_project.title } }
    assert_redirected_to company_project_url(@company_project)
  end

  test "should destroy company_project" do
    assert_difference("CompanyProject.count", -1) do
      delete company_project_url(@company_project)
    end

    assert_redirected_to company_projects_url
  end
end
