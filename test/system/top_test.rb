require "application_system_test_case"

class TopTest < ApplicationSystemTestCase
  test "visiting the root" do
    visit root_url

    assert_selector "h1", text: "Top"
  end
end
