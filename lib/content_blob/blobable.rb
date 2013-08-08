module ActiveRecordContentBlob
  module Blobable

    # This is what an ActiveRecord model includes if it wants to have a content_blob

    extend ActiveSupport::Concern
    included do

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
      def build_with_blob(hsh, blob_content=nil)
        hsh_syms = hsh.symbolize_keys
        # delete a possible :content_blob so that we can initialize
        #   the record
        
        record = self.new(hsh_syms.reject{|k,v| k == :contents})

        if blob_content.nil?
          # then build a blob only if hsh_syms has :content_blob key
          if hsh_syms.key?(:contents)
            blob_content = hsh_syms[:contents]
            record.build_a_blob(blob_content)
          end
        else
          # second argument is for the blo
          record.build_a_blob(blob_content)
        end

        return record
      end

      def create_with_blob(hsh, blob_content=nil)
        build_with_blob(hsh, blob_content).save
      end
    end # classmethods

    ## instance methods    
    def build_a_blob(some_content)
      self.build_content_blob(contents: some_content)
    end



  end
end