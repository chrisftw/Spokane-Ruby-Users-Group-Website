require 'spec_helper'

describe "places/new.html.erb" do
  before(:each) do
    assign(:place, stub_model(Place,
      :new_record? => true
    ))
  end

  it "renders new place form" do
    render

    rendered.should have_selector("form", :action => places_path, :method => "post") do |form|
    end
  end
end
