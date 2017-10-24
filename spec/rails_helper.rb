ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../dummy/config/environment", __FILE__)

require 'rails/all'

require 'pry'
require 'simplecov'
require 'factory_girl'
require 'factory_girl_rails'
require 'rspec/rails'

load 'dummy/db/schema.rb'

ActiveRecord::Schema.verbose = false

require 'spec_helper'