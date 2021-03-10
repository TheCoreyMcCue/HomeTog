class AddReferencesToChatroom < ActiveRecord::Migration[6.1]
  def change
    add_reference :chatrooms, :user, null: false, foreign_key: true
    add_reference :chatrooms, :portfolio, null: false, foreign_key: true
  end
end
