class CreatePortfolios < ActiveRecord::Migration[6.1]
  def change
    create_table :portfolios do |t|
      t.string :name
      t.string :location
      t.references :user, null: false, foreign_key: true
      t.text :description
      t.integer :price

      t.timestamps
    end
  end
end
