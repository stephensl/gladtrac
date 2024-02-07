require "test_helper"

class Students::DashboardsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get students_dashboards_show_url
    assert_response :success
  end
end
