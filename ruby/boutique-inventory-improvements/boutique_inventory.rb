require 'ostruct'

class BoutiqueInventory

  attr_accessor :items

  def initialize(items)
    self.items = items.map { |item| OpenStruct.new(item) }
  end

  def item_names
    items.map(&:name).sort
  end

  def total_stock
    items.sum { |item| item.quantity_by_size.values.sum }
  end

end
