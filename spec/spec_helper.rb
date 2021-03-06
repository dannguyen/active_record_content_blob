$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'rspec'
require 'active_record'
require 'database_cleaner'
require 'sqlite3'
require 'pry'

require 'active_record_content_blob'

# Requires supporting files with custom matchers and macros, etc,
# in ./support/ and its subdirectories.
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each {|f| require f}

DatabaseCleaner.strategy = :truncation

RSpec.configure do |config|

  config.filter_run_excluding skip: true 
  config.run_all_when_everything_filtered = true
  config.filter_run :focus => true

  config.mock_with :rspec

   # Use color in STDOUT
  config.color_enabled = true

  # Use color not only in STDOUT but also in pagers and files
  config.tty = true

  # Use the specified formatter
  config.formatter = :documentation # :progress, :html, :textmate

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end
end


ActiveRecord::Base.establish_connection(
  :adapter => "sqlite3",
  :database => ":memory:"
)
ActiveRecord::Migration.verbose = false

ActiveRecord::Schema.define do
  create_table :content_blobs do |t|
    t.integer  "blobable_id"
    t.string   "blobable_type"
    t.text     "contents",       :limit => 2147483647
    t.timestamps
  end

  add_index :content_blobs, [:blobable_type, :blobable_id]


  ##############
  create_table :music_records, :force => true do |t|
    t.string :name
    t.timestamps
  end

  create_table :bad_records, :force => true do |t|
    t.string :namez
    t.string :contents
    t.timestamps
  end

end




