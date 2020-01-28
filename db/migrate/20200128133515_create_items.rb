class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :manufacturer
      t.string :name
      t.float :thickness
      t.float :length
      t.string :material
      t.string :tip_material
      t.string :tip_shape
      t.string :img_path
      t.string :taper
      t.integer :price

      t.timestamps
    end
  end
end
