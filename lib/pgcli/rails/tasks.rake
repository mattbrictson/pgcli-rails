desc "Start pgcli using connection info from database.yml"
task :pgcli do
  require "pgcli/rails/dbconsole"

  # APP_PATH constant must be set for DBConsole to work
  APP_PATH = Rails.root.join("config", "application") unless defined?(APP_PATH)

  opt = if ::Rails.version >= "5.1"
          { "--include-password" => true }
        else
          ["--include-password"]
        end

  console = Pgcli::Rails::DBConsole.new(opt)
  console.start
end
