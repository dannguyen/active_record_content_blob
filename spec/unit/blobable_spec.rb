require 'spec_helper'

class MusicRecord < ActiveRecord::Base 
  include Blobable
end

class BadRecord < ActiveRecord::Base; end

describe "Blobable" do
  before(:each) do 
    DatabaseCleaner.clean
  end

  it 'should raise an error if a class has :contents as an actual field' do 
    expect{BadRecord.class_eval('include Blobable')}.to raise_error
  end

  describe '#build_a_blob' do
    before(:each) do 
      @record = MusicRecord.new
      @record.build_a_blob({'abc' => 123})
      @record.save
    end

    it 'should have :blobable_id and :blobable_type' do 
      @blob = @record.content_blob
      expect(@blob.blobable_id).to eq @record.id 
      expect(@blob.blobable_type).to eq 'MusicRecord'
    end

    it 'should assign single argument to :contents' do 
      expect(@record.contents).to eq({'abc' => 123})
    end

    it 'should overwrite existing blob' do 
      @record.build_a_blob({'xyz'=>'999'})
      expect(@record.content_blob.new_record?).to be_true
      expect(@record.content_blob.valid?).to be_true

      @record.save
      
      @record = MusicRecord.find(@record.id)
      expect(@record.contents['xyz']).to eq '999'

      expect(ContentBlob.count).to eq 1
    end
  end

  describe 'class convenience method ::build_with_a_blob' do 
    context 'one argument' do 
      it 'should build associated content_blob with Hash :contents' do 
        @record = MusicRecord.build_with_a_blob({name: 'X', contents: [1]})
        expect(@record.contents).to eq [1]
      end

      it 'should build a content_blob, eq to first Hash, even without :contents' do 
        @record = MusicRecord.build_with_a_blob(name: 'X')
        expect(@record.contents).to eq( {name: 'X'})
      end
    end

    context 'second argument' do 
      it 'should use second argument as :contents for built blob' do 
        @record = MusicRecord.build_with_a_blob({name: 'A'}, [99])
        expect(@record.contents).to eq [99]
      end
    end
  end


  context 'allow .prepare_content_blob hook to be redefined' do 
    before(:each) do 
      class MusicRecord < ActiveRecord::Base
        def self.prepare_content_for_blob(some_content)
          some_content.is_a?(Hash) ? [some_content] : Array(some_content)
        end
      end
 
      MusicRecord
    end

    after(:each) do 
      class MusicRecord < ActiveRecord::Base
        def self.prepare_content_for_blob(some_content)
          some_content
        end
      end      
    end

    it 'should redefine .prepare_content_blob as specified' do
      @record = MusicRecord.build_with_a_blob({name: 'A'})
      expect(@record.contents).to eq [{name: 'A'}]
    end


  end

  context 'scopes' do 
    before(:each) do 
      @r1 = MusicRecord.create_with_a_blob(name: 'A', contents: ['Z'])
      @r2 = MusicRecord.create(name: 'qqq')
    end

    describe '::has_blob' do 
      it 'should only count records with associated content_blob' do
       expect(MusicRecord.has_blob.count).to eq 1
       expect(MusicRecord.has_blob.first.name).to eq 'A'
      end

      it 'should not eager load content_blob'
    end
  end
end