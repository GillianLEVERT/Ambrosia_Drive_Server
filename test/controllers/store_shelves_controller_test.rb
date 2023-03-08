require "test_helper"

class StoreShelvesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @store_shelf = store_shelves(:one)
  end

  test "should get index" do
    get store_shelves_url, as: :json
    assert_response :success
  end

  test "should create store_shelf" do
    assert_difference("StoreShelf.count") do
      post store_shelves_url, params: { store_shelf: { name: @store_shelf.name } }, as: :json
    end

    assert_response :created
  end

  test "should show store_shelf" do
    get store_shelf_url(@store_shelf), as: :json
    assert_response :success
  end

  test "should update store_shelf" do
    patch store_shelf_url(@store_shelf), params: { store_shelf: { name: @store_shelf.name } }, as: :json
    assert_response :success
  end

  test "should destroy store_shelf" do
    assert_difference("StoreShelf.count", -1) do
      delete store_shelf_url(@store_shelf), as: :json
    end

    assert_response :no_content
  end
end
