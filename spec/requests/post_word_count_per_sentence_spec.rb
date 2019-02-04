require 'rails_helper'

describe 'word_count_per_sentence post request', :type => :request do
  context 'when successful' do
    before(:all) do
      @test_paragraph1 = Paragraph.new(paragraph_content:
                         "Lorem Ipsum is simply dummy text of the printing and typesetting industry." \
                         " Lorem Ipsum has been the industry's standard dummy text ever since the 1500s," \
                         " when an unknown printer took a galley of type and scrambled it to make a type" \
                         " specimen book. It has survived not only five centuries, but also the leap into" \
                         " electronic typesetting, remaining essentially unchanged.")

       post '/word_count_per_sentence', params: { key: 'p1', value: @test_paragraph1.content }
    end

    it 'returns individual sentences along with the word count per sentence' do
      expect(JSON.parse(response.body)).to eq(@test_paragraph1.sentence_and_word_count_hash)
    end

    it 'returns a 200 status when successful' do
      expect(response).to have_http_status(:success)
    end
  end

  context 'when not successful' do
    before do
      post '/word_count_per_sentence', params: {:key => 'p1'}
    end

    it 'returns a 422 status when no value is given' do
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end
end
