require "rails_helper"

feature 'Guest view log commit' do
	scenario '' do
		
		Repository.create(:working_dir => "~/rails_project/git-log")

		visit commit_path 1

		expect(page).to have_text "Test- Guest View Repos"

	end
end