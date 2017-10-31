class CreateCarts < ActiveRecord::Migration
  def change
    t.integer :user_id
  end
end
