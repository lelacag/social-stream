# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

users = User.create([{ email: 'rubydeve@gmail.com', password: 'admin2015', password_confirmation: 'admin2015', username: 'alexandrule' },
                     { email: 'max@example.com', password: 'admin2015', password_confirmation: 'admin2015', username: 'max' }
                    ])

user_id = User.find_by(email: 'rubydeve@gmail.com').id

communities = Community.create([{ owner_id: user_id, name: 'I love' },
                                { owner_id: user_id, name: 'I hate' },
                                { owner_id: user_id, name: 'I confess' },
                                { owner_id: user_id, name: 'I adore' },
                                { owner_id: user_id, name: 'I stand up for' },
                                { owner_id: user_id, name: 'I like' },
                                { owner_id: user_id, name: 'FML' },
                                { owner_id: user_id, name: 'Sikerler' }
                               ])
