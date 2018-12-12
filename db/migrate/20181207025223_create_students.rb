class CreateStudents < ActiveRecord::Migration[5.2]
  def change
    create_table :students do |t|
      t.string :student_code
      t.string :career
      t.string :grade
      t.string :email
      t.string :name

      t.timestamps
    end
  end
end
