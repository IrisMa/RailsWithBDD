require 'spec_helper'

describe "products/index.html.erb" do
  before(:each) do
    assign(:products, [
      stub_model(Product),
      stub_model(Product)
    ])
  end

  it "renders a list of products" do
    render
  end
end
