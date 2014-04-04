require 'spec_helper'

describe "organisations/edit" do
  before(:each) do
    @organisation = assign(:organisation, stub_model(Organisation))
  end

  it "renders the edit organisation form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", organisation_path(@organisation), "post" do
    end
  end
end
