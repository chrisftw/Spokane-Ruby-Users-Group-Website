require 'spec_helper'

describe "meetings/index.html.erb" do
  before(:each) do
    assign(:meetings, [
      stub_model(Meeting),
      stub_model(Meeting)
    ])
  end

  it "renders a list of meetings" do
    render
  end
end
