class CreateInitializeTables < ActiveRecord::Migration[5.0]
  def change
    create_users
    create_tweets
  end

  private

  def create_users
    create_table :users do |t|
      t.string :name
      t.string :password_digest

      t.timestamps
    end

    add_index :users, :name, unique: true
  end

  def create_tweets
    create_table :tweets do |t|
      t.references :user
      t.string :body
      t.timestamps
    end
  end
end
