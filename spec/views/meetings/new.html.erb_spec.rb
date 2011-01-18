require 'spec_helper'

describe "meetings/new.html.erb" do
  before(:each) do
    assign(:meeting, stub_model(Meeting,
      :new_record? => true
    ))
  end

  it "renders new meeting form" do
    render

    rendered.should have_selector("form", :action => meetings_path, :method => "post") do |form|
    end
  end
end
