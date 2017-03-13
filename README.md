# Sidekiq::ProcessHealth::Check

> <br/>*Developed by Patches 02/13/2017 - present* <br/>
> 
> <br/>Sidekiq: 4.2.9
> <br/>Rails: 5.0.2
> <br/>Ruby: 2.4<br/><br/>

Please check the [Wiki](https://github.com/isuPatches/sidekiq-process-health-check/wiki/) for rules on contributing and how to report issues.

[![Gem Version](https://badge.fury.io/rb/sidekiq-process-health-check.svg)](https://badge.fury.io/rb/sidekiq-process-health-check)

[![Build Status](https://travis-ci.org/isuPatches/sidekiq-process-health-check.svg?branch=master)](https://travis-ci.org/isuPatches/sidekiq-process-health-check)

[![Code Climate](https://codeclimate.com/github/isuPatches/sidekiq-process-health-check/badges/gpa.svg)](https://codeclimate.com/github/isuPatches/sidekiq-process-health-check)

[![Test Coverage](https://codeclimate.com/github/isuPatches/sidekiq-process-health-check/badges/coverage.svg)](https://codeclimate.com/github/isuPatches/sidekiq-process-health-check/coverage)

[![Issue Count](https://codeclimate.com/github/isuPatches/sidekiq-process-health-check/badges/issue_count.svg)](https://codeclimate.com/github/isuPatches/sidekiq-process-health-check)

[![Dependency Status](https://gemnasium.com/badges/github.com/isuPatches/sidekiq-process-health-check.svg)](https://gemnasium.com/github.com/isuPatches/sidekiq-process-health-check)

## Installation

Add one of the following lines to your application's Gemfile:

```ruby
gem 'sidekiq-process-health-check'
```

or 

```ruby
gem 'sidekiq-process-health-check', git: 'https://github.com/isuPatches/sidekiq-process-health-check'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install sidekiq-process-health-check
    
Add the following to your application.rb:

```ruby
require 'sidekiq/process_health/check'
```

## Usage

### Configuration

There are two main configuration options for this gem...they are expected_number_of_processes and job_threshold.

All you need is an initializer to override the defaults:

```ruby
 Sidekiq::ProcessHealth::Check.configure do |config|
    config.expected_number_of_processes = 4
    config.job_threshold = 10
  end
```

By default expected_number_of_processes will be 1 and job_threshold will be 50.

### Mounting

There are two options for mounting the routes required.  There is an engine you can mount in routes.rb:

```ruby
  mount Sidekiq::ProcessHealth::Check::Engine => '/health'
```
    
Or you can include the concern in a controller as shown below:
   
```ruby
module Health
  class SidekiqController < ApplicationController
    respond_to :json
    include Sidekiq::ProcessHealth::Check::Controller
  end
end
```

And update the routes.rb:
    
```ruby
namespace :health do
  get '/sidekiq', :to => 'sidekiq#show'
end
```
  
## Development

After checking out the repo, run `bundle install` to install dependencies. Then, run `bundle exec rspec` to run the tests.

To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/isuPatches/sidekiq-process-health-check. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

