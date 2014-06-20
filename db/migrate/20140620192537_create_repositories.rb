class CreateRepositories < ActiveRecord::Migration
  def change
    create_table :repositories do |t|
      t.string :working_dir
    end
  end
end
