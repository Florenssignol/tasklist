# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Admins
Admin.create!(email: 'toto@gmail.com', password: 'foofoo')

# Users
user_1 = User.create!(email: 'user_1@gmail.com', password: 'foofoo')
user_2 = User.create!(email: 'user_2@gmail.com', password: 'foofoo')

user_1_list_1 = user_1.lists.create!(name: 'courses', description: 'pour le carrefour')
user_1_list_2 = user_1.lists.create!(name: 'lecture', description: 'les livres que je dois lire')

user_2_list_1 = user_2.lists.create!(name: 'courses', description: 'pour le monoprix')
user_2_list_2 = user_2.lists.create!(name: 'lecture', description: 'on oublie pas ses lunettes')

task_1 = user_1_list_1.tasks.create!(name: 'oranges', description: 'des vitamines C')
task_2 = user_1_list_1.tasks.create!(name: 'haricots verts', description: 'en boite')
task_3 = user_1_list_2.tasks.create!(name: 'how to kill a mockingbird')
task_4 = user_1_list_2.tasks.create!(name: '1984')

task_2.tags.create!(name: 'yummy')
task_4.tags.create!(name: 'awesome')

task_5 = user_1_list_1.tasks.create!(name: 'oranges', description: 'des vitamines C')
task_6 = user_1_list_1.tasks.create!(name: 'haricots verts', description: 'yum')
task_7 = user_1_list_2.tasks.create!(name: 'how to kill a mockingbird')
task_8 = user_1_list_2.tasks.create!(name: '1984')

task_5.tags.create!(name: 'jus')
task_7.tags.create!(name: 'best')
