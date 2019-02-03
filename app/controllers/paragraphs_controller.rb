class ParagraphsController < ApplicationController

  def word_count_per_sentence
      test_paragraph_key = 'p1'
      test_paragraph_content = "Lorem Ipsum is simply dummy text of the printing and typesetting industry." \
                               " Lorem Ipsum has been the industry's standard dummy text ever since the 1500s," \
                               " when an unknown printer took a galley of type and scrambled it to make a type" \
                               " specimen book. It has survived not only five centuries, but also the leap into" \
                               " electronic typesetting, remaining essentially unchanged."
      paragraphs = {test_paragraph_key => test_paragraph_content}
      json_response(paragraphs)
    end

    private
    def json_response(object)
      render json: object, status: :ok
    end
end
