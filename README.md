# pgcli-rails

[![Gem Version](https://badge.fury.io/rb/pgcli-rails.svg)](http://badge.fury.io/rb/pgcli-rails)

[pgcli][] is a command-line interface for PostgreSQL that offers many improvements over `psql`, like auto-completion and syntax highlighting. Wouldn't it be nice to have a convenient way to use `pgcli` with your Rails app?

That's where the pgcli-rails gem comes in. It adds a `pgcli` Rake task to your Rails app. Use it in place of `rails dbconsole`.

# Usage

Add the gem to your Gemfile and run `bundle install`:

```ruby
gem "pgcli-rails"
```

Running the `pgcli` Rake task automatically uses your `database.yml` to launch pgcli with the correct connection options:

```
$ bin/rake pgcli
Version: 1.0.0
Chat: https://gitter.im/dbcli/pgcli
Mail: https://groups.google.com/forum/#!forum/pgcli
Home: http://pgcli.com
my_app_development>



 [F2] Smart Completion: ON  [F3] Multiline: OFF  [F4] Emacs-mode
```

Other ways to use it:

```
# Rails 5 also supports running Rake tasks via the rails command
bin/rails pgcli

# Connect to the test database
RAILS_ENV=test bin/rake pgcli
```

## Requirements

* Rails 4.2+ using PostgreSQL
* Ruby 2.4.0+
* [pgcli][] (`brew install pgcli` to install on macOS)

## How it works

pgcli-rails is simply a Rake task that reuses the existing `Rails::DBConsole` command class provided by Rails. It subclasses DBConsole to execute `pgcli` instead of `psql`. All you need to do is require the pgcli-rails gem by placing it in your Gemfile.

## Configuration

There is no configuration. Like `rails dbconsole`, it simply uses your ActiveRecord database connection as specified in `database.yml`.

## Roadmap

pgcli-rails is little more than a proof-of-concept at this point. Next steps are:

* Add tests
* Use [Appraisal][] to test against multiple versions of Rails
* Set up Travis CI

If you have other ideas, open an issue on GitHub!

## Contributing

Code contributions are also welcome! Read [CONTRIBUTING.md](CONTRIBUTING.md) to get started.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

[pgcli]: http://pgcli.com
[Appraisal]: https://github.com/thoughtbot/appraisal
