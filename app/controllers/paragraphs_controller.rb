class ParagraphsController < ApplicationController

  def word_count_per_sentence
    new_paragraph = Paragraph.new(paragraph_content: paragraph_params['value'])
    json_response(new_paragraph.sentence_and_word_count_hash)
  end

  def total_letter_count
    new_paragraph = Paragraph.new(paragraph_content: paragraph_params['value'])
    json_response(new_paragraph.total_letter_count)
  end

  private
  
  def paragraph_params
    params.permit(:key, :value)
  end
end
