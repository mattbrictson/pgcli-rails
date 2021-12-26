require_relative "lib/pgcli/rails/version"

Gem::Specification.new do |spec|
  spec.name = "pgcli-rails"
  spec.version = Pgcli::Rails::VERSION
  spec.authors = ["Matt Brictson"]
  spec.email = ["opensource@mattbrictson.com"]

  spec.summary = "Replaces the Rails PostgreSQL dbconsole with the much nicer pgcli"
  spec.homepage = "https://github.com/mattbrictson/pgcli-rails"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata = {
    "bug_tracker_uri" => "https://github.com/mattbrictson/pgcli-rails/issues",
    "changelog_uri" => "https://github.com/mattbrictson/pgcli-rails/releases",
    "source_code_uri" => "https://github.com/mattbrictson/pgcli-rails",
    "homepage_uri" => spec.homepage,
    "rubygems_mfa_required" => "true"
  }

  # Specify which files should be added to the gem when it is released.
  spec.files = Dir.glob(%w[LICENSE.txt README.md {exe,lib}/**/*]).reject { |f| File.directory?(f) }
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "railties", ">= 4.2.0"
end
