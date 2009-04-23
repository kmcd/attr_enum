# = attr_enum
# A macro to define an enumeration variable
# See http://en.wikipedia.org/wiki/Enumerated_type for more info
# = Usage
#   require 'rubygems'
#   require 'attr_enum'
# 
#   class Card
#     attr_enum :suit, %w( clubs hearts diamonds spades )
#   end
# 
#   c = Card.new
#   c.suit = 'clubs'                                                                    
#   c.suit
#   => 'clubs'
#   m.suit = 'jack' 
#   => EnumeratedTypeError, Card.suit must be one of clubs, hearts, diamonds, spades.

class Module                                  
  
  # Declare an enumerated type which creates:
  # * a class constant
  # * a reader attribute
  # * a writer with type constraint
  # === Arguments
  # +name+:: the name of the enumerated type, e.g :suit                                      
  # +types+:: an array of valid types, e.g. %w( clubs hearts diamonds spades )
  # === Example
  #   class Card
  #     attr_enum :suit, %w( clubs hearts diamonds spades )
  #   end
  # ==== Class constant
  #   Card::SUITS
  #   => ["clubs", "hearts", "diamonds", "spades"]
  # ==== reader/writer attributes
  #   c = Card.new
  #   c.suit = 'clubs'
  #   c.suit
  #   => 'clubs'
  # ==== Error handling:
  #   Card.new.suit = 'spades' 
  #   => EnumeratedTypeError, Card.suit must be one of clubs, hearts, diamonds, spades.                                               
  def attr_enum(name, types)
    attr_reader name                                                                  
                                                                                                          
    class_eval do
      # Create a class constant                                                          
      const_set :"#{name.to_s.upcase}_TYPES", types
      
      define_method(:"#{name}=") do |type|
        # Add type constraint to setter method                                          
        if self.class.const_get(:"#{name.to_s.upcase}_TYPES").include?(type)
          instance_variable_set :"@#{name}", type
        else
          raise EnumeratedTypeError, "Invalid type; must be one of #{types.join(', ')}."
        end
      end
    end
  end
end

class EnumeratedTypeError < StandardError
end