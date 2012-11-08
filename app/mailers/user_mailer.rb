# UserMailer is used to define all the email service for BESTBAY.
#
class UserMailer < ActionMailer::Base
  default from: "rubydart.bestbay@gmail.com"

  # This method defines the email sent to user when the user successfully.
  # registers with the system.
  # * *View* :
  #   - views/user_mailer/registration_confirmation.text.erb
  #
  def registration_confirmation(user)
    @user = user
    mail(:to => user.email, :subject => "Registered")
  end

  # This method defines the email sent to user when the user successfully.
  # bids a product.
  # * *View* :
  #   - views/user_mailer/bid_success_confirmation.text.erb
  #
  def bid_success_confirmation(user, product)
    @product = product
    @user = user
    mail(:to => user.email, :subject => "Bid successful!")
  end
end
