class DiffController < ApplicationController
  def show
    @repo = Repository.find( params[:repository_id] )
    @commit1  = @repo.commit(params[:commit_id])
    @commit2  = @repo.commit(params[:id])
    @diff = @repo.diff(@commit1, @commit2)
    
  end
end