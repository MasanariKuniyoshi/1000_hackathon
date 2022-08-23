require 'test_helper'

class TaskListsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get task_lists_new_url
    assert_response :success
  end

end
