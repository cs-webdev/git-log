class RepositoriesController < ApplicationController

	def index
		@repos = Repository.all
	end

	def show
		@repo = Repository.find params[:id]
		@logs = @repo.logs
	end

	
end