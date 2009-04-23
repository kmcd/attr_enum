require 'attr_enum'
require 'test/unit'

begin
  require 'rubygems'
  require 'redgreen'
rescue
end

class EnumeratedTypeTest < Test::Unit::TestCase
  SUITS = %w( clubs hearts diamonds spades )
  class Card
    attr_enum :suit, SUITS
  end

  def setup
    @card = Card.new
  end
  
  def test_should_have_getter
    assert @card.suit.nil?
  end
  
  def test_should_have_class_constant
    assert_equal SUITS, Card::SUIT_TYPES
  end
  
  def test_should_have_setter
    Card::SUIT_TYPES.each do |suit|
      @card.suit = suit
      assert_equal suit, @card.suit
    end
  end
  
  def test_should_have_type_constraint_on_setter
    error = assert_raise(EnumeratedTypeError) { @card.suit = 'spadez' }
    assert_match /Invalid type; must be one of #{SUITS.join ', ' }\./, error.message
  end
end