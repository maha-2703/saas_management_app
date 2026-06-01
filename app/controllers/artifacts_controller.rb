class ArtifactsController < ApplicationController
  before_action :set_artifact, only: %i[ show edit update destroy ]

  def index
    @artifacts = Artifact.all
  end

  def show
  end

  def new
  @artifact = Artifact.new

  if params[:company_project_id].present?
    @company_project = CompanyProject.find(params[:company_project_id])

    @artifact.company_project_id = @company_project.id
  end
 end
 
  def edit
  end

  def create
    @artifact = Artifact.new(artifact_params)

    respond_to do |format|
      if @artifact.save
        format.html {
          redirect_to company_project_path(@artifact.company_project_id),
          notice: "Artifact was successfully created."
        }

        format.json { render :show, status: :created, location: @artifact }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @artifact.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @artifact.update(artifact_params)
        format.html {
          redirect_to @artifact,
          notice: "Artifact was successfully updated."
        }

        format.json { render :show, status: :ok, location: @artifact }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @artifact.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @artifact.destroy!

    respond_to do |format|
      format.html {
        redirect_to company_project_path(@artifact.company_project_id),
        notice: "Artifact was successfully destroyed."
      }

      format.json { head :no_content }
    end
  end

  private

  def set_artifact
    @artifact = Artifact.find(params[:id])
  end

  def artifact_params
  params.require(:artifact)
        .permit(:name, :key, :company_project_id)
  end
end