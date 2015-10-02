class CreateFollowships < ActiveRecord::Migration
  def change
    create_table :followships do |t|
      t.references :followee, index: true, null: false#, foreign_key: true
      t.references :follower, index: true, null: false#, foreign_key: true
      #the above foreign_key: true option will annoy MySQL and cause error in db:migrate
      t.timestamps null: false
    end #The following index use the pair as the key to ensure uniqueness
    add_index :followships, [:followee_id, :follower_id], unique: true
  end
end
