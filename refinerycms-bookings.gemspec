# Encoding: UTF-8
require 'refinery/bookings/version'

version = Refinery::bookings::Version.to_s

Gem::Specification.new do |s|
  s.platform          = Gem::Platform::RUBY
  s.name              = %q{refinerycms-bookings}
  s.version           = version
  s.description       = %q{A simple extension for managing a booking calendar}
  s.date              = Date.today.strftime("%Y-%m-%d")
  s.summary           = %q{Bookings extension for Refinery CMS}
  s.require_paths     = %w(lib)
  s.email             = %q{johan@pylonweb.dk}
  s.homepage          = %q{http://github.com/TheMaster/refinerycms-bookings}
  s.authors           = ['Johan Frølich']
  s.files             = `git ls-files`.split("\n")
  s.test_files        = `git ls-files -- spec/*`.split("\n")

  # Runtime dependencies
  s.add_dependency             'refinerycms-core',    '~> 2.0.4'

  # Development dependencies (usually used for testing)
  s.add_development_dependency 'refinerycms-testing', '~> 2.0.4'
end
