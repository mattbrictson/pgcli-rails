require "rails/commands/dbconsole"

module Pgcli
  module Rails
    # Subclass the built-in Rails DBConsole to override "psql" with "pgcli".
    class DBConsole < ::Rails::DBConsole
      protected

      def find_cmd_and_exec(commands, *args)
        commands = "pgcli" if commands == "psql"
        super(commands, *args)
      end
    end
  end
end
