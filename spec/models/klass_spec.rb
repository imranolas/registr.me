require 'spec_helper'

describe Klass do
  it { should_not be_valid }
  it { should respond_to :name }
  it { should respond_to :attendance }
  it { should respond_to :teacher }
  it { should respond_to :students }

  context 'valid Klass' do
    subject(:klass) { create(:klass) }
    let(:student) { create(:student) }

    it 'should associate with students' do
      3.times { klass.students << create(:student) }
      klass.students.count.should eql 3 
      klass.students.should_not be_empty
    end
  end
end
