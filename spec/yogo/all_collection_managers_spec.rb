require File.expand_path(File.join(File.dirname(__FILE__), '..', 'spec_helper'))

shared_examples_for "All Collection Managers" do
  
  describe "class" do
    before(:each) do
      @manager_class = @manager.class
    end
    
    it "should be a datamapper model" do
      @manager_class.should be_a_kind_of(::DataMapper::Model)
    end
  end
    
  it "should have a repository for collections"
  it "should have collections"

end