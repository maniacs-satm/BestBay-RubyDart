require 'spec_helper'

describe "User Pages" do

  subject { page }

  describe "signup" do
    before { visit signup_path }

    let(:submit) { 'Create my account' }

    #describe "page should have h1 as Sign up" do
      #it { should have_selector('h1', text: 'Sign up') }
    #end

    describe "with invalid information" do
      it "should not create a user" do
        expect { click_button submit }.not_to change(User, :count)
      end
    end

    describe "with valid information" do
      before do
        fill_in "Name",         with: 'foo'
        fill_in "Email",        with: 'foo@bar.com'
        fill_in "Password",     with: 'foobar'
        fill_in "Confirmation", with: 'foobar'
      end

      it "should create a user" do
        expect { click_button submit }.to change(User, :count).by(1)
      end
    end
  end

  describe User do
    before do
     @user = User.new(name: "Example User", email: "user@example.com", 
                     password: "foobar", password_confirmation: "foobar")
     end

    subject { @user }
    it { should respond_to(:password_confirmation) }
    it { should respond_to(:remember_token) }
    it { should respond_to(:authenticate) } 

    describe "remember token" do
      before { @user.save }
      its(:remember_token) { should_not be_blank }
    end
  end

end
