class CreateTickets < ActiveRecord::Migration[8.0]
  def change
    create_table :tickets do |t|
      t.references :event, null: false, foreign_key: true
      t.string :name
      t.decimal :price
      t.boolean :availability

      t.timestamps
    end
  end
end
