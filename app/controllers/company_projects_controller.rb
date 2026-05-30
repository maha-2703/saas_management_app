class CompanyProjectsController < ApplicationController
  before_action :set_company_project, only: %i[ show edit update destroy ]

  # GET /company_projects or /company_projects.json
  def index
    @company_projects = CompanyProject.all
  end

  # GET /company_projects/1 or /company_projects/1.json
  def show
  end

  # GET /company_projects/new
  def new

  @project = current_user.projects.first

  if @project.nil?
    redirect_to root_path, alert: "No project found"
    return
  end

  @company_project = CompanyProject.new

end
  

  # GET /company_projects/1/edit
  def edit
  end

  # POST /company_projects or /company_projects.json
  def create
  @project = current_user.projects.first
  @company_project = @project.company_projects.new(company_project_params)

  if @company_project.save
    redirect_to @company_project, notice: "Created"
  else
    render :new
  end
end

  # PATCH/PUT /company_projects/1 or /company_projects/1.json
  def update
    respond_to do |format|
      if @company_project.update(company_project_params)
        format.html { redirect_to @company_project, notice: "Company project was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @company_project }
      else
        format.html { render :edit, status: :unprocessable_content }
        format.json { render json: @company_project.errors, status: :unprocessable_content }
      end
    end
  end

  # DELETE /company_projects/1 or /company_projects/1.json
  def destroy
    @company_project.destroy!

    respond_to do |format|
      format.html { redirect_to company_projects_path, notice: "Company project was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_company_project
      @company_project = CompanyProject.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def company_project_params
  params.require(:company_project).permit(
    :title,
    :details,
    :expected_completion_date,
    :project_id
  )
end
end


