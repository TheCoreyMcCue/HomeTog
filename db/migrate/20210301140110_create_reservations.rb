class CreateReservations < ActiveRecord::Migration[6.1]
  def change
    create_table :reservations do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :total_price
      t.datetime :date
      t.boolean :approved, default: false
      t.references :portfolio, null: false, foreign_key: true

      t.timestamps
    end
  end
end
