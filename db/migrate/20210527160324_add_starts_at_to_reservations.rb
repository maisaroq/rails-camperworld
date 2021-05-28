class AddStartsAtToReservations < ActiveRecord::Migration[6.0]
  def change
    add_column :reservations, :starts_at, :date
  end
end
