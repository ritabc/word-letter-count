class Paragraph
  attr_accessor(:content, :sentences, :sentence_and_word_count_hash, :letter_count_hash)

  def initialize(attributes)
    @content = attributes.fetch(:paragraph_content)
    @sentences = split_into_sentences
    @sentence_and_word_count_hash = word_count_per_sentence
    @letter_count_hash = total_letter_count
  end

  def split_into_sentences
    # substitute every sentence ender (period, question mark, or exclamation) with
    # itself plus a double comma, then split at the double commas.
    # Finally, strip the leading whitespace from each sentence
    @sentences = content.gsub(/[.?!]/, '\0,,').split(',,').map do |sentence|
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

  def total_letter_count
    letter_count_hash = {}
    # Only letters are counted, so first remove any non-letter character
    content.gsub(/[^a-zA-Z]/, '').split('').each do |letter|
      key = letter.downcase
      if letter_count_hash.include?(key)
        letter_count_hash[key] += 1
      else
        letter_count_hash[key] = 1
      end
    end
    letter_count_hash
  end
end
