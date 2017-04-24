class AddUserIdToQun < ActiveRecord::Migration[5.0]
  def change
    add_column :quns, :user_id, :integer
  end
end
