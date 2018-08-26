require 'test_helper'

class CatProtectionsControllerTest < ActionController::TestCase
  setup do
    @cat_protection = cat_protections(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cat_protections)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cat_protection" do
    assert_difference('CatProtection.count') do
      post :create, cat_protection: { content: @cat_protection.content, picture: @cat_protection.picture, title: @cat_protection.title }
    end

    assert_redirected_to cat_protection_path(assigns(:cat_protection))
  end

  test "should show cat_protection" do
    get :show, id: @cat_protection
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @cat_protection
    assert_response :success
  end

  test "should update cat_protection" do
    patch :update, id: @cat_protection, cat_protection: { content: @cat_protection.content, picture: @cat_protection.picture, title: @cat_protection.title }
    assert_redirected_to cat_protection_path(assigns(:cat_protection))
  end

  test "should destroy cat_protection" do
    assert_difference('CatProtection.count', -1) do
      delete :destroy, id: @cat_protection
    end

    assert_redirected_to cat_protections_path
  end
end
