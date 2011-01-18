require 'spec_helper'

describe "places/edit.html.erb" do
  before(:each) do
    @place = assign(:place, stub_model(Place,
      :new_record? => false
    ))
  end

  it "renders the edit place form" do
    render

    rendered.should have_selector("form", :action => place_path(@place), :method => "post") do |form|
    end
  end
end
