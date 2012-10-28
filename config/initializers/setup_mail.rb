ActionMailer::Base.smtp_settings = {
  :address => "smtp.gmail.com",
  :port => 587,
  :domain => "gmail.com",
  :user_name => "rubydart.bestbay",
  :password => "18642rubydart",
  :authentication => "plain",
  :enable_starttls_auto => true
}
