require "application_system_test_case"

class GitissuesTest < ApplicationSystemTestCase
  setup do
    @gitissue = gitissues(:one)
  end

  test "visiting the index" do
    visit gitissues_url
    assert_selector "h1", text: "Gitissues"
  end

  test "creating a Gitissue" do
    visit gitissues_url
    click_on "New Gitissue"

    fill_in "Content", with: @gitissue.content
    fill_in "Link", with: @gitissue.link
    fill_in "Name", with: @gitissue.name
    click_on "Create Gitissue"

    assert_text "Gitissue was successfully created"
    click_on "Back"
  end

  test "updating a Gitissue" do
    visit gitissues_url
    click_on "Edit", match: :first

    fill_in "Content", with: @gitissue.content
    fill_in "Link", with: @gitissue.link
    fill_in "Name", with: @gitissue.name
    click_on "Update Gitissue"

    assert_text "Gitissue was successfully updated"
    click_on "Back"
  end

  test "destroying a Gitissue" do
    visit gitissues_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Gitissue was successfully destroyed"
  end
end
