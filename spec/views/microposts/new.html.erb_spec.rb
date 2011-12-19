require 'spec_helper'

describe "microposts/new.html.erb" do
  before(:each) do
    assign(:micropost, stub_model(Micropost).as_new_record)
  end

  it "renders new micropost form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => microposts_path, :method => "post" do
    end
  end
end
