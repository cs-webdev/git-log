class AddColumnNameToRepositories < ActiveRecord::Migration
  def change
    add_column :repositories, :name, :string
  end
end
