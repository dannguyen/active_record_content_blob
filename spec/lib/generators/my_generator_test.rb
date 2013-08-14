require 'generator_helper'
require "rails/generators"
require File.expand_path '../../../../lib/generators/content_blob/migration_generator', __FILE__


class MigrationGeneratorTest < Rails::Generators::TestCase

  tests ActiveRecordContentBlob::MigrationGenerator
  destination File.expand_path("../../tmp", __FILE__)

  setup :prepare_destination

  test "should generate a migration" do
    begin
      run_generator
      assert_migration "db/migrate/create_content_blobs_migration"
    ensure
      FileUtils.rm_rf self.destination_root
    end
  end
end