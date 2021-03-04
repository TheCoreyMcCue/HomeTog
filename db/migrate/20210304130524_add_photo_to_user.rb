class AddPhotoToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :photo, :string
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
  end
end
