class CreateFavoriteEmployees < ActiveRecord::Migration
  def change
    create_table :favorite_employees do |t|
      t.references :user, index: true, foreign_key: true
      t.references :person, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
