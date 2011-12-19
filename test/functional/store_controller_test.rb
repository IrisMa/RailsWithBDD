require 'test_helper'

class StoreControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end
  setup do
    @product = products(:one)

  end

  test "should be get index" do
    get :index
    assert_response :success
    #assert_select '#main .entry', 1
    #assert_select '#column #side a', :minimum=>4
    assert_select 'h1', "Your Products Catalog"
  end
end
