require 'spec_helper'

describe "UserSignup" do
  it 'should create users without a password' do
    visit '/users/sign_up'
    fill_in 'Email', with: 'foo@bar.com'    
    expect { click_button 'Sign up' }.to change { User.count }.by(1)
  end

  context "User confirmation email" do
    before do
      clear_emails
      visit '/users/sign_up'
      fill_in 'Email', with: 'foo@bar.com'
      click_button 'Sign up'
      open_email('foo@bar.com')
    end

    it { current_email.should_not be_nil }

    it 'confirm account' do
      pending
      current_email.click_link 'Confirm'
      page.should have_content "almost done"
      fill_in 'name', with: 'foo bar'
      fill_in 'user[password]', with: 'password'
      fill_in 'user[password_confirmation]', with: 'password'
      click_button 'Confirm Account'
      save_and_open_page

      expect { click_button 'Confirm Account' }.to change { Teacher.count }.by(1)
      User.last.should be_confirmed
    end 


  end



  it 'should create a new teacher record' do

  end

end
