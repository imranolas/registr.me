# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Attend::Application.initialize!

ActionMailer::Base.smtp_settings = {
:address        => 'smtp.gmail.com',
:port           => '465',
:authentication => :plain,
:user_name      => ENV['GMAIL_USERNAME'],
:password       => ENV['GMAIL_PASSWORD'],
:enable_starttls_auto => true
}
