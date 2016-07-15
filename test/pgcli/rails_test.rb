require "test_helper"

class Pgcli::RailsTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Pgcli::Rails::VERSION
  end
end
