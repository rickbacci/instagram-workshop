class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :provider
      t.string :uid
      t.string :nickname
      t.string :name
      t.string :image
      t.string :bio
      t.string :website
      t.string :token
      t.string :extra

      t.timestamps null: false
    end
  end
end
