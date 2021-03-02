require 'minitest/autorun'
require 'minitest/pride'
require './lib/item'

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
end
