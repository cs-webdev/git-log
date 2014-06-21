require "rails_helper"

feature 'Guest view log commits' do
	scenario '' do
		
		Repository.create(:working_dir => "~/rails_project/git-log")

		visit repository_path 1


		expect(page).to have_text "Test- Guest View Repos"

	end
end