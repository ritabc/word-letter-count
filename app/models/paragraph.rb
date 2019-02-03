class Paragraph
  attr_accessor(:content, :sentences, :sentence_and_word_count_hash)

  def initialize(attributes)
    @content = attributes.fetch(:paragraph_content)
    @sentences = self.split_into_sentences
    @sentence_and_word_count_hash = self.word_count_per_sentence
  end

  def split_into_sentences
    # substitute every sentence ender (period, question mark, or exclamation) with
    # itself plus a double comma, then split at the double commas.
    # Finally, strip the leading whitespace from each sentence
    @sentences = self.content.gsub(/[.?!]/, '\0,,').split(',,').map do |sentence|
      sentence.lstrip
    end
    @sentences
  end

  def word_count_per_sentence
    sentence_and_word_count_hash = {}
    @sentences.each do |sentence|
      word_count = sentence.split(" ").length
      sentence_and_word_count_hash[sentence] = word_count
    end
    sentence_and_word_count_hash
  end
end
