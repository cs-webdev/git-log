RSpec.configure do |config|
  config.before :each do
    branch_log = double("BranchLog", local: [])
    repo = double("Repo",
                  log: [],
                  branches: branch_log,
                  gcommit: nil)
    Git.stub(:open).and_return(repo)
  end
end


