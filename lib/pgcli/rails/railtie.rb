module Pgcli
  module Rails
    class Railtie < ::Rails::Railtie
      # This code executes when Rails loads but before the dbconsole command is
      # executed. Monkey patches the Rails::DBConsole class to change the
      # executable that is used for the pg adapter from "psql" to "pgcli".
      config.before_configuration do
        require "rails/commands/dbconsole"
        class ::Rails::DBConsole
          protected

          alias original_find_cmd_and_exec find_cmd_and_exec
          def find_cmd_and_exec(commands, *args)
            commands = "pgcli" if commands == "psql"
            original_find_cmd_and_exec(commands, *args)
          end
        end
      end
    end
  end
end
