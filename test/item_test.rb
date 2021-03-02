require 'minitest/autorun'
require 'minitest/pride'
require './lib/item'
require './lib/auction'
require './lib/attendee'

class ItemTest < Minitest::Test
  def setup
    @item1 = Item.new('Chalkware Piggy Bank')
    @item2 = Item.new('Bamboo Picture Frame')
  end

  def test_it_exists
    assert_instance_of Item, @item1
    assert_instance_of Item, @item2
  end

  def test_it_has_attributes
    assert_equal "Chalkware Piggy Bank", @item1.name
    assert_equal "Bamboo Picture Frame", @item2.name
    assert_equal ({}), @item1.bids
    assert_equal ({}), @item2.bids
  end

  def test_add_bid
    @auction = Auction.new
    @auction.add_item(@item1)
    @attendee1 = Attendee.new(name: 'Megan', budget: '$50')
    @attendee2 = Attendee.new(name: 'Bob', budget: '$75')

    @item1.add_bid(@attendee2, 20)
    @item1.add_bid(@attendee1, 22)

    expected = {@attendee1 => 22, @attendee2 => 20}

    assert_equal expected, @item1.bids
  end

  def test_current_high_bid
    @auction = Auction.new
    @auction.add_item(@item1)
    @attendee1 = Attendee.new(name: 'Megan', budget: '$50')
    @attendee2 = Attendee.new(name: 'Bob', budget: '$75')

    @item1.add_bid(@attendee2, 20)
    @item1.add_bid(@attendee1, 22)

    expected = {@attendee1 => 22, @attendee2 => 20}
    
    assert_equal 22, @item1.current_high_bid
  end
end
