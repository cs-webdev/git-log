class DiffsController < ApplicationController
  expose(:repository)

  def show
    @sha  = params[:commit_id]
    @diff = repository.diff_commits(params[:commit_id], params[:id])
  end
end
