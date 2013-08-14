require 'rails/generators'
require 'rails/generators/active_record'

module ActiveRecordContentBlob

  class MigrationGenerator < ActiveRecord::Generators::Base
    argument :name, type: :string, default: 'random_name'

    source_root File.expand_path('../templates', __FILE__)

    # Copies the migration template to db/migrate.
    def copy_files
      migration_template 'create_content_blobs.rb', 'db/migrate/create_content_blobs_migration.rb'
    end


  end

end


=begin
    include Rails::Generators::Migration

    desc "Creates the content_blobs table"

    self.source_paths << File.join(File.dirname(__FILE__), 'templates')

    def self.next_migration_number(path)
      ActiveRecord::Generators::Base.next_migration_number(path)
    end

    def create_migration_file
      create_migration_file_if_not_exist 'create_content_blobs'
    end

    private

    def create_migration_file_if_not_exist(file_name)
      unless self.class.migration_exists?(File.dirname(File.expand_path("db/migrate/#{file_name}")), file_name)
        migration_template "#{file_name}.rb", "db/migrate/#{file_name}.rb"
      end
    end
=end