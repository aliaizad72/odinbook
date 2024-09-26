class AddOmniauthedToUsers < ActiveRecord::Migration[7.2]
  def change
    add_column :users, :omniauthed, :boolean
  end
end
