class Pipeline

  def initialize(sections)
    @sections = sections
  end

  def call(inputs)
    inputs.map do |input|
      @sections.inject(input) { |i, section| section.call(i)}
    end
  end

  def self.default
    Pipeline.new([])
  end

end
