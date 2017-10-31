class CreateCategories < ActiveRecord::Migration
  def change
    t.string :title
  end
end
