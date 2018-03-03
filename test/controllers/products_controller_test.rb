require 'test_helper'

class ProductsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @product = products(:one)
    @password = '123456789'
    @confirmed_user = User.create(email: "#{rand(50000)}@example.com",
                                  password: @password)
    @product.user = @confirmed_user
  end

  test "should get index" do
    sign_in(user: @confirmed_user, password: '123456789')
    get products_url
    assert_response :success
  end

  test "should get new" do
    sign_in(user: @confirmed_user, password: '123456789')
    get new_product_url
    assert_response :success
  end

  test "should create product" do
    sign_in(user: @confirmed_user, password: '123456789')
    assert_difference('Product.count') do
      post products_url, params: { product: { link: @product.link } }
    end

    assert_redirected_to product_url(Product.last)
  end

  test "should show product" do
    sign_in(user: @confirmed_user, password: '123456789')
    get product_url(@product)
    assert_response :success
  end

  test "should get edit" do
    sign_in(user: @confirmed_user, password: '123456789')
    get edit_product_url(@product)
    assert_response :success
  end

  test "should update product" do
    sign_in(user: @confirmed_user, password: '123456789')
    patch product_url(@product), params: { product: { link: @product.link } }
    assert_response :success
  end

  test "should destroy product" do
    sign_in(user: @confirmed_user, password: '123456789')
    assert_difference('Product.count', -1) do
      delete product_url(@product)
    end

    assert_redirected_to products_url
  end
end
