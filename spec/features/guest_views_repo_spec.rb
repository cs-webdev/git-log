require "rails_helper"

feature "Guest views repos" do
  scenario "from the home page" do
    Repository.create(name: "git-log", working_dir: "~/rails_project/git-log")

    visit root_path

    expect(page).to have_text "git-log"
  end
end
