class AddColumnToTicket < ActiveRecord::Migration
  def change
    add_reference :tickets, :column, index: true, foreign_key: true
  end
end
