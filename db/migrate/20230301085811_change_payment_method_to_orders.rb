class ChangePaymentMethodToOrders < ActiveRecord::Migration[6.1]
  def change
   change_column(:orders, :payment_method, :integer)
  end
end
