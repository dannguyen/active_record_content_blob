require 'spec_helper'

describe "ContentBlob" do
  context 'standalone' do
    before(:each) do 
      DatabaseCleaner.clean
    end

    context 'serialization' do 
      it 'should by default serialize @contents' do 
        @blob = ContentBlob.create(contents: [1,2,3])
        expect(@blob.contents).to be_an Array
      end    
    end

    context 'validation and scope' do 
      it 'should validate_uniqueness_of blobable_id and blobable_type' do 
        ContentBlob.create(blobable_id: 10, blobable_type: 'Hello')
        @blob = ContentBlob.new(blobable_id: 10, blobable_type: 'Hello')
        expect(@blob.valid?).to be_false
      end
    end

    context 'x' do

    end
  end

end

