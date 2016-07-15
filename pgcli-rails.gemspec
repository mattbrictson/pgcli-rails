# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "pgcli/rails/version"

Gem::Specification.new do |spec|
  spec.name          = "pgcli-rails"
  spec.version       = Pgcli::Rails::VERSION
  spec.authors       = ["Matt Brictson"]
  spec.email         = ["opensource@mattbrictson.com"]

  spec.summary       = "Patches Rails dbconsole to use pgcli instead of psql"
  spec.homepage      = "https://github.com/mattbrictson/pgcli-rails"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "railties", ">= 4.2.0"

  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "chandler"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
  spec.add_development_dependency "minitest-reporters"
  spec.add_development_dependency "rubocop", ">= 0.37.2"
end
