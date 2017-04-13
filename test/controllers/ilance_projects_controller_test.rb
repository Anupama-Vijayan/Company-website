require 'test_helper'

class IlanceProjectsControllerTest < ActionController::TestCase
  setup do
    @ilance_project = ilance_projects(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ilance_projects)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ilance_project" do
    assert_difference('IlanceProject.count') do
      post :create, ilance_project: {  }
    end

    assert_redirected_to ilance_project_path(assigns(:ilance_project))
  end

  test "should show ilance_project" do
    get :show, id: @ilance_project
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @ilance_project
    assert_response :success
  end

  test "should update ilance_project" do
    patch :update, id: @ilance_project, ilance_project: {  }
    assert_redirected_to ilance_project_path(assigns(:ilance_project))
  end

  test "should destroy ilance_project" do
    assert_difference('IlanceProject.count', -1) do
      delete :destroy, id: @ilance_project
    end

    assert_redirected_to ilance_projects_path
  end
end
