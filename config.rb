require 'active_record'
require 'minitest/autorun'
require 'logger'
require 'database_cleaner'
require 'minitest/around/unit'

Minitest::Test = MiniTest::Unit::TestCase unless defined?(Minitest::Test)

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: ':memory:')
ActiveRecord::Base.logger = Logger.new(STDOUT)

DatabaseCleaner.strategy = :transaction
DatabaseCleaner.clean_with(:truncation)

ActiveRecord::Schema.define do
  create_table :posts, force: true do |t|
    t.string :post_type
  end

  create_table :comments, force: true do |t|
    t.integer :post_id
  end
end
