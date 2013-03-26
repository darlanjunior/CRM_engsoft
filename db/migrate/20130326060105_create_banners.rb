class CreateBanners < ActiveRecord::Migration
  def change
    create_table :banners do |t|
      t.integer :width
      t.integer :height
      t.string :size_type
      t.string :name
      t.binary :picture

      t.timestamps
    end
  end
end
