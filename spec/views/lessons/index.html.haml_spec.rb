require 'spec_helper'

describe "lessons/index" do
  before(:each) do
    assign(:lessons, [
      stub_model(Lesson,
        :teacher => nil,
        :klass => nil,
        :room => "Room"
      ),
      stub_model(Lesson,
        :teacher => nil,
        :klass => nil,
        :room => "Room"
      )
    ])
  end

  it "renders a list of lessons" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Room".to_s, :count => 2
  end
end
