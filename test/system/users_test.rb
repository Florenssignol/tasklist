require "application_system_test_case"

class UsersTest < ApplicationSystemTestCase

    test 'I can create a user' do
        visit root_url
        click_on 'create your account'
        fill_in 'user[name]', with: 'toto'
        fill_in 'user[email]', with: 'user@foo.gmail'
        fill_in 'user[password]', with: 'foofoo'
        fill_in 'user[password_confirmation]', with: 'foofoo'
        click_on 'commit'
        assert_text 'Welcome! You have signed up successfully.'
        assert_equal(User.count(), 1, true) 
    end
end