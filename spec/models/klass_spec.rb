require 'spec_helper'

describe Klass do
  it { should_not be_valid }
  it { should respond_to :name }
  it { should respond_to :attendance }
  it { should respond_to :teacher }
  it { should respond_to :students }

  context 'valid Klass' do
    subject(:klass) { create(:klass) }

  end
end
