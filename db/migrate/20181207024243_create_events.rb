class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :uuid
      t.string :name
      t.string :career
      t.text :description
      t.string :location
      t.datetime :start_date
      t.datetime :end_date
      t.boolean :open_to_enroll, default: true
      t.boolean :visible_for_app, default: false
      t.integer :available_spots, default: 0
      t.string :cover
      t.references :admin_user, foreign_key: true

      t.timestamps
    end
  end
end
