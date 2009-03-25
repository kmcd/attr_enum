class Module
  # A macro to define an enumeration variable
  # 
  # class Card
  #   attr_enum :suit, %w( clubs hearts diamonds spades )
  # end
  # c = Card.new
  # c.suit = 'clubs'
  # c.suit
  # => 'clubs'
  # m.suit = 'jack' 
  # => EnumeratedTypeError, Card.suit must be one of [clubs, hearts, diamonds, spades]
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