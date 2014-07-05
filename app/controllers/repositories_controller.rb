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
    @repo = Repository.new(repo_params)
    if @repo.save
      redirect_to root_path
    else
      flash[:notice] = "Verify all fields"
      render :new
    end
  end

  def update
    @repo = Repository.find(params[:id])
    if @repo.update(repo_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    Repository.find(params[:id]).destroy
    redirect_to root_path
  end

  def show
    @repo = Repository.find params[:id]
    @logs = @repo.logs
    @branches = @repo.branches
    @stats_by_author = @repo.group_by_day
	end

  private

  def repo_params
    params.require(:repository).permit(:working_dir, :name)
  end
end
