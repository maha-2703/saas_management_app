class HomeController < ApplicationController

  skip_before_action :authenticate_user!, only: [:index]

  def index

    if current_user

      if session[:project_id]

        @project = current_user.projects.find_by(id: session[:project_id])

      else

        @project = current_user.projects.first

      end

      if @project.present?

        @company_projects =
          CompanyProject.by_plan_and_project(@project.id)

      else

        @company_projects = []

      end

    end

  end

end