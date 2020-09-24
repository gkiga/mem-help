# README

How to get started:

Clone the repo into your working directory

Run `bundle install` to install all the other gem dependencies in the project-app gemset.

Run `yarn install` to install all the JS dependencies in a node_modules folder.

Run `rails db:migrate:reset` to create/reset the project databases.

Run `rails db:seed` to obtain required seed data

As a quick sanity check to make sure that things are working, you can run rails test. Although the app has no tests, the command should run without error.

You can also run rails s and open http://localhost:3000 to confirm that the development server runs without error and the default page loads as expected.
