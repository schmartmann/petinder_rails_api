class CreatePets < ActiveRecord::Migration[5.0]
  def change
    create_table :pets do |t|
      t.string :name
      t.string :picture
      t.text :description
      t.integer :pet_id
      t.string :link

      t.timestamps
    end
  end
end
