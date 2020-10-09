# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#
# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  bio                    :text
#  contact_info           :string
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  first_name             :string
#  interests              :string
#  last_name              :string
#  major                  :string
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  teaching_methods       :string
#  volunteer_hours        :float
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#

u1 = User.create!(
    first_name: 'Bobby',
    last_name: 'Smith',
    major: 'Computer Science',
    contact_info: 'bobby@email.com',
    email: 'bobby@email.com',
    interests: 'Guitar',
    volunteer_hours: 0.0,
    bio: 'Hello! I can offer help with programing languages like Python or Java!',
    password: 'password',
)

u2 = User.create!(
    first_name: 'Jane',
    last_name: 'Doe',
    major: 'Undecided',
    contact_info: '(901) 555-5555',
    email: 'jane@email.com',
    interests: 'Gardening',
    volunteer_hours: 0.0,
    bio: "Hey! I'm just on the site to learn some new skills! :)",
    password: 'password',
)
u3 = User.create!(
    first_name: 'Alice',
    last_name: 'Akers',
    major: 'Exercise Science',
    contact_info: '(901) 444-4444',
    email: 'alice@email.com',
    interests: 'Music',
    volunteer_hours: 0.0,
    bio: "Hey! I want to learn to play music! :)",
    password: 'password',
)

u4 = User.create!(
    first_name: 'Cody',
    last_name: 'Cain',
    major: 'Biology',
    contact_info: '(901) 333-3333',
    email: 'cody@email.com',
    interests: 'Sports',
    volunteer_hours: 0.0,
    bio: "Hey! I want to learn to play tennis! :)",
    password: 'password',
)
u5 = User.create!(
    first_name: 'Daniel',
    last_name: 'Dinks',
    major: 'Chemistry',
    contact_info: '(901) 222-2222',
    email: 'daniel@email.com',
    interests: 'Chess',
    volunteer_hours: 0.0,
    bio: "Hey! I want to learn to play chess! :)",
    password: 'password',
)
u6 = User.create!(
    first_name: 'Ed',
    last_name: 'Eizner',
    major: 'Nursing',
    contact_info: '(901) 111-1111',
    email: 'ed@email.com',
    interests: 'Botany',
    volunteer_hours: 0.0,
    bio: "Hey! I want to learn to grow plants! :)",
    password: 'password',
)

r1 = Request.create!(
    #user: u1,
    sender: 'Alice',
    description: 'I want to learn to yodel!',
    recipient: 2,
    acceptedFlag: true,
    completedFlag: false,
    category: 'Music',
    learningPreference: 'Live 1-on-1 Session',
   
)
r2 = Request.create!(
    #user: u1,
    sender: 'Alice',
    description: 'I want to learn to cook Italian!',
    recipient: 2,
    acceptedFlag: true,
    completedFlag: false,
    category: 'Cooking', 
    learningPreference: 'Pre-recorded Video',
)
r3 = Request.create!(
    #user: u1,
    sender: 'Alice',
    description: 'I want to learn to paint!',
    recipient: 3,
    acceptedFlag: true,
    completedFlag: false,
    category: 'Home Improvement',
    learningPreference: 'Pre-recorded Video',
)
r4 = Request.create!(
    #user: u2,
    sender: 'Bob',
    description: 'I want to learn photography',
    recipient: 1,
    acceptedFlag: true,
    completedFlag: false,
    category: 'Photography',
    learningPreference: 'Live 1-on-1 Session',
)
r5 = Request.create!(
    #user: u3,
    sender: 'Cody',
    description: 'I want to learn how to read Shakespeare!',
    recipient: 1,
    acceptedFlag: true,
    completedFlag: false,
    category: 'English Literature',
    learningPreference: 'Live Video Conferencing',
)
r6 = Request.create!(
    #user: u3,
    sender: 'Cody',
    description: 'I want to learn physics!',
    recipient: 1,
    acceptedFlag: true,
    completedFlag: false,
    category: 'Science',
    learningPreference: 'Live Video Conferencing',
)
r7 = Request.create!(
    #user: u4,
    sender: 'Daniel',
    description: 'I want to learn legal history',
    recipient: 3,
    acceptedFlag: false,
    completedFlag: false,
    category: 'Law',
    learningPreference: 'Live 1-on-1 Session',
)
r8 = Request.create!(
    #user: u4,
    sender: 'Daniel',
    description: 'I want to learn how to play tennis!',
    recipient: 1,
    acceptedFlag: false,
    completedFlag: false,
    category: 'Sports',
    learningPreference: 'Live 1-on-1 Session',
)
r9 = Request.create!(
    #user: u4,
    sender: 'Daniel',
    description: 'I want to learn basketball!',
    recipient: 2,
    acceptedFlag: false,
    completedFlag: false,
    category: 'Sports',
    learningPreference: 'Live 1-on-1 Session',
)
