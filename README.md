# README

# Premier lancement du projet: 
rails db:create db:migrate db:seed 

# connect to a user account: 
user_1@gmail.com mdp: foofoo
user_2@gmail.com mdp: foofoo

#connect to an admin account: 
toto@gmail.com mdp: foofoo

#check congratulation email: 
open https://mailcatcher.me/ follow instructions and then rake list_finished_email

#check automated counting email: 
open https://mailcatcher.me/ follow instructions and then rake automated_count

#app available online at:
https://myawesometasklist.herokuapp.com/

#you might need to provide an api key and application id to use algoliasearch.

# How to change private keys for algolia:
EDITOR="code --wait" bin/rails credentials:edit
