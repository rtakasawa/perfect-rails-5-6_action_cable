require "test_helper"

class ApplicationCable::ConnectionTest < ActionCable::Connection::TestCase
  test "connects accepts" do
    user = User.first
    cookies.singed[:user_id] = user.id
    connect
    assert_equal connection.current.user_id, user.id
  end

  test "connection rejects" do
    cookies.singed[:user_id] = nil
    assert_reject_connection { connect }
  end
end
