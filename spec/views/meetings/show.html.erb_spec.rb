require 'spec_helper'

describe "meetings/show.html.erb" do
  before(:each) do
    @meeting = assign(:meeting, stub_model(Meeting))
  end

  it "renders attributes in <p>" do
    render
  end
end
