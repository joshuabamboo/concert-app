class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :provider
      t.string :uid
      t.string :name
      t.string :image_url
      t.string :rspotify_hash
      t.string :location

      t.timestamps
    end
  end
end
