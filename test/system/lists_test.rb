require "application_system_test_case"

class ListsTest < ApplicationSystemTestCase
  setup do
    @user = User.create!(email: 'foo@foo.mail', password: 'foofoo', name: 'foofoo')
    @user_2 = User.create!(email: 'toto@foo.mail', password: 'foofoo', name: 'toto')
    @list = @user.lists.create(name: 'user list name')
  end

  def log_in_user 
    visit lists_url
    fill_in 'user[email]', with: 'foo@foo.mail'
    fill_in 'user[password]', with: 'foofoo'
    click_on 'Log in'
  end 

  test 'require authenticated user to access lists' do
    visit lists_url
    assert_text 'Log in'
  end

  test 'as a logged user I can see my lists' do
    log_in_user()
    assert_text 'Your Lists'
    assert_text 'User list name'
  end

  test 'as a logged user I can create a list' do
    log_in_user()
    click_on 'Create a new list'
    fill_in 'list[name]', with: 'Books'
    fill_in 'list[description]', with: 'most awesome books'
    click_on 'submit'
    assert_text 'List was successfully created.'
    assert_equal(@user.lists.count(), 2, true) 
     #1 created in this test and one in the setup
  end

  test 'as a logged user I can see the tasks of a list' do 
    log_in_user()
    click_on 'View details'
    assert_text 'Tasks'
  end 

  test 'as a logged user I can delete a list' do 
    log_in_user()
    click_on 'View details'
    click_on 'Delete list'
    page.driver.browser.switch_to.alert.accept
    assert_text 'List was successfully destroyed.'
    assert_equal(@user.lists.count(), 0, true)
  end

  test 'as a logged user I can share a list and list is successfully shared' do 
    log_in_user()
    click_on 'View details'
    click_on 'Give list access to a friend'
    select 'toto', :from => 'list_access[user_id]'
    click_on 'submit'
    assert_text 'List was successfully shared.'
    click_on 'Logout'
    click_on 'sign in'
    fill_in 'user[email]', with: 'toto@foo.mail'
    fill_in 'user[password]', with: 'foofoo'
    click_on 'Log in'
    assert_text 'Lists shared with you'
    assert_text 'User list name'
  end

end
