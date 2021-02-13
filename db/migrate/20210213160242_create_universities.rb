class CreateUniversities < ActiveRecord::Migration[6.1]
  def change
    create_table :universities do |t|
      t.string :name
      t.float :score
      t.text :logo_url

      t.timestamps
    end
  end
end
