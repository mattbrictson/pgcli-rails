desc "Start pgcli using connection info from database.yml"
task :pgcli do
  require "pgcli/rails/dbconsole"

  # APP_PATH constant must be set for DBConsole to work
  APP_PATH = Rails.root.join("config", "application") unless defined?(APP_PATH)

  console = Pgcli::Rails::DBConsole.new(["--include-password"])
  console.start
end
