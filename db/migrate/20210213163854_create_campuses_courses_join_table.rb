class CreateCampusesCoursesJoinTable < ActiveRecord::Migration[6.1]
  def change
    create_join_table :campuses, :courses do |t|
      t.index :campus_id
      t.index :course_id
    end
  end
end
