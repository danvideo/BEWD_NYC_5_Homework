class Bob
  attr_accessor :hey
  # def initialize
  #   @hey = hey
  # end

  def hey(message)
    if message.strip.empty? 
      'Fine. Be that way!'
    elsif message == message.upcase && message.match(/[a-zA-Z]/)
      'Woah, chill out!'
    elsif message.end_with?('?') 
        'Sure.' 
    else
      "Whatever."
    end
  end

end