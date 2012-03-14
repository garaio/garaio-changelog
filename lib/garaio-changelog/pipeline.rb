require 'garaio-changelog/pipeline/kategorie_extractor'

class Pipeline

  def initialize(sections)
    @sections = sections
  end

  def call(inputs)
    inputs.map do |input|
      @sections.inject(input) do |i, section|
        next unless i
        section.call(i)
      end
    end.compact
  end

  def self.default
    Pipeline.new([KategorieExtractor.new])
  end

end
