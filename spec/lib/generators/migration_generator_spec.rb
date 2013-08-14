=begin 
 
# Leaving this as a testament to my failed attempt to
# test generators via RSpec, even with the generator_spec gem

require 'spec_helper'
require File.expand_path '../../../../lib/generators/content_blob/migration_generator', __FILE__

require "generator_spec"
require "generator_spec/test_case" 

describe ActiveRecordContentBlob::MigrationGenerator, type: :generator do 
  include GeneratorSpec::TestCase

  @val = destination File.expand_path("../../../../../tmp", __FILE__)
  
  before(:each) do 
    prepare_destination
    run_generator
#    Rails::Generators.options[:rails][:orm] = :active_record
  end

    describe 'create migration file' do
      it 'should create migration' do 


        puts "\n\n #{Dir.pwd}\n\n"
        assert_file 'db/migrate/create_content_blobs_migration.rb'
      end
      #subject { file('db/migrate/create_content_blobs_migration.rb') }
      #it { should be_a_migration }
    end

end
=end
