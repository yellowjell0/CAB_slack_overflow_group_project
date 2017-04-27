class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :user_name, presence: true
      t.string :email, uniqueness: true, presence: true
      t.string :hashed_password, presence: true
      t.timestamps(null: false)
    end
  end
end
