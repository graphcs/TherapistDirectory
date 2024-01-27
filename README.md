# README

# Therapists Directory

Therapists Directory is a Ruby on Rails application that allows prospective patients to view a list of therapists and filter the results based on various criteria.

## Prerequisites

Make sure you have the following installed on your system:

- Ruby (version 3.1.2)
- Ruby on Rails (version 7.0.8)
- SQLite

## Getting Started

Clone the repository: `git clone git@github.com:graphcs/TherapistDirectory.git`

Go into the root directory:
`cd TherapistDirectory`

Install ruby (if not already installed)
`rvm install "ruby-3.1.2"`

Install app
`bundle install`

Migrate DB
`rails db:migrate`
`rails db:migrate RAILS_ENV=test`
  
Seed DB
`rails db:seed`

Run tests:
`rails test test/controllers/therapists_controller_test.rb`

Run the app server
`rails server`

Run app publicly accessible on webserver:
`nohup rails server -b 0.0.0.0 -p 3000 > log.txt 2>&1 &`

Stop background process running on port 3000:
`kill $(lsof -t -i:3000)`

Staging environment link:
http://64.225.50.172:3000/

Potential Improvements:

Enhancing the UI/UX by incorporating more user-friendly design elements.
Implementing client-side validation to provide instant feedback on form input errors.
Add additional filtering options, such as therapist specialties or appointment availability.
Incorporate an advanced search feature for more specific user queries.