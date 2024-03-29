require 'spec_helper'

describe "catalogs/index" do
  before(:each) do
    assign(:catalogs, [
      stub_model(Catalog,
        :title => "Title",
        :description => "Description",
        :img => "Img"
      ),
      stub_model(Catalog,
        :title => "Title",
        :description => "Description",
        :img => "Img"
      )
    ])
  end

  it "renders a list of catalogs" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    assert_select "tr>td", :text => "Img".to_s, :count => 2
  end
end
