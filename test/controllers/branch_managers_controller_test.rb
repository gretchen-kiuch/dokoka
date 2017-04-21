require 'test_helper'

class BranchManagersControllerTest < ActionController::TestCase
  setup do
    @branch_manager = branch_managers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:branch_managers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create branch_manager" do
    assert_difference('BranchManager.count') do
      post :create, branch_manager: {  }
    end

    assert_redirected_to branch_manager_path(assigns(:branch_manager))
  end

  test "should show branch_manager" do
    get :show, id: @branch_manager
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @branch_manager
    assert_response :success
  end

  test "should update branch_manager" do
    patch :update, id: @branch_manager, branch_manager: {  }
    assert_redirected_to branch_manager_path(assigns(:branch_manager))
  end

  test "should destroy branch_manager" do
    assert_difference('BranchManager.count', -1) do
      delete :destroy, id: @branch_manager
    end

    assert_redirected_to branch_managers_path
  end
end
