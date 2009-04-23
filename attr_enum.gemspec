# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{attr_enum}
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.2") if s.respond_to? :required_rubygems_version=
  s.authors = ["Keith McDonnell"]
  s.date = %q{2009-04-23}
  s.description = %q{Enumerated type macro for Ruby}
  s.email = %q{keith@dancingtext.com}
  s.extra_rdoc_files = ["lib/attr_enum.rb", "README.rdoc"]
  s.files = ["Rakefile", "metaid.rb", "lib/attr_enum.rb", "README.rdoc", "test/attr_enum_test.rb", "Manifest", "attr_enum.gemspec"]
  s.has_rdoc = true
  s.homepage = %q{http://github.com/kmcd/attr_enum}
  s.rdoc_options = ["--line-numbers", "--inline-source", "--title", "Attr_enum", "--main", "README.rdoc"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{attr_enum}
  s.rubygems_version = %q{1.3.2}
  s.summary = %q{Enumerated type macro for Ruby}
  s.test_files = ["test/attr_enum_test.rb"]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
