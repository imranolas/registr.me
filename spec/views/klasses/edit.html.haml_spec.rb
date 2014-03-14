require 'spec_helper'

describe "klasses/edit" do
  before(:each) do
    @klass = assign(:klass, stub_model(Klass,
      :name => "MyString",
      :teacher_id => 1,
      :attendance => 1
    ))
  end

  it "renders the edit klass form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", klass_path(@klass), "post" do
      assert_select "input#klass_name[name=?]", "klass[name]"
      assert_select "input#klass_teacher_id[name=?]", "klass[teacher_id]"
      assert_select "input#klass_attendance[name=?]", "klass[attendance]"
    end
  end
end
