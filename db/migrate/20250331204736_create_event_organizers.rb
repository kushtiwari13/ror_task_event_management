class CreateEventOrganizers < ActiveRecord::Migration[8.0]
  def change
    create_table :event_organizers do |t|
      t.string :name
      t.string :email

      t.timestamps
    end
  end
end
