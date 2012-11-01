class UserMailer < ActionMailer::Base
  default from: "rubydart.bestbay@gmail.com"

  def registration_confirmation(user)
    @user = user
    mail(:to => user.email, :subject => "Registered")
  end

  def bid_success_confirmation(user, product)
    @product = product
    @user = user
    mail(:to => user.email, :subject => "Bid successful!")
  end
end
