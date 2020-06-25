class RemoveRememberDigest < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :remeber_digest, :string
    add_column :users, :remember_digest, :string
  end
end
