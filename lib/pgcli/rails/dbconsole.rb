begin
  require "rails/commands/dbconsole"
rescue LoadError
  require "rails/commands/dbconsole/dbconsole_command"
end

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
