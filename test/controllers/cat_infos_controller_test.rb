require 'test_helper'

class CatInfosControllerTest < ActionController::TestCase
  setup do
    @cat_info = cat_infos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cat_infos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cat_info" do
    assert_difference('CatInfo.count') do
      post :create, cat_info: { content: @cat_info.content, title: @cat_info.title }
    end

    assert_redirected_to cat_info_path(assigns(:cat_info))
  end

  test "should show cat_info" do
    get :show, id: @cat_info
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @cat_info
    assert_response :success
  end

  test "should update cat_info" do
    patch :update, id: @cat_info, cat_info: { content: @cat_info.content, title: @cat_info.title }
    assert_redirected_to cat_info_path(assigns(:cat_info))
  end

  test "should destroy cat_info" do
    assert_difference('CatInfo.count', -1) do
      delete :destroy, id: @cat_info
    end

    assert_redirected_to cat_infos_path
  end
end
