module ActiveRecordContentBlob
  module Blobable

    # This is what an ActiveRecord model includes if it wants to have a content_blob

    extend ActiveSupport::Concern
    included do
      has_one :content_blob, as: :blobable, dependent: :destroy
      delegate :contents, to: :content_blob, allow_nil: true 
    end


    private
    def build_blob

    end

  end
end