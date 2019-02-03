require 'rails_helper'

describe Paragraph do

  before do
    @test_paragraph1 = Paragraph.new(paragraph_content: "Lorem Ipsum is simply dummy text of the printing and typesetting industry." \
                    " Lorem Ipsum has been the industry's standard dummy text ever since the 1500s," \
                    " when an unknown printer took a galley of type and scrambled it to make a type" \
                    " specimen book. It has survived not only five centuries, but also the leap into" \
                    " electronic typesetting, remaining essentially unchanged.")
    @test_paragraph2 = Paragraph.new(paragraph_content: "Lorem Ipsum. Oh Latin! But is it really Latin?")
  end


  describe '#split_into_sentences' do
    it 'splits test_content into sentences' do
      expect(@test_paragraph1.split_into_sentences).to eq(["Lorem Ipsum is simply dummy text of the printing and typesetting industry.", "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.", "It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged."])
      expect(@test_paragraph2.split_into_sentences).to eq(["Lorem Ipsum.", "Oh Latin!", "But is it really Latin?"])
    end
  end

  describe '#word_count_per_sentence' do
    it 'creates a sentences hash with a sentence : word_count pair' do
      expect(@test_paragraph1.word_count_per_sentence).to eq({"Lorem Ipsum is simply dummy text of the printing and typesetting industry." => 12, "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book." => 31, "It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged." => 17})
      expect(@test_paragraph2.word_count_per_sentence).to eq({"Lorem Ipsum." => 2, "Oh Latin!" => 2, "But is it really Latin?" => 5})
    end
  end

  describe '#total_letter_count' do
    it 'counts case-insensitive letters in paragraph' do
      expect(@test_paragraph2.total_letter_count).to eq({"a"=>3, "b"=>1, "e"=>2, "h"=>1, "i"=>5, "l"=>5, "m"=>2, "n"=>2, "o"=>2, "p"=>1, "r"=>2, "s"=>2, "t"=>4, "u"=>2, "y"=>1})
    end
  end
end
