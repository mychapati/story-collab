Story-Collab (Working Title)
============================

Notes
-----

* If errors happen, +bundle update+ and +rake db:migrate+ are your friends!

Setup
-----
* Run `rake db:migrate`
* Rename `/config/initializers/devise.rb.sample` to `devise.rb` and modify the Facebook APP_ID and SECRET.
* Run `rails server` and you're up and running!

Models
------
* Story - story metadata
* StoryText - story text (current and previous versions)

Tests
-----
* Run `rspec spec` to run all tests.