class CreateLineItems < ActiveRecord::Migration
  def change
    create_table :line_items do |t|
      t.integer :quantity, default: 1
      t.belongs_to :item
      t.belongs_to :cart
    end
  end
end
