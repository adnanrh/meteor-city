#!/bin/bash

# recreate database and regenerate schema.rb
# rails db:drop db:create db:migrate db:schema:dump
rails db:migrate:reset