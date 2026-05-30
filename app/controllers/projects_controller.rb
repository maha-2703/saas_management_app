class ProjectsController < ApplicationController

  before_action :set_company_project, only:[:show,:edit,:update,:destroy] 
  before_action :set_project, only: [:show,:update,:destroy,:new,:create]
  before_action :verify_project

  def index 
    @projects = Project.all 
  end 

  def show 
  end 

  def new 
  end

  def create

    @company_project = CompanyProject.new(comapny_project_params)

    respond_to do |format| 
      if @company_project.save 
        format.html {redirect_to root_url, notice: 'project was successfully created.'}
      else 
        format.html { render:new } 
      end 
    end 
  end

  def update 
    respond_to do |format| 
      if @company_project.update(company_project_params)
        format.html {redirect_to root_url,notice:"project was successfully updated"}
      else 
        format.html {render :edit }
      end 
    end 
  end

  def destroy 
    @project.destroy 
    respond_to do |format| 
      format.html {redirect_to root_url, notice: 'Project was successfully deleted.'} 
    end 
  end


  private

  def set_company_project 
    @company_project = CompanyProject.find(params[:id]) 
  end 


  def project_params
    params.require(:project).permit(
      :title,
      :details,
      :expected_completion_date, 
      :project_id
    )
  end

  def set_project 
    @project = Tenant.find(params[:project_id]) 
  end 

  def verify_project 
    unless params[:project_id] == Project.current_project_id.to_s 
      redirect_to :root, flash: {error: 'you are not authorized to access any organization other than your own'}
  
    end 
  end


end