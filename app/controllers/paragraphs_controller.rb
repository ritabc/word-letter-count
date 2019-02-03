class ParagraphsController < ApplicationController

  def word_count_per_sentence
    new_paragraph = Paragraph.new(paragraph_content: permit_paragraphs["content"])
    json_response(new_paragraph)
  end

  private
  def json_response(object)
    render json: object, status: :ok
  end

  def permit_paragraphs
    params.permit(:key, :content)
  end
end
