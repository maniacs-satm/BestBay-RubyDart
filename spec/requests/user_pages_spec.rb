require 'spec_helper'

describe "User Pages" do

  subject { page }

  describe "signup" do
    before { visit signup_path }

    let(:submit) { 'Create my account' }

    describe "with invalid information" do
      it "should not create a user" do
        expect { click_button submit }.not_to change(User, :count)
      end
    end

    describe "with valid information" do
      before do
        fill_in "Name",         with: 'test111'
        fill_in "Email",        with: 'test111@bar.com'
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

  describe "edit" do
    let(:user) { FactoryGirl.create(:user) }
    before { visit edit_user_path(user) }

    describe "page" do
      #it { should have_selector('em',    text: "Edit your profile") }
    end

    describe "with invalid information" do
      before { click_button 'Save changes' }

      it { should have_content('error') }
    end

    describe "with valid information" do
      let(:new_email) { "new@example.com" }
      before do
        fill_in "Email",            with: new_email
        fill_in "Password",         with: user.password
        fill_in "Confirm Password", with: user.password
        click_button "Save changes"
      end
    end
  end
end
