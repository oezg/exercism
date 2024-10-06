class BoutiqueInventory

  CHEAP = ->(item) { item[:price] < 30 }

  private_constant :CHEAP

  private

  attr_accessor :items

  def initialize(items)
    self.items = items
  end

  public

  def item_names
    items.map { |item| item[:name] }.sort
  end

  def cheap
    items.select(&CHEAP)
  end

  def out_of_stock
    items.select { |item| item[:quantity_by_size].empty? }
  end

  def stock_for_item(name)
    items.select { |item| item[:name] == name }.first[:quantity_by_size]
  end

  def total_stock
    items.map { |item| item[:quantity_by_size].values }.flatten.sum
  end

end
