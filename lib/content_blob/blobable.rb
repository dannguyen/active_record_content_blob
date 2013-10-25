module ActiveRecordContentBlob
  module Blobable

    # This is what an ActiveRecord model includes if it wants to have a content_blob

    extend ActiveSupport::Concern
    included do

      # Not sure if this is a needed scope
      scope :has_blob, ->{joins(:content_blob)}

      if self.instance_methods.include?(:contents) || self.column_names.include?('contents')
        raise StandardError, "Cannot already have a :contents attribute or method"
      end

      has_one :content_blob, as: :blobable, dependent: :destroy
      # TODO: allow customization of :contents name
      # in case model already has a contents field
      delegate :contents, to: :content_blob, allow_nil: true 
    end


    module ClassMethods 



      # returns a new record with an attached blob
      # e.g. Record.build_with_a_blob(record_hsh, record_big_hsh)
      def build_with_a_blob(hsh, blob_content=nil)
        hsh_syms = hsh.symbolize_keys

        # exclude :contents from instantiating a new Record
        record = self.new(hsh_syms.reject{|k,v| k == :contents})

        stuff = if blob_content.present?
          # build a blob using :blob_content
          blob_content
        elsif c = hsh_syms[:contents]
          c
        else
          # then build a blob from the hsh
          hsh
        end

        prepared_stuff = prepare_content_for_blob(stuff)
        record.build_a_blob(prepared_stuff)
        return record
      end



      def create_with_a_blob(hsh, blob_content=nil)
        build_with_a_blob(hsh, blob_content).save
      end

      # allow this to be redefined
      def prepare_content_for_blob(some_content)
        some_content
      end
      
    end # classmethods

    ## instance methods    
    # First, see if blob exists
    def build_a_blob(some_content)
      if has_blob?
        self.content_blob.assign_attributes(contents: some_content)
      else
        self.build_content_blob(contents: some_content)
      end

      self.content_blob
    end

  

    def has_blob?
      !content_blob.nil?
    end



  end
end