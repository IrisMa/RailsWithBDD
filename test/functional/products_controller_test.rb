require 'test_helper'

class ProductsControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end
  setup do
    @product = products(:one)
    @update = { :title => "Ruby and Rails",
                 :description=>"ruby are fun!",
                 :image_url=>"/images/rails.png",
                 :price=>19.95}
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:products)
  end

  test "should get new" do

  end

  test "should create product" do

  end

  test "should update product" do

  end
end
