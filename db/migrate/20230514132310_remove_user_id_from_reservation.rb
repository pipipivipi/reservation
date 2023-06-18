class RemoveUserIdFromReservation < ActiveRecord::Migration[6.1]
  def change
    remove_column :reservations, :user_id, :integer
  end
end
