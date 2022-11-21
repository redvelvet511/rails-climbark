class CreateRoutes < ActiveRecord::Migration[7.0]
  def change
    create_table :routes do |t|
      t.string :name
      t.string :grade
      t.string :type
      t.text :description
      t.string :location
      t.string :protection
      t.references :area, null: false, foreign_key: true

      t.timestamps
    end
  end
end
