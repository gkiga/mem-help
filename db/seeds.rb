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
    volunteer_hours: 10,
    bio: 'Hello! I can offer help with programing languages like Python or Java!',
    password: 'acedef'
)

u2 = User.create!(
    first_name: 'Jane',
    last_name: 'Doe',
    major: 'Undecided',
    contact_info: '(901) 555-5555',
    email: 'jane@email.com',
    interests: 'Gardening',
    volunteer_hours: 0,
    bio: "Hey! I'm just on the site to learn some new skills! :)",
    password: '123456'
)