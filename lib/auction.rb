class Auction
  attr_reader :items, :item_names

  def initialize
    @items = []
  end

  def add_item(item)
    @items << item
  end

  def item_names
    @items.map {|item| item.name}
  end

  def unpopular_items
    @items.select {|item| item.bids == {}}
  end

  def potential_revenue
    popular = @items - unpopular_items
    revenue = popular.reduce(0) do |sum, item|
      sum + item.current_high_bid
    end
    revenue
  end
end
