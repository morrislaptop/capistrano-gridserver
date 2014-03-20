# Capistrano::GridServer

Fixes issues related to using Capistrano with MediaTemple's grid server

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'capistrano', '~> 3.1.0'
gem 'capistrano-gridserver'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install capistrano-gridserver

## Usage

Require the module in your `Capfile`:

```ruby
require 'capistrano/gridserver'
```

`capistrano/gridserver` comes with 1 task:

* gridserver:create_relative_symlinks

To activate, simply hook the task to after the deploy:publishing hook (you may wish to do this per server so it is not hooked by default)

```ruby
after 'deploy:publishing', 'gridserver:create_relative_symlinks'
```

### Configuration

There are no configuration options. Let me know if you need some!

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
