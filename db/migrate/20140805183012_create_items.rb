class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.integer :inventory
    end
  end
end
