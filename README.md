# README

# Start up with the project: 
rails db:create db:migrate db:seed 

# connect to a user account: 
user_1@gmail.com mdp: foofoo
user_2@gmail.com mdp: foofoo

# connect to an admin account: 
toto@gmail.com mdp: foofoo

# check congratulation email: 
open https://mailcatcher.me/ follow instructions and then rake list_finished_email

# check automated counting email: 
open https://mailcatcher.me/ follow instructions and then rake automated_count

# app available online at:
https://myawesometasklist.herokuapp.com/

# How to change private keys for algolia:
You might need to provide an api key and application id to use algoliasearch, 
then put them in this file:
EDITOR="code --wait" bin/rails credentials:edit

# launch all tests:
rails t test/system
