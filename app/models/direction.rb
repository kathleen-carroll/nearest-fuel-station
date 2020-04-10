class Direction
  attr_reader :instruction, :duration, :distance

  def initialize(direction_info)
    @instruction = direction_info[:html_instructions].html_safe
    @duration = direction_info[:duration][:text]
    @distance = direction_info[:distance][:text]
  end
end
