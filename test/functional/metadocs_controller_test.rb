require 'test_helper'

class MetadocsControllerTest < ActionController::TestCase
  setup do
    @metadoc = metadocs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:metadocs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create metadoc" do
    assert_difference('Metadoc.count') do
      post :create, metadoc: @metadoc.attributes
    end

    assert_redirected_to metadoc_path(assigns(:metadoc))
  end

  test "should show metadoc" do
    get :show, id: @metadoc
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @metadoc
    assert_response :success
  end

  test "should update metadoc" do
    put :update, id: @metadoc, metadoc: @metadoc.attributes
    assert_redirected_to metadoc_path(assigns(:metadoc))
  end

  test "should destroy metadoc" do
    assert_difference('Metadoc.count', -1) do
      delete :destroy, id: @metadoc
    end

    assert_redirected_to metadocs_path
  end
end
