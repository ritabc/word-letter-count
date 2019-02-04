require 'rails_helper'

describe 'total_letter_count post request', :type => :request do
  context 'when successful' do

    before(:all) do
      @test_paragraph = Paragraph.new(paragraph_content: "Lorem Ipsum. Oh Latin! But is it really Latin?")
      post '/total_letter_count', params: {:key => 'p2', :value => @test_paragraph.content}
    end

    it 'returns total letter count in the entire content for each letter used' do
      expect(JSON.parse(response.body)).to eq(@test_paragraph.total_letter_count)
    end

    it 'returns a 200 status when successful' do
      expect(response).to have_http_status(:success)
    end

    it 'still successfully returns calculated letter count when an extra param is given' do
      post '/total_letter_count', params: {:key => 'p2', :value => @test_paragraph.content, :content => "etc."}
      expect(JSON.parse(response.body)).to eq(@test_paragraph.total_letter_count)
      expect(response).to have_http_status(:success)
    end

    it 'still successfully returns calculated letter count when only value param is given' do
      post '/total_letter_count', params: {:value => @test_paragraph.content}
      expect(JSON.parse(response.body)).to eq(@test_paragraph.total_letter_count)
      expect(response).to have_http_status(:success)
    end
  end

  context 'when not successful' do
    before do
      post '/total_letter_count', params: {:key => 'p2'}
    end

    it 'returns a 422 status when no value is given' do
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end
end
