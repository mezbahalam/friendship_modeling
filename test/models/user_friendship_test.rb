require 'test_helper'

class UserFriendshipTest < ActiveSupport::TestCase
  should belong_to(:user)
  should belong_to(:friend)


  test "that creating a friendship works without raisind an exception" do
    assert_nothing_raised do
      UserFriendship.create user: users(:mezbah), friend: users(:mez)
    end
  end

  test "that creating a friendship based on user id and friend id works" do
    UserFriendship.create user_id: users(:mezbah), friend: users(:mez)
    assert users(:mezbah).friends.include?(users(:mez))
  end

  context "a new instance" do
    setup do
      UserFriendship.new user: users(:mezbah), friend: users(:mez)
    end
  end
end
