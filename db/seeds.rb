# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

users = User.create([{ email: 'rubydeve@gmail.com', password: 'password', password_confirmation: 'password', username: 'alexandrule' },
                     { email: 'user1@example.com', password: 'password', password_confirmation: 'password', username: 'user1' },
                     { email: 'user2@example.com', password: 'password', password_confirmation: 'password', username: 'user2' },
                     { email: 'user3@example.com', password: 'password', password_confirmation: 'password', username: 'user3' },
                     { email: 'user4@example.com', password: 'password', password_confirmation: 'password', username: 'user4' },
                     { email: 'user5@example.com', password: 'password', password_confirmation: 'password', username: 'user5' },
                     { email: 'user6@example.com', password: 'password', password_confirmation: 'password', username: 'user6' },
                     { email: 'user7@example.com', password: 'password', password_confirmation: 'password', username: 'user7' },
                     { email: 'user8@example.com', password: 'password', password_confirmation: 'password', username: 'user8' },
                     { email: 'user9@example.com', password: 'password', password_confirmation: 'password', username: 'user9' },
                     { email: 'user10@example.com', password: 'password', password_confirmation: 'password', username: 'user10' }
                    ])

admin =  User.find_by(email: 'rubydeve@gmail.com')
user1 =  User.find_by(email: 'user1@example.com')
user2 =  User.find_by(email: 'user2@example.com')
user3 =  User.find_by(email: 'user3@example.com')
user4 =  User.find_by(email: 'user4@example.com')
user5 =  User.find_by(email: 'user5@example.com')
user6 =  User.find_by(email: 'user6@example.com')
user7 =  User.find_by(email: 'user7@example.com')
user8 =  User.find_by(email: 'user8@example.com')
user9 =  User.find_by(email: 'user9@example.com')
user10 = User.find_by(email: 'user10@example.com')

Community.create([{ owner_id: admin.id, name: Faker::Lorem.word },
                  { owner_id: admin.id, name: Faker::Lorem.word },
                  { owner_id: admin.id, name: Faker::Lorem.word },
                  { owner_id: admin.id, name: Faker::Lorem.word },
                  { owner_id: admin.id, name: Faker::Lorem.word },
                  { owner_id: admin.id, name: Faker::Lorem.word },
                  { owner_id: admin.id, name: Faker::Lorem.word },
                  { owner_id: admin.id, name: Faker::Lorem.word },
                  { owner_id: admin.id, name: Faker::Lorem.word },
                  { owner_id: admin.id, name: Faker::Lorem.word },

                  { owner_id: user1.id, name: Faker::Lorem.word },
                  { owner_id: user1.id, name: Faker::Lorem.word },
                  { owner_id: user1.id, name: Faker::Lorem.word },
                  { owner_id: user1.id, name: Faker::Lorem.word },
                  { owner_id: user1.id, name: Faker::Lorem.word },
                  { owner_id: user1.id, name: Faker::Lorem.word },
                  { owner_id: user1.id, name: Faker::Lorem.word },
                  { owner_id: user1.id, name: Faker::Lorem.word },
                  { owner_id: user1.id, name: Faker::Lorem.word },
                  { owner_id: user1.id, name: Faker::Lorem.word },

                  { owner_id: user2.id, name: Faker::Lorem.word },
                  { owner_id: user2.id, name: Faker::Lorem.word },
                  { owner_id: user2.id, name: Faker::Lorem.word },
                  { owner_id: user2.id, name: Faker::Lorem.word },
                  { owner_id: user2.id, name: Faker::Lorem.word },
                  { owner_id: user2.id, name: Faker::Lorem.word },
                  { owner_id: user2.id, name: Faker::Lorem.word },
                  { owner_id: user2.id, name: Faker::Lorem.word },
                  { owner_id: user2.id, name: Faker::Lorem.word },
                  { owner_id: user2.id, name: Faker::Lorem.word },

                  { owner_id: user3.id, name: Faker::Lorem.word },
                  { owner_id: user3.id, name: Faker::Lorem.word },
                  { owner_id: user3.id, name: Faker::Lorem.word },
                  { owner_id: user3.id, name: Faker::Lorem.word },
                  { owner_id: user3.id, name: Faker::Lorem.word },
                  { owner_id: user3.id, name: Faker::Lorem.word },
                  { owner_id: user3.id, name: Faker::Lorem.word },
                  { owner_id: user3.id, name: Faker::Lorem.word },
                  { owner_id: user3.id, name: Faker::Lorem.word },
                  { owner_id: user3.id, name: Faker::Lorem.word },

                  { owner_id: user4.id, name: Faker::Lorem.word },
                  { owner_id: user4.id, name: Faker::Lorem.word },
                  { owner_id: user4.id, name: Faker::Lorem.word },
                  { owner_id: user4.id, name: Faker::Lorem.word },
                  { owner_id: user4.id, name: Faker::Lorem.word },
                  { owner_id: user4.id, name: Faker::Lorem.word },
                  { owner_id: user4.id, name: Faker::Lorem.word },
                  { owner_id: user4.id, name: Faker::Lorem.word },
                  { owner_id: user4.id, name: Faker::Lorem.word },
                  { owner_id: user4.id, name: Faker::Lorem.word },

                  { owner_id: user5.id, name: Faker::Lorem.word },
                  { owner_id: user5.id, name: Faker::Lorem.word },
                  { owner_id: user5.id, name: Faker::Lorem.word },
                  { owner_id: user5.id, name: Faker::Lorem.word },
                  { owner_id: user5.id, name: Faker::Lorem.word },
                  { owner_id: user5.id, name: Faker::Lorem.word },
                  { owner_id: user5.id, name: Faker::Lorem.word },
                  { owner_id: user5.id, name: Faker::Lorem.word },
                  { owner_id: user5.id, name: Faker::Lorem.word },
                  { owner_id: user5.id, name: Faker::Lorem.word },

                  { owner_id: user6.id, name: Faker::Lorem.word },
                  { owner_id: user6.id, name: Faker::Lorem.word },
                  { owner_id: user6.id, name: Faker::Lorem.word },
                  { owner_id: user6.id, name: Faker::Lorem.word },
                  { owner_id: user6.id, name: Faker::Lorem.word },
                  { owner_id: user6.id, name: Faker::Lorem.word },
                  { owner_id: user6.id, name: Faker::Lorem.word },
                  { owner_id: user6.id, name: Faker::Lorem.word },
                  { owner_id: user6.id, name: Faker::Lorem.word },
                  { owner_id: user6.id, name: Faker::Lorem.word },

                  { owner_id: user7.id, name: Faker::Lorem.word },
                  { owner_id: user7.id, name: Faker::Lorem.word },
                  { owner_id: user7.id, name: Faker::Lorem.word },
                  { owner_id: user7.id, name: Faker::Lorem.word },
                  { owner_id: user7.id, name: Faker::Lorem.word },
                  { owner_id: user7.id, name: Faker::Lorem.word },
                  { owner_id: user7.id, name: Faker::Lorem.word },
                  { owner_id: user7.id, name: Faker::Lorem.word },
                  { owner_id: user7.id, name: Faker::Lorem.word },
                  { owner_id: user7.id, name: Faker::Lorem.word },

                  { owner_id: user8.id, name: Faker::Lorem.word },
                  { owner_id: user8.id, name: Faker::Lorem.word },
                  { owner_id: user8.id, name: Faker::Lorem.word },
                  { owner_id: user8.id, name: Faker::Lorem.word },
                  { owner_id: user8.id, name: Faker::Lorem.word },
                  { owner_id: user8.id, name: Faker::Lorem.word },
                  { owner_id: user8.id, name: Faker::Lorem.word },
                  { owner_id: user8.id, name: Faker::Lorem.word },
                  { owner_id: user8.id, name: Faker::Lorem.word },
                  { owner_id: user8.id, name: Faker::Lorem.word },

                  { owner_id: user9.id, name: Faker::Lorem.word },
                  { owner_id: user9.id, name: Faker::Lorem.word },
                  { owner_id: user9.id, name: Faker::Lorem.word },
                  { owner_id: user9.id, name: Faker::Lorem.word },
                  { owner_id: user9.id, name: Faker::Lorem.word },
                  { owner_id: user9.id, name: Faker::Lorem.word },
                  { owner_id: user9.id, name: Faker::Lorem.word },
                  { owner_id: user9.id, name: Faker::Lorem.word },
                  { owner_id: user9.id, name: Faker::Lorem.word },
                  { owner_id: user9.id, name: Faker::Lorem.word },

                  { owner_id: user10.id, name: Faker::Lorem.word },
                  { owner_id: user10.id, name: Faker::Lorem.word },
                  { owner_id: user10.id, name: Faker::Lorem.word },
                  { owner_id: user10.id, name: Faker::Lorem.word },
                  { owner_id: user10.id, name: Faker::Lorem.word },
                  { owner_id: user10.id, name: Faker::Lorem.word },
                  { owner_id: user10.id, name: Faker::Lorem.word },
                  { owner_id: user10.id, name: Faker::Lorem.word },
                  { owner_id: user10.id, name: Faker::Lorem.word },
                  { owner_id: user10.id, name: Faker::Lorem.word }

                 ])
