class Cart < ActiveRecord::Base
  belongs_to :user
  has_many :line_items
  has_many :items, through: :line_items

  def total
    total = 0
    line_items.each do |line_item|
      total += line_item.item.price * line_item.quantity
    end
    total
  end

  def add_item(item_id)
    line_item = LineItem.find_by(item_id: item_id, cart_id: self.id)
    if line_item.nil?
      line_item = self.line_items.new(item_id: item_id)
    else
      line_item.quantity += 1
    end
    line_item
  end

  def update_item_inventory
    self.items.each_with_index do |item, index|
      item.inventory -= self.line_items[index].quantity
      item.save
    end
  end

end
