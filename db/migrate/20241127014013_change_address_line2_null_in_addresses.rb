class ChangeAddressLine2NullInAddresses < ActiveRecord::Migration[7.0]
  def change
    change_column_null :addresses, :address_line2, true
  end
end
