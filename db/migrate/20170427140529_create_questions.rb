class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :body, presence: true
      t.integer :comment_id
      t.integer :user_id
      t.timestamps(null: false)
    end
  end
end
