require 'attr_enum'
require 'test/unit'

class Muppet
  CHARACTERS = %w( fozzy kermit )
  attr_enum :charachter, CHARACTERS
end

class AttrEnumTest < Test::Unit::TestCase
  def setup
    @muppet = Muppet.new
  end
  
  def test_has_an_attr_enum
    assert @muppet.charachter.nil?
  end
  
  def test_attr_enum_accepts_vars_initialized_in_class
    Muppet::CHARACTERS.each do |charachter|
      @muppet.charachter = charachter
      assert_equal charachter, @muppet.charachter
    end
  end
  
  def test_attr_enum_does_not_accept_vars_initialized_in_class
    @muppet.charachter = 'yoda'
    assert @muppet.charachter.nil?
  end
end