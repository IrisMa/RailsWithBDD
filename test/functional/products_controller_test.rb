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
    get :new
    assert_response :success
  end

  test "should create product" do
    assert_difference('Product.count') do
      post :create, :product=>@update
    end

    assert_redirected_to product_path(assigns(:product))
  end

  test "should show product" do
    get :show, :id=>@product.to_param
    assert_response :success
  end

  test "should update product" do
    put :update, :id=>@product.to_param, :product=>@update
    assert_redirected_to product_path(assigns(:product))
  end

  test "should destroy product" do
    assert_difference('Product.count', -1) do
      delete :destroy, :id=>@product.to_param
    end
  end
end
