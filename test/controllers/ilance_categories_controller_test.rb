require 'test_helper'

class IlanceCategoriesControllerTest < ActionController::TestCase
  setup do
    @ilance_category = ilance_categories(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ilance_categories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ilance_category" do
    assert_difference('IlanceCategory.count') do
      post :create, ilance_category: {  }
    end

    assert_redirected_to ilance_category_path(assigns(:ilance_category))
  end

  test "should show ilance_category" do
    get :show, id: @ilance_category
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @ilance_category
    assert_response :success
  end

  test "should update ilance_category" do
    patch :update, id: @ilance_category, ilance_category: {  }
    assert_redirected_to ilance_category_path(assigns(:ilance_category))
  end

  test "should destroy ilance_category" do
    assert_difference('IlanceCategory.count', -1) do
      delete :destroy, id: @ilance_category
    end

    assert_redirected_to ilance_categories_path
  end
end
