require "rails_helper"
require "spec_helper"

feature 'Guest view repos' do
	scenario '' do
		Repository.create(:working_dir => "git-log")
		
		visit root_path

		expect(page).to have_text "git-log"

	end
end