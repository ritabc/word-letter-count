require 'rails_helper'

describe 'word_count_per_sentence post request route', :type => :request do
  $test_content = "Lorem Ipsum is simply dummy text of the printing and typesetting industry." \
                  " Lorem Ipsum has been the industry's standard dummy text ever since the 1500s," \
                  " when an unknown printer took a galley of type and scrambled it to make a type" \
                  " specimen book. It has survived not only five centuries, but also the leap into" \
                  " electronic typesetting, remaining essentially unchanged."

  before do
    post '/word_count_per_sentence', params: {:key => 'p1', :content => $test_content }
  end

  it "returns the paragraph's content" do
    expect(JSON.parse(response.body)['content']).to eq ($test_content)
  end
end
