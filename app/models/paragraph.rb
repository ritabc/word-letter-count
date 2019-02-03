class Paragraph
  attr_accessor(:content)

  def initialize(attributes)
    @content = attributes.fetch(:paragraph_content)
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
end
