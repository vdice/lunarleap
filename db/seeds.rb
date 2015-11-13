# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user = User.create({username: 'Fred', email: 'fr@ed.com', password: 'password'})

challenge = user.challenges.new({name: 'Spend less than 5 dollars a day',
              description: 'I\'ve decided I\'ve been spending far too much money.'})

updates = challenge.updates.new([{title: 'So far so good', body: 'Doing well'},
                                    {title: 'Uh oh', body: 'Spent 6 dollars!'}])
user.save
challenge.save

follower = User.create({username: 'Craig', email: 'cr@ig.com', password: 'password'})

subscription = follower.subscriptions.create({author_id: user.id})

categories = Category.create([{name: 'Fitness'},
                              {name: 'Creative'},
                              {name: 'Knowledge'},
                              {name: 'Environmental'},
                              {name: 'Music'},
                              {name: 'Art'},
                              {name: 'Humanitarian'},
                              {name: 'Health'}])
