require File.expand_path(File.join(File.dirname(__FILE__), '..', 'spec_helper'))

shared_examples_for "All Data Collections" do  
  it "should have schema items" do
    @collection.should respond_to(:schema)
    @collection.schema.should be_a_kind_of(::DataMapper::Collection)
  end
  
  describe "add schema items" do
    before(:each) do
      @source_collection = @manager.data_collections.create(:name => 'Source Collection')
      @other_collection = @manager.data_collections.create(:name => 'Other Collection')
    end
    
    after(:each) do
      @source_collection.destroy
      @other_collection.destroy
      @manager.data_collections.destroy
    end
    
    it "should add simple properties" do
      original_prop_count = @source_collection.data_model.properties.size
      
      @source_collection.schema.create(:type => Yogo::Collection::Property::String,
                                       :name => "Title")
      @source_collection.schema.create(:type => Yogo::Collection::Property::Integer,
                                       :name => "Length")
      @source_collection.schema.size.should == 2
      lambda { @source_collection.update_model }.should_not raise_error
      
      @source_collection.data_model.properties.size.should == original_prop_count+2
      @source_collection.items.should be_empty
      
      entry = @source_collection.items.new()
      entry['Title'].should be_nil
      entry['Length'].should be_nil
      
      lambda { entry['Title'] = "Testing a String Property" }.should_not raise_error
      lambda { entry['Length'] = 5 }.should_not raise_error
      
      entry.save.should be_true
      
      @source_collection.items.should_not be_empty
      @source_collection.items.size.should == 1
    end
    
    it "should add relationship properties"
  end
end