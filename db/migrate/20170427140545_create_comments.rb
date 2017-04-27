class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :body, presence: true
      t.integer :user_id, presence: true
      t.integer :commentable_id
      t.string :commentable_type
      t.timestamps(null: false)
    end
  end
end
