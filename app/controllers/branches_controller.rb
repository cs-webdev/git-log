class BranchesController < ApplicationController
  expose(:repository)

  def show
    @branch = @repository.get_branch(params[:id])
    @logs = @repository.branch_commits(params[:id])
  end
end
