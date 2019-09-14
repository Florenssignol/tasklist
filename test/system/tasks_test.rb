require "application_system_test_case"

class TasksTest < ApplicationSystemTestCase
  setup do
    @user = User.create!(email: 'foo@foo.mail', password: 'foofoo', name: 'foofoo')
    @list = @user.lists.create(name: 'user list name')
    @task = @list.tasks.create(name: 'amazing task')
  end

  def log_in_and_go_on_list
    visit lists_url
    fill_in 'user[email]', with: 'foo@foo.mail'
    fill_in 'user[password]', with: 'foofoo'
    click_on 'Log in'
    click_on 'View details'
  end 

  test 'as a logged user I can create a new task in my list' do 
    log_in_and_go_on_list
    click_on 'New Task'
    fill_in 'task[name]', with: 'To kill a mockingbird'
    fill_in 'task[description]', with: 'great book'
    click_on 'submit'
    assert_equal(@user.lists.first.tasks.count(), 2, true) 
  end 

  test 'as a logged user I can add a tag when creating my task' do 
    log_in_and_go_on_list
    click_on 'New Task'
    fill_in 'task[name]', with: 'To kill a mockingbird'
    fill_in 'task[description]', with: 'great book'
    fill_in 'task[all_tags]', with: 'next'
    click_on 'submit'
    assert_text 'next'
  end 

  test 'as a logged user I can edit a task' do 
    log_in_and_go_on_list
    click_on 'Edit'
    fill_in 'task[description]', with: 'hello'
    click_on 'submit'
    assert_text 'Task was successfully updated.'
    assert_text 'hello'
  end 

  test 'as a logged user I can mark a task done' do 
    log_in_and_go_on_list
    click_on 'Mark as done'
    assert_text 'Congratulations, this task is done.'
  end 

  test 'as a logged user I can find archived tasks' do 
    log_in_and_go_on_list
    click_on 'Mark as done'
    click_on 'Archived tasks'
    assert_text 'Amazing task'
  end 

  test 'as a logged user I can filter by tags' do 
    @list.tasks.create(name: 'boring task', all_tags: 'foo')
    log_in_and_go_on_list
    click_on 'foo'
    assert_text 'clear filter'
    assert_text 'Boring task'
    assert_no_text 'Amazing task'
  end

  test 'as a logged user I can destroy a task' do 
    log_in_and_go_on_list
    click_on 'Destroy'
    page.driver.browser.switch_to.alert.accept
    assert_text 'Task was successfully destroyed.'
    assert_equal(@user.lists.first.tasks.count(), 0, true)
  end

end