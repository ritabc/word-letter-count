# README

## Technologies Used
- Ruby 2.5.3
- Rails 5.2.1
- Gems Added to Gemfile:
  * rspec-rails (for testing, specifically for request specs)
  * pry (for debugging)

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

## Assumptions/Decisions Made
I assumed the following:
- word_count_per_sentence should return the total number of words for each sentence, not the frequency of each word used (In addition to each individual sentence in the paragraph)
- This API will never have views
- No database was necessary, and neither was ActiveRecord. To remove, I
  * removed the 'pg' gem from the Gemfile
  * commented out the `require active_record` line from config/application.rb
  * commented out references to active_record in config/environments/**.rb
  * commented out ActiveRecord code from rspec file rails_helper.rb
  * removed config/database.yml file
  * commented out `config.use_transactional_fixtures = true`
  * added `Object.send(:remove_const, :ActiveRecord)` to rails_helper: solution via SO user Jack12816 (https://stackoverflow.com/questions/46204197/testing-a-databaseless-rails-5-application-with-rspec-rails)
  * deleted app/models/application_record file, since it inherited from ActiveRecord
- Since I am not computing anything with the key/name/identifier for the paragraph, nor am I storing it anywhere, I decided to make a Paragraph Model that does not take into account the key sent with the POST request. Additionally, since it sounds like only 1 key/value pair is being sent at a time, I decided to not do anything with (for example, store, conduct computations on, or return) the key
- No titles or abbreviations ending in periods will be used (Mr. or etc.)
- Decided to keep sentence-ending punctuation in each sentence, and that the easiest / most efficient way to do so involved regex.

## Style Guides and Philosophies Followed
- Test Driven Development (TDD)
- [rubocop style guide](https://github.com/rubocop-hq/ruby-style-guide)

## Notes
-

## Lessons Learned
- Can create a Rails API without a database using the `--skip-active-record` option when generateing a new application
