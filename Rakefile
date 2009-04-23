require 'rake'
require 'rake/testtask'
require 'echoe'

task :default => [:test]

Echoe.new('attr_enum', '0.1.0') do |gem|
  gem.description = 'Enumerated type macro for Ruby'
  gem.url         = 'http://github.com/kmcd/attr_enum'
  gem.author      = 'Keith McDonnell'
  gem.email       = 'keith@dancingtext.com'
  gem.ignore_pattern = ['tmp/*', 'script/*']
  gem.development_dependencies = []                    
end