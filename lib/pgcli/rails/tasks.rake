desc "Start pgcli using connection info from database.yml"
task :pgcli do
  begin
    require "rails/commands/dbconsole"
  rescue LoadError
    require "rails/commands/dbconsole/dbconsole_command"
  end

  # APP_PATH constant must be set for DBConsole to work
  APP_PATH = Rails.root.join("config", "application") unless defined?(APP_PATH)

  opt = if Rails.version >= "5.1"
          { "--include-password" => true }
        else
          ["--include-password"]
        end

  require "pgcli/rails/monkey_patch"
  Pgcli::Rails::MonkeyPatch.apply!
  Rails::DBConsole.new(opt).start
  console.start
end
