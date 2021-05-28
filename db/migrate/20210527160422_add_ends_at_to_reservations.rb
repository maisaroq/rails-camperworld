class AddEndsAtToReservations < ActiveRecord::Migration[6.0]
  def change
    add_column :reservations, :ends_at, :date
  end
end
