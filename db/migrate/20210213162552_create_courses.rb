class CreateCourses < ActiveRecord::Migration[6.1]
  def change
    create_table :courses do |t|
      t.string :name
      t.string :kind
      t.string :level
      t.string :shift
      t.float :price
      t.references :university, null: false, foreign_key: true

      t.timestamps
    end
  end
end
