class ProjectsController < ApplicationController
  def index
    @projects = Project.all
  end

  def show
    @project = Project.find(params[:id])
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      flash[:success] = "プロジェクトを作成しました"
      redirect_to projects_url
    else
      render "projects/new"
    end
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])
    if @project.update(project_params)
      flash[:success] = "プロジェクトを更新しました"
      redirect_to projects_url
    else
      render "projects/edit"
    end
  end

  def destroy
    Project.find(params).destroy
    flash[:success] = "プロジェクトを削除しました"
    redirect_to projects_url
  end

  private
    def project_params
      params.require(:project).permit(:name, :description, :color_id)
    end
end
