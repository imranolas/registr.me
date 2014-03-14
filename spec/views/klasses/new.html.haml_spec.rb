require 'spec_helper'

describe "klasses/new" do
  before(:each) do
    assign(:klass, stub_model(Klass,
      :name => "MyString",
      :teacher_id => 1,
      :attendance => 1
    ).as_new_record)
  end

  it "renders new klass form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", klasses_path, "post" do
      assert_select "input#klass_name[name=?]", "klass[name]"
      assert_select "input#klass_teacher_id[name=?]", "klass[teacher_id]"
      assert_select "input#klass_attendance[name=?]", "klass[attendance]"
    end
  end
end
