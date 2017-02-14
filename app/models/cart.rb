class Cart < ActiveRecord::Base
  belongs_to :user
  has_many :line_items
  has_many :items, through: :line_items

  def total
    total = 0
    items.each do |item|
      total += item.price
    end
    total
  end

  def add_item(item_id)
    line_item = LineItem.find_by(item_id: item_id, cart_id: self.id)
    if line_item.nil?
      line_item = self.line_items.new(item_id: item_id)
    end
    line_item
  end


end
