# Nationality
[![Gem Version](https://badge.fury.io/rb/nationality.svg)](https://badge.fury.io/rb/nationality)

by [Jose Marie Antonio Miñoza](https://github.com/JomaMinoza)

Provides listing of nationality that you may need in your ruby applications.

Data in this gem was taken from Github GIST and the following repos:

* [marijn/README.markdown](https://gist.github.com/marijn/274449#file-nationalities-yaml)

## Installation

Add this line to your application's Gemfile:

    gem 'nationality', '~> 1.0.7'
   

or

    gem 'nationality', '~> 1.0.7', git: 'https://github.com/JomaMinoza/nationality'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install nationality

## Usage

This gem provides the following constant arrays:

* `Nationality::NATIONALITY`
```ruby
  Nationality::Nationality.default_option("filipino")
```

## Pre selected option for Select Helper

Customize `options_for_select` with default nationality for your Rails application.

```ruby
= f.select :nationality, options_for_select(Nationality::Nationality.default_option("filipino"), :selected => f.object.nationality), {include_blank: "What's your nationality?"}, {:class => 'form-control' }
```

## Includes larger list of nationalities  and some alternative spellings + 300 more options
* `Nationality::NATIONALITY_EXPANDED_SPELLING` - list of possible alternative spellings, plus additional nationalities, extracted from some Wikipedia parsing. Suggested use - various text processing.

```ruby
Nationality::Nationality.default_option("Belorussian", :expanded)
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## License

[MIT](LICENSE.txt)
