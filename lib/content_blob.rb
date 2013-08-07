require 'active_record'
require 'active_support'
class ContentBlob < ActiveRecord::Base 


   serialize :contents

   validates_uniqueness_of :blobable_id, scope: :blobable_type
   belongs_to :blobable, polymorphic: true

end