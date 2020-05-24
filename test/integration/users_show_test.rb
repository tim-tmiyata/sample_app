# frozen_string_literal: true

require 'test_helper'

class UsersShowTest < ActionDispatch::IntegrationTest
  def setup
    @admin = users(:michael)
  end

  test '有効なアカウントのユーザーページが開けること' do
    non_admin = users(:archer)
    log_in_as(@admin)
    get user_path(non_admin)
    assert_select 'title', full_title(non_admin.name)
    assert_template 'users/show'
  end

  test '無効なアカウントのユーザーページが開けないこと' do
    inactive_user = users(:inactive_youser)
    log_in_as(@admin)
    get user_path(inactive_user)
    follow_redirect!
    assert_template 'users/index'
  end
end
