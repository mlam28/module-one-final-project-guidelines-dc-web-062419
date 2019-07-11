require 'bundler'
# require 'figlet'
require 'artii'
require 'rainbow'


Bundler.require

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/development.db')
require_all 'lib'


