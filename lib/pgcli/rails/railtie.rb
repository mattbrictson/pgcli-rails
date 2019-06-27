module Pgcli
  module Rails
    class Railtie < ::Rails::Railtie
      rake_tasks do
        load File.expand_path("tasks.rake", __dir__)
      end
    end
  end
end
