require File.expand_path(File.join(File.dirname(__FILE__), '..', 'spec_helper'))

shared_examples_for "All Collection Data Models" do
  it "should be a datamapper model" do
    @data_model.should be_a_kind_of(::DataMapper::Model)
  end

  it "should use the collection data_repository" do
    @collection.scope do
      @data_model.repository.should == @data_model.collection.collection_repository
    end
    
  end

  describe "core properties" do
    it "should include :id" do
      @collection.scope do
        @data_model.properties[:id].should_not be_nil
      end
    end
    
    it "should include :created_at" do
      @collection.scope do
        @data_model.properties[:created_at].should_not be_nil
      end
    end
    
    it "should include :updated_at" do
      @collection.scope do
        @data_model.properties[:updated_at].should_not be_nil
      end
    end
  end
end