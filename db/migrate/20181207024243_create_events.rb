class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :uuid
      t.string :name
      t.string :career
      t.text :description
      t.string :location
      t.datetime :startDate
      t.datetime :endDate
      t.string :cover
      t.references :admin_user, foreign_key: true

      t.timestamps
    end
  end
end
