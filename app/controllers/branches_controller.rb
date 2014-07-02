class BranchesController < ApplicationController
  before_filter :get_repo

  def get_repo
    @repo = Repository.find(params[:repository_id])
  end

  def show
    @branch = @repo.get_branch(params[:id])
    @logs = @repo.branch_commits(params[:id])
  end
end
