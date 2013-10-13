require 'active_record'
require 'active_support'
class ContentBlob < ActiveRecord::Base 

   attr_accessible :contents
   serialize :contents

   validates_uniqueness_of :blobable_id, scope: :blobable_type
   belongs_to :blobable, polymorphic: true

end