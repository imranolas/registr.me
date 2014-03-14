require 'spec_helper'

describe "klasses/index" do
  before(:each) do
    assign(:klasses, [
      stub_model(Klass,
        :name => "Name",
        :teacher_id => 1,
        :attendance => 2
      ),
      stub_model(Klass,
        :name => "Name",
        :teacher_id => 1,
        :attendance => 2
      )
    ])
  end

  it "renders a list of klasses" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
