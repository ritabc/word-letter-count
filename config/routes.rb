Rails.application.routes.draw do

  # POST route for returning individual sentences and a word count for each sentence
  post 'word_count_per_sentence' => 'paragraphs#word_count_per_sentence'

  # POST route for returning the number of times each case-insensitive letter appears in the Paragraph
  post 'total_letter_count' => 'paragraphs#total_letter_count'
  
end
