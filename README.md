# ActiveRecordContentBlob

A convenience gem for associating serialized BLOBs with your records, if you happen to use blobs to store data that doesn't need to be scoped.

For example, when backing up Tweet data, a user may find it to have a `tweets` table containing fields such as `created_at`, so that they can query for all Tweets within a certain time period. But the other content that comes with a Tweet might be useful later, so it's convenient to stick the entire JSON representation of a Tweet into a BLOB.

But because ActiveRecord::Base will `select` all columns by default, querying across a large set of `tweets` will [slow performance](http://stackoverflow.com/questions/9511476/speed-of-mysql-query-on-tables-containing-blob-depends-on-filesystem-cache).


`ActiveRecordContentBlob` is simply a convenience gem that creates a polymorphic relationship between any other AR table.


**Note:** This is something I'm playing around with. I don't recommend it for production at this point.

## Installation

    gem install active_record_content_blob


Include it in your `Gemfile`

    bundle install

Run the `rake` task to modify your database

    rails generate content_blob
    rake db:migrate

Sample usage:

      record = MusicRecord.new
      record.build_a_blob({'title' => "The Jackson 5"})
      record.save

      record.contents['title']
      # => The Jackson 5 








