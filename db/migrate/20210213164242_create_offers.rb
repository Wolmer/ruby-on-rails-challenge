class CreateOffers < ActiveRecord::Migration[6.1]
  def change
    create_table :offers do |t|
      t.float :price_with_discount
      t.float :discount_percentage
      t.string :enrollment_semester
      t.boolean :enabled
      t.date :start_date
      t.references :course, null: false, foreign_key: true

      t.timestamps
    end
  end
end
