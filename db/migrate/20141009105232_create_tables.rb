class CreateTables < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :username
      t.string :password
      t.string :email

      t.timestamps
    end

    create_table :tweets do |t|
      t.string :content
      t.references :user, null: false
      t.references :tweet

      t.timestamps
    end

    create_table :relationships do |t|
      t.integer :followed_id, index: true
      t.integer :follower_id, index: true
      t.timestamps
    end
    add_index :relationships, [:follower_id, :followed_id], unique: true

  end
end
