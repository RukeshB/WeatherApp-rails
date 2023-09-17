# README

## Setup

### Bundle to Install RubyGems

bundle install

### Database (PostgreSQL)

bundle exec rails db:create

bundle exec rails db:migrate

### Run Server

rails s

### Run Sidkeiq

bundle exec sidekiq

* sidekiq ui : /sidekiq

### api
weather report
---------------
params : items : number of data in each page , page : page number

/weather - header : { Accept : application/json }
or
/weather.json

* eg with params : /weather.json?page=1&items=5

### view
weather report
---------------
/weather


### Testing

* location model : rspec spec/models/location_spec.rb -f d
* weather report model : rspec spec/models/weather_report_spec.rb -f d
* weather report api : rspec spec/request/weather_controller_spec.rb -f d
* sidekiq job : rspec spec/sidekiq/weather_data_fetcher_job_test.rb -f d
