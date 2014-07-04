class DiffsController < ApplicationController
  before_filter :get_repo

  def show
    @sha  = params[:commit_id]
    @diff = @repo.diff_commits(params[:commit_id], params[:id])
  end
end
