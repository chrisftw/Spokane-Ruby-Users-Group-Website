require 'spec_helper'

describe "users/new.html.erb" do
  before(:each) do
    assign(:user, stub_model(User,
      :new_record? => true,
      :name => "MyString",
      :password => "MyString",
      :email => "MyString"
    ))
  end

  it "renders new user form" do
    render

    rendered.should have_selector("form", :action => users_path, :method => "post") do |form|
      form.should have_selector("input#user_name", :name => "user[name]")
      form.should have_selector("input#user_password", :name => "user[password]")
      form.should have_selector("input#user_email", :name => "user[email]")
    end
  end
end
