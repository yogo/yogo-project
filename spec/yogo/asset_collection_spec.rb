require File.expand_path(File.join(File.dirname(__FILE__), '..', 'spec_helper'))

describe "An Asset Collection" do
  before(:each) do
    @manager = Yogo::Project.create(:name => "A Test Project")
    @collection = @manager.data_collections.create(:type => 'Yogo::Collection::Asset', :name => "CercalDB")
    @collection = @manager.data_collections.first(@collection.id)
  end

  after(:each) do
    @manager.data_collections.destroy
    @manager.destroy
  end

  it_should_behave_like "All Collections"

  it "should store a file" do
    @collection.scope do
      asset_file =  File.open(File.join(SPEC_RES_DIR, 'text_file_asset.txt'))
      asset = @collection.items.create()
      lambda { asset.file = asset_file }.should_not raise_error
      asset.save.should be_true
    end
  end

  it "should retrieve a file"

end