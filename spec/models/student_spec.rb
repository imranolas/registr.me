require 'spec_helper'

describe Student do
  it { should respond_to :name }
  it { should respond_to :active }
  it { should_not be_valid }
  it { should respond_to :klasses }
  its(:klasses) { should be_a(Array)}

  context 'valid student' do
    subject(:student) { create(:student) }

    it { should be_valid }
  end

end
