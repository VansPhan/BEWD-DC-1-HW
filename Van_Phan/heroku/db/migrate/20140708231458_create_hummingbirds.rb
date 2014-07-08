class CreateHummingbirds < ActiveRecord::Migration
  def change
    create_table :hummingbirds do |t|
      t.string :anime
      t.integer :rating

      t.timestamps
    end
  end
end
