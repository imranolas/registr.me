require 'spec_helper'

describe "organisations/show" do
  before(:each) do
    @organisation = assign(:organisation, stub_model(Organisation))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
