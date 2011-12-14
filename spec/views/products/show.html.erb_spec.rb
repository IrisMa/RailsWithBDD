require 'spec_helper'

describe "products/show.html.erb" do
  before(:each) do
    @product = assign(:product, stub_model(Product))
  end

  it "renders attributes in <p>" do
    render
  end
end
