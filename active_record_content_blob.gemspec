# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "active_record_content_blob"
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Dan Nguyen"]
  s.date = "2013-08-08"
  s.description = "Loading up TEXT/BLOB columns can be slow"
  s.email = "dansonguyen@gmail.com"
  s.extra_rdoc_files = [
    "LICENSE.txt",
    "README.rdoc"
  ]
  s.files = [
    ".document",
    ".rspec",
    "Gemfile",
    "Gemfile.lock",
    "LICENSE.txt",
    "README.rdoc",
    "Rakefile",
    "VERSION",
    "lib/active_record_content_blob.rb",
    "lib/content_blob.rb",
    "lib/content_blob/blobable.rb",
    "lib/generators/content_blob/content_blob_generator.rb",
    "lib/generators/content_blob/templates/create_content_blobs.rb",
    "spec/spec_helper.rb",
    "spec/unit/blobable_spec.rb",
    "spec/unit/content_blob_spec.rb"
  ]
  s.homepage = "http://github.com/dannguyen/active_record_content_blob"
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.23"
  s.summary = "Attach a TEXT/BLOB column to your model as a has_one"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<sqlite3>, [">= 0"])
      s.add_runtime_dependency(%q<activesupport>, [">= 3.2.14"])
      s.add_runtime_dependency(%q<activerecord>, [">= 3.2.14"])
      s.add_development_dependency(%q<rspec>, ["~> 2.14.0"])
      s.add_development_dependency(%q<bundler>, [">= 0"])
      s.add_development_dependency(%q<jeweler>, ["~> 1.8.4"])
      s.add_development_dependency(%q<database_cleaner>, [">= 0"])
      s.add_development_dependency(%q<pry>, [">= 0"])
      s.add_development_dependency(%q<rdoc>, ["~> 3.12"])
    else
      s.add_dependency(%q<sqlite3>, [">= 0"])
      s.add_dependency(%q<activesupport>, [">= 3.2.14"])
      s.add_dependency(%q<activerecord>, [">= 3.2.14"])
      s.add_dependency(%q<rspec>, ["~> 2.14.0"])
      s.add_dependency(%q<bundler>, [">= 0"])
      s.add_dependency(%q<jeweler>, ["~> 1.8.4"])
      s.add_dependency(%q<database_cleaner>, [">= 0"])
      s.add_dependency(%q<pry>, [">= 0"])
      s.add_dependency(%q<rdoc>, ["~> 3.12"])
    end
  else
    s.add_dependency(%q<sqlite3>, [">= 0"])
    s.add_dependency(%q<activesupport>, [">= 3.2.14"])
    s.add_dependency(%q<activerecord>, [">= 3.2.14"])
    s.add_dependency(%q<rspec>, ["~> 2.14.0"])
    s.add_dependency(%q<bundler>, [">= 0"])
    s.add_dependency(%q<jeweler>, ["~> 1.8.4"])
    s.add_dependency(%q<database_cleaner>, [">= 0"])
    s.add_dependency(%q<pry>, [">= 0"])
    s.add_dependency(%q<rdoc>, ["~> 3.12"])
  end
end

