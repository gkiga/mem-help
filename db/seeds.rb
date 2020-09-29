# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

u1 = User.create!(
    email: 'larry@email.com',
    password: 'acedef'
)

u2 = User.create!(
    email: 'jane@email.com',
    password: '123456'
)
u3 = User.create!(
    email: 'alice@gmail.com',
    password: 'password',
    
)

u4 = User.create!(
    email: 'bob@gmail.com',
    password: 'password',
   
   
)
u5 = User.create!(
    email: 'cody@gmail.com',
    password: 'password',
   
)

u6 = User.create!(
    email: 'daniel@gmail.com',
    password: 'password',
    
    
)

#listing1 = Listing.create!(
 #   title: 'My Sent Requests',
  #  description: 'Requests that I have sent.',
#)

#listing2 = Listing.create!(
 #   title: 'My Sent Requests',
  #  description: 'Requests I have sent to others.',
#)
#listing3 = Listing.create!(
 #   title: 'My Pending Requests',
  #  description: 'Requests I have yet to accept or decline.',
#)

r1 = Request.create!(
    #user: u1,
    sender: 'Alice',
    description: 'I want to learn to yodel!',
    recipient: u2.email,
    acceptedFlag: true,
    completedFlag: false,
    category: 'Music',
    learningPreference: 'Live 1-on-1 Session',
   
)
r2 = Request.create!(
    #user: u1,
    sender: 'Alice',
    description: 'I want to learn to cook Italian!',
    recipient: u2.email,
    acceptedFlag: true,
    completedFlag: false,
    category: 'Cooking', 
    learningPreference: 'Pre-recorded Video',
)
r3 = Request.create!(
    #user: u1,
    sender: 'Alice',
    description: 'I want to learn to paint!',
    recipient: u2.email,
    acceptedFlag: true,
    completedFlag: false,
    category: 'Home Improvement',
    learningPreference: 'Pre-recorded Video',
)
r4 = Request.create!(
    #user: u2,
    sender: 'Bob',
    description: 'I want to learn photography',
    recipient: u3.email,
    acceptedFlag: true,
    completedFlag: false,
    category: 'Photography',
    learningPreference: 'Live 1-on-1 Session',
)
r5 = Request.create!(
    #user: u3,
    sender: 'Cody',
    description: 'I want to learn how to read Shakespeare!',
    recipient: u1.email,
    acceptedFlag: true,
    completedFlag: false,
    category: 'English Literature',
    learningPreference: 'Live Video Conferencing',
)
r6 = Request.create!(
    #user: u3,
    sender: 'Cody',
    description: 'I want to learn physics!',
    recipient: u2.email,
    acceptedFlag: true,
    completedFlag: false,
    category: 'Science',
    learningPreference: 'Live Video Conferencing',
)
r7 = Request.create!(
    #user: u4,
    sender: 'Daniel',
    description: 'I want to learn legal history',
    recipient: u1.email,
    acceptedFlag: false,
    completedFlag: false,
    category: 'Law',
    learningPreference: 'Live 1-on-1 Session',
)
r8 = Request.create!(
    #user: u4,
    sender: 'Daniel',
    description: 'I want to learn how to play tennis!',
    recipient: u2.email,
    acceptedFlag: false,
    completedFlag: false,
    category: 'Sports',
    learningPreference: 'Live 1-on-1 Session',
)
r9 = Request.create!(
    #user: u4,
    sender: 'Daniel',
    description: 'I want to learn basketball!',
    recipient: u3.email,
    acceptedFlag: false,
    completedFlag: false,
    category: 'Sports',
    learningPreference: 'Live 1-on-1 Session',
)
