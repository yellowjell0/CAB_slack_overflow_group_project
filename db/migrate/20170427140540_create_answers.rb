class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.string :body, presence: true
      t.integer :comment_id
      t.integer :user_id
      t.timestamps(null: false)
    end
  end
end
