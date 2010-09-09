require 'spec_helper'

describe "users/show.html.erb" do
  before(:each) do
    @user = assign(:user, stub_model(User,
      :name => "Name",
      :password => "Password",
      :email => "Email"
    ))
  end

  it "renders attributes in <p>" do
    render
    rendered.should contain("Name".to_s)
    rendered.should contain("Password".to_s)
    rendered.should contain("Email".to_s)
  end
end
