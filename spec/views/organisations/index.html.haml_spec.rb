require 'spec_helper'

describe "organisations/index" do
  before(:each) do
    assign(:organisations, [
      stub_model(Organisation),
      stub_model(Organisation)
    ])
  end

  it "renders a list of organisations" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
