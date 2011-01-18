class CreatePlaces < ActiveRecord::Migration
  def self.up
    create_table :places do |t|
      t.string :name
      t.string :street
      t.string :city
      t.string :state
      t.string :postal_code
      t.float :lat
      t.float :lng
      t.text :directions

      t.timestamps
    end
  end

  def self.down
    drop_table :places
  end
end
