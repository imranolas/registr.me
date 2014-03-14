require 'spec_helper'

describe "lessons/new" do
  before(:each) do
    assign(:lesson, stub_model(Lesson,
      :teacher => nil,
      :klass => nil,
      :room => "MyString"
    ).as_new_record)
  end

  it "renders new lesson form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", lessons_path, "post" do
      assert_select "input#lesson_teacher[name=?]", "lesson[teacher]"
      assert_select "input#lesson_klass[name=?]", "lesson[klass]"
      assert_select "input#lesson_room[name=?]", "lesson[room]"
    end
  end
end
