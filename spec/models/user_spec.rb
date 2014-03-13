require 'spec_helper'

describe User do
  it { should respond_to :email }
  it { should_not be_nil }
  
  context 'without password' do
    subject(:user) { create(:user_without_password) }
    it { expect{ create(:user_without_password) }.to change { User.count }.by(1) }
    it { should_not be_confirmed }
    its(:confirmation_token) { should_not be_nil }
  end


end
