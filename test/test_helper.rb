$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)
require "pgcli/rails"
require "minitest/autorun"
require "minitest/reporters"

Minitest::Reporters.use!(
  Minitest::Reporters::ProgressReporter.new,
  ENV,
  Minitest.backtrace_filter
)
