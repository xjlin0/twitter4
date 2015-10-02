class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :content, null: false, limit: 140
      t.references :user, index: true, null: false, foreign_key: true
      # the above references line equals to  t.integer :user_id
      t.timestamps null: false
    end
  end
end
