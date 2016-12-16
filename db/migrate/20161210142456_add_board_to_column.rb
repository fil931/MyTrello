class AddBoardToColumn < ActiveRecord::Migration
  def change
    add_reference :columns, :board, index: true, foreign_key: true
  end
end
