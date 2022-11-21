class CreateClimbs < ActiveRecord::Migration[7.0]
  def change
    create_table :climbs do |t|
      t.string :status
      t.text :description
      t.date :completion_date
      t.references :route, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
