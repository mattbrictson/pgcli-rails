# pgcli-rails

[![Gem Version](https://badge.fury.io/rb/pgcli-rails.svg)](http://badge.fury.io/rb/pgcli-rails)

Wouldn't it be great if `rails dbconsole` used [pgcli][] instead of psql?

```ruby
gem "pgcli-rails", groups: %w(development test)
```

Now it does.

```
$ rails dbconsole
Version: 1.0.0
Chat: https://gitter.im/dbcli/pgcli
Mail: https://groups.google.com/forum/#!forum/pgcli
Home: http://pgcli.com
my_app_development>



 [F2] Smart Completion: ON  [F3] Multiline: OFF  [F4] Emacs-mode
```

## Requirements

* Rails 4.2+ using PostgreSQL
* Ruby 1.9.3+
* [pgcli][] (`brew install pgcli` to install on macOS)

## How it works

pgcli-rails is a monkey patch. Using a `Rails::Railtie` callback, it hooks into the Rails load process and patches the `Rails::DBConsole` class to execute `pgcli` instead of `psql`. All you need to do is require the pgcli-rails gem by placing it in your Gemfile.

## Configuration

There is no configuration to speak of, but you can control which environment(s) use `pgcli` by specifying the appropriate group in the Gemfile.

```ruby
# Use pgcli in *all* environments (including production)
gem "pgcli-rails"
```

```ruby
# Use pgcli only in development and test environments
gem "pgcli-rails", groups: %w(development test)
```

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
