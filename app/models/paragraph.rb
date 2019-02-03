class Paragraph
  attr_writer(:content)

  def initialize(attributes)
    @content = attributes.fetch(:paragraph_content)
  end
end
