require "rails_helper"

feature "Guest views diff commits" do
  scenario "from the diff page" do
    repo = Repository.create(name:"Git-log", working_dir: "~/rails_project/git-log")
    Repository.stub(:find).and_return(repo)
    repo.stub(:diff_commits).and_return(stubbed_commit)

    visit repository_commit_diff_path(repo,
                                      stubbed_commit.to,
                                      stubbed_commit.from)

    expect(page).to have_text "This is a diff commits"
  end

  def stubbed_commit
    @stubbed_commit ||= double("CommitLog",
                               to: "fea3aea",
                               from: "erd4fog",
                               patch: "This is a diff commits")
  end
end
