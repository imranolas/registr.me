require 'spec_helper'

describe "lessons/edit" do
  before(:each) do
    @lesson = assign(:lesson, stub_model(Lesson,
      :teacher => nil,
      :klass => nil,
      :room => "MyString"
    ))
  end

  it "renders the edit lesson form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", lesson_path(@lesson), "post" do
      assert_select "input#lesson_teacher[name=?]", "lesson[teacher]"
      assert_select "input#lesson_klass[name=?]", "lesson[klass]"
      assert_select "input#lesson_room[name=?]", "lesson[room]"
    end
  end
end
