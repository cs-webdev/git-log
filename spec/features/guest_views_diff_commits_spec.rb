require "rails_helper"

feature 'Guest views diff commits' do
  scenario 'from the diff page' do
    repo = Repository.create(working_dir: "~/rails_project/git-log")
    Repository.stub(:find).and_return(repo)
    repo.stub(:diff_commits).and_return(stubbed_commit)

    visit repository_commit_diff_path(repo, stubbed_commit.sha, stubbed_commit.sha2)

    expect(page).to have_text "This is a diff commits"
  end
end

def stubbed_commit
  @stubbed_commit ||= double("CommitLog", sha: "fea3aea", sha2: "erd4fog", patch: "This is a diff commits")
end
