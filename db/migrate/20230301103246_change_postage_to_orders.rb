class ChangePostageToOrders < ActiveRecord::Migration[6.1]
  def change
   change_column(:orders, :postage, :integer)
  end
end
