# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "eigenclass"
  s.version = "1.1.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Sean Huber"]
  s.date = "2010-01-28"
  s.description = "Utility methods for modifying a ruby object's eigenclass/metaclass"
  s.email = "shuber@huberry.com"
  s.homepage = "http://github.com/shuber/eigenclass"
  s.rdoc_options = ["--line-numbers", "--inline-source", "--main", "README.rdoc"]
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.25"
  s.summary = "Utility methods for modifying a ruby object's eigenclass/metaclass"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
