# README

Welcome to the Battle Challenge app.
This rails app enables you to create fighters in order to make them fight in an arena.

## Test

Tests are inside the `spec` folder.
``` 
bundle exec rake db:drop RAILS_ENV=test
bundle exec rake db:create RAILS_ENV=test
bundle exec rake db:schema:load RAILS_ENV=test
bundle exec rspec spec
```

## Dependencies

* Rails version
`rails 5.1.6`

* System dependencies
`postgresql`
