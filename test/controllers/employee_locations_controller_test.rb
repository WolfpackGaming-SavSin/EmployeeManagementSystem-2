require 'test_helper'

class EmployeeLocationsControllerTest < ActionDispatch::IntegrationTest
  test "should get employee:references" do
    get employee_locations_employee:references_url
    assert_response :success
  end

  test "should get location:references" do
    get employee_locations_location:references_url
    assert_response :success
  end

end
