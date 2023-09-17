# README

## Setup

### Bundle to Install RubyGems

bundle install

### Database (PostgreSQL)

bundle exec rails db:create

bundle exec rails db:migrate

### Rails credentials
EDITOR=nano rails credentials:edit

and enter following 

openweathermap:

 api_key: b7aef3568e4ecac4c88469f2789d2992

or copy and paste correct master key 

### Run Server

rails s

### Run Sidkeiq

bundle exec sidekiq

* sidekiq ui: /sidekiq

### API
weather report
---------------
params : 
items : number of data in each page , page : page number

Route: /weather - header : { Accept : application/json }
or
/weather.json

* eg with params : /weather.json?page=1&items=5

### view
weather report
---------------
Recent Weather
Routes: /

All Weather
Route: /weather

### Build your Tailwind CSS
rails tailwindcss:build

### Testing

* location model : rspec spec/models/location_spec.rb -f d
* weather report model : rspec spec/models/weather_report_spec.rb -f d
* weather report api : rspec spec/request/weather_controller_spec.rb -f d
* sidekiq job : rspec spec/sidekiq/weather_data_fetcher_job_test.rb -f d
