class CreateTweets < ActiveRecord::Migration[5.1]
  def change
    create_table :tweets do |t|
      t.references :user
      t.string :body
      t.timestamps
    end
  end
end
