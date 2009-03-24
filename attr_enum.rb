class Module
  # A macro to define an enumeration variable
  # 
  # class Muppet
  #   attr_enum :charachter, %w( fozzy )
  # end
  # m = Muppet.new
  # m.charachter = 'fozzy'
  # m.charachter
  # => 'fozzy'
  # m.charachter = 'dumbo' 
  # => AttrEnumException, Muppet charachter must be one of [fozzy]
  def attr_enum(name, types)
    attr_reader name
    
    class_eval do
      const_set :"#{name.to_s.upcase}_TYPES", types
      
      define_method(:"#{name}=") do |type|
        if self.class.const_get(:"#{name.to_s.upcase}_TYPES").include?(type)
          instance_variable_set :"@#{name}", type
        else
          raise Exception, 'Invalid type'
        end
      end
    end
  end
end

class Foo; attr_enum :bar, %w( baz boing ) end
puts Foo::BAR_TYPES.inspect

foo = Foo.new
foo.bar = 'boing'
puts foo.bar
foo.bar = 'bag'
puts foo.bar