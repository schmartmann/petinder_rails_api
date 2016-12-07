class UpdatePetsColumn < ActiveRecord::Migration[5.0]
  def change
    # add_column :locations , :image_url, :string
    # change_column :table_name, :column_name, :old_type
    # rename_column :table, :old_column, :new_column
    add_column :pets, :city, :string
    add_column :pets, :state, :string
    rename_column :pets, :picture, :photo
    add_column :pets, :animal, :string
  end
end
