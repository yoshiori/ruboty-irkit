# Ruboty::Irkit

Ruboty Handler for [IRKit](http://getirkit.com/).
This handler use [ruby-irkit](https://github.com/shokai/ruby-irkit)'s JSON data.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'ruboty-irkit'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ruboty-irkit

## Usage

```
> ruboty irkit cooling_25
Execute cooling_25 to IRKit.
```

## ENV

key  | value
--------------- | -------------
IRKIT_JSON_URL  | IRKit JSON data url. (e.g. [this](https://www.dropbox.com/s/b2yz9o6ft223vuh/.irkit.json?raw=1))
IRKIT_CLIENTKEY | IRKit clientkey.
IRKIT_DEVICEID  | IRKit deviceid.

## Contributing

1. Fork it ( https://github.com/yoshiori/ruboty-irkit/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
