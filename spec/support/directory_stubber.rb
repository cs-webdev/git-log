RSpec.configure do |config|
  config.before :each do
    repo = double("Repo",
                  log: [],
                  branches: double("BranchLog", local: []))
    Git.stub(:open).and_return(repo)
  end
end


