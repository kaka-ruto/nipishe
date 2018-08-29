class CreateSchools < ActiveRecord::Migration[5.2]
  def change
    create_table :schools do |t|
      t.string :name
      t.string :type_of_school
      t.string :year_of_founding

      t.timestamps
    end
  end
end
