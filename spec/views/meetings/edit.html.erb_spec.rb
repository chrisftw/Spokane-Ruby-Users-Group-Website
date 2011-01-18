require 'spec_helper'

describe "meetings/edit.html.erb" do
  before(:each) do
    @meeting = assign(:meeting, stub_model(Meeting,
      :new_record? => false
    ))
  end

  it "renders the edit meeting form" do
    render

    rendered.should have_selector("form", :action => meeting_path(@meeting), :method => "post") do |form|
    end
  end
end
