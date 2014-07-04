class RepositoriesController < ApplicationController

  def index
    @repos = Repository.all
  end

  def new
    @repo = Repository.new
  end

  def edit
    @repo = Repository.find params[:id]
  end

  def create
    @repo = Repository.new(article_params)
    if @repo.save
      redirect_to root_path
    else
      flash[:notice] = "Verify all fields"
      render :new
    end
  end

  def show
    @repo = Repository.find params[:id]
    @logs = @repo.logs
    @branches = @repo.branches
  end

  private

  def repo_params
    params.require(:repository).permit(:working_dir, :name)
  end
end
