desc "Start pgcli using connection info from database.yml"
task :pgcli do
  begin
    require "rails/commands/dbconsole"
  rescue LoadError
    require "rails/commands/dbconsole/dbconsole_command"
  end

  # APP_PATH constant must be set for DBConsole to work
  APP_PATH = Rails.root.join("config", "application") unless defined?(APP_PATH)

  opt = if Rails.gem_version >= Gem::Version.new("7.1.0")
          { include_password: true }
        elsif Rails.gem_version >= Gem::Version.new("5.1.0")
          { "--include-password" => true }
        else
          ["--include-password"]
        end

  require "pgcli/rails/monkey_patch"
  Pgcli::Rails::MonkeyPatch.apply!
  Rails::DBConsole.new(opt).start
  console.start
end
