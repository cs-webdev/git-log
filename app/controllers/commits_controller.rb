require "#{Rails.root}/app/facade/commit_facade.rb"
class CommitsController < ApplicationController
  expose(:repository)

  def show
    @commit = CommitFacade.new repository, params[:id]
	end
  
end
