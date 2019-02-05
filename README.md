# README

## Word/Letter Counter Coding Assignment
February 2019, Rita Bennett-Chew

## Description
An API with 2 POST endpoints:
- word_count_per_sentence: returns individual sentences with a word count for each
- total_letter_count: returns the total letter count for the given paragraph/content

## Technologies Used
- Ruby 2.5.3
- Rails 5.2.1
- Bundler 2.0.1
- Gems Added to Gemfile:
  * rspec-rails (for testing, specifically for request specs)
  * pry (for debugging)
  * rubocop (for linting)


## Notes
- No database was used for this API, and references to / dependencies on ActiveRecord were removed

## Style Guides and Philosophies Followed
- Test Driven Development (TDD)
- [rubocop style guide](https://github.com/rubocop-hq/ruby-style-guide)
- Comments were excluded in favor of easily readable code. Exceptions include multi-method chains

## Deployment/Contribution Instructions
For a local copy:
- Clone [the repository](https://github.com/ritabc/word-letter-count.git) to your local machine
- Ensure all versions of Ruby, Rails, and Bundler listed above are installed locally
- Navigate to the project directory and run `bundle install`
- Run `rails s` to run the server on localhost port 3000
- Use curl commands or a tool like Postman to make calls to the API, for instance:
```
curl -d "key=p1&value=This is a sentence. This is a second sentence" -X POST http://localhost:3000/word_count_per_sentence
```
- To run the test suite from the project directory, run `rspec`

## Assumptions/Decisions Made
I assumed the following:
- word_count_per_sentence should return both each sentence, and the total number of words for each sentence, not the frequency of each word used.
- This API will never have or need views, and neither will it ever have a database. Additionally, it will never need ActiveRecord. All references to ActiveRecord and Postgres were removed
- Since I am not computing anything with the key/name/identifier for the paragraph, nor am I storing it anywhere, I decided to make a Paragraph Model that does not take into account the key sent with the POST request. Additionally, since it sounds like only 1 key/value pair is being sent at a time, I decided to not do anything with (for example, store, conduct computations on, or return) the key
- Given the instruction to define a sentence as a grouping of letters ending with a period, question, or exclamation mark, I made the assumption no titles or abbreviations ending in periods will be sent as input (Mr. or etc.).
- I decided to keep sentence-ending punctuation in each sentence, and that the easiest / most efficient way to write the methods involved regex.
- Assuming for total_letter_count, only a-z and A-Z letters should be counted (no spaces or punctuation)
- No specific JSON requirements besides being readable and clear. If there was another application calling this API and expecting the JSON in a particular format, I may have used a serializer to format the output.
- Only POST requests are sent, so no custom exception messages for GET, PUT, etc. requests are generated. As in, if a GET request is sent, the default error message will be sent back: 'RoutingError, No route matches [GET]'
- Assumed that most of the time, 2 arguments will be submitted, one being 'key' and the other being 'value'. In practice only 'value' is required, and if the person or application calling the API submits other parameters, that is fine.
  * However, for security purposes only key and value params are whitelisted.
  * If 'value' is not submitted, an error will be thrown.

## Lessons Learned
- Next time, I would create a Rails API without a database using the `--skip-active-record` option when generating a new application
