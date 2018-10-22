# README

[![CircleCI Build Status](https://circleci.com/gh/circleci/circleci-images.svg?style=shield)](https://circleci.com/gh/alegrand42/BattleChallenge)

Welcome to the Battle Challenge app.
This rails app enables you to create fighters in order to make them fight in an arena.

## Start
WARNING: The postgres database must be created first.
Its name and data are handled with the gem `figaro`, the env variables are stored in the `config/application.yml` file.
Their name can be found in the `config/database.yml` file.
Once the postgres data are set:
``` 
bin/rails db:migrate RAILS_ENV=development
```
Examples are also provided.
``` 
rake db:seed
```

## Walkthrough

First create a character, the path to player creation is on the header. Pick a name and a story for this player then choose an attack it can't overcome the value 5 same thing for its armor. Before each action a dice will be rolled to see if the armor is pierced: five id the best armor value. Once two figters are created, a battle may start. Click on the battle tab, choose 2 fighters, then press the fight button to get all data in the arena.
Any fighter can carry weapon which can increase their attack or defense rate.

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
