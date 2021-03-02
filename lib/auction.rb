class Auction
  attr_reader :items,
              :item_names

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

  def popular_items
    @items - unpopular_items
  end

  def potential_revenue
    revenue = popular_items.reduce(0) do |sum, item|
      sum + item.current_high_bid
    end
    revenue
  end

  def bidders
    bid_people = []
    popular_items.each do |item|
      item.bids.keys.each do |attendee|
        bid_people << attendee.name
      end
    end
    bid_people.uniq
  end

  def bidder_info
    info = Hash.new {|hash, key| hash[key] = {}}
    popular_items.each do |item|
      item.bids.keys.each do |attendee|
        info[attendee] if info[attendee].nil?
        info[attendee] = {budget: attendee.budget}
        if info[attendee][:items].nil?
          info[attendee][:items] = [item]
        else
          info[attendee][:items] << item
        end
      end
    end
    info
  end
end
