Rails.application.routes.draw do

  # POST route for returning individual sentences and a word count for each sentence
  post 'word_count_per_sentence' => 'paragraphs#word_count_per_sentence'

end
