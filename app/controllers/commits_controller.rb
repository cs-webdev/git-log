class CommitsController < ApplicationController
	
	def show
		repo = Repository.find( params[:repository_id] )
		@commit  = repo.commit(params[:id])
	end

end