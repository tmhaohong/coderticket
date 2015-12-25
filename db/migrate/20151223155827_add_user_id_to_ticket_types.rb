class AddUserIdToTicketTypes < ActiveRecord::Migration
  def change
    add_column :ticket_types, :user_id, :string
  end
end
