class RemoveDateFromReservations < ActiveRecord::Migration[6.0]
  def change
    remove_column :reservations, :date, :date
  end
end
