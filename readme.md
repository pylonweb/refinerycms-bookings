# Refinery CMS Bookings
## About

Bookings is a simple extension for [Refinery CMS](http://refinerycms.com). It comes with a simple datepicker calendar, where you can select ranges of dates, to quickly and easily manage availability for any dates.

## Requirements

* refinerycms >= 2.0.0


## Install
Add this line to your applications `Gemfile`

Open up your `Gemfile` and add at the bottom this line:

```ruby
gem 'refinerycms-bookings', '~> 2.0.0'
```


Next to install, and generate migration run:

```bash
bundle install
rails generate refinery:bookings
rake db:migrate
rake db:seed
```

## Developing & Contributing

The version of Refinery to develop this engine against is defined in the gemspec. To override the version of refinery to develop against, edit the project Gemfile to point to a local path containing a clone of refinerycms.

### Testing

Generate the dummy application to test against

    $ bundle exec rake refinery:testing:dummy_app

Run the test suite with [Guard](https://github.com/guard/guard)

    $ bundle exec guard start

Or just with rake spec

    $ bundle exec rake spec

