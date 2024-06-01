module Pgcli
  module Rails
    module MonkeyPatch
      def self.apply!
        if ::Rails.gem_version >= Gem::Version.new("7.1.0")
          require "active_record/connection_adapters/postgresql_adapter"
          ActiveRecord::ConnectionAdapters::PostgreSQLAdapter.singleton_class.prepend self
        else
          ::Rails::DBConsole.prepend self
        end
      end

      def find_cmd_and_exec(commands, *args)
        commands = "pgcli" if commands == "psql"
        super
      end
    end
  end
end
