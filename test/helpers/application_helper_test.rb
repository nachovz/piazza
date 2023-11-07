require "test_helper"

class ApplicationHelperTest < ActionView::TestCase
  setup do
    @turbo_native_app = false
  end

  test "formats page specific title" do
    content_for(:title) { "Page Title" }

    assert_equal "Page Title | #{I18n.t("piazza")}", title
  end

  test "returns app name when page title is not set" do
    assert_equal I18n.t("piazza"), title
  end

  test "only page specific title is returned for turbo native" do
    @turbo_native_app = true
    content_for(:title) { "Page Title" }

    assert_equal "Page Title", title
  end

  private

  def turbo_native_app?
    @turbo_native_app
  end
end
