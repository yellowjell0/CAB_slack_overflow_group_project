class AddUserDescriptionColumn < ActiveRecord::Migration
  def change
    add_column :users, :description, :string, :default => "This user was too lazy to include a description."
  end
end
