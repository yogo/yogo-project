require File.expand_path(File.join(File.dirname(__FILE__), '..', 'spec_helper'))

describe "A Data Collection" do
  before(:each) do
    @manager = Yogo::Project.create(:name => "A Test Project")
    @collection = @manager.data_collections.create(:type => 'Yogo::Collection::Data', :name => "CercalDB")
  end
  
  after(:each) do
    @manager.data_collections.destroy
    @manager.destroy
  end
  
  it_should_behave_like "All Collections"
  it_should_behave_like "All Data Collections"
end