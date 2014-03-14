require 'spec_helper'

describe "klasses/show" do
  before(:each) do
    @klass = assign(:klass, stub_model(Klass,
      :name => "Name",
      :teacher_id => 1,
      :attendance => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/1/)
    rendered.should match(/2/)
  end
end
