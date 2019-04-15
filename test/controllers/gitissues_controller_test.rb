require 'test_helper'

class GitissuesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @gitissue = gitissues(:one)
  end

  test "should get index" do
    get gitissues_url
    assert_response :success
  end

  test "should get new" do
    get new_gitissue_url
    assert_response :success
  end

  test "should create gitissue" do
    assert_difference('Gitissue.count') do
      post gitissues_url, params: { gitissue: { content: @gitissue.content, link: @gitissue.link, name: @gitissue.name } }
    end

    assert_redirected_to gitissue_url(Gitissue.last)
  end

  test "should show gitissue" do
    get gitissue_url(@gitissue)
    assert_response :success
  end

  test "should get edit" do
    get edit_gitissue_url(@gitissue)
    assert_response :success
  end

  test "should update gitissue" do
    patch gitissue_url(@gitissue), params: { gitissue: { content: @gitissue.content, link: @gitissue.link, name: @gitissue.name } }
    assert_redirected_to gitissue_url(@gitissue)
  end

  test "should destroy gitissue" do
    assert_difference('Gitissue.count', -1) do
      delete gitissue_url(@gitissue)
    end

    assert_redirected_to gitissues_url
  end
end
