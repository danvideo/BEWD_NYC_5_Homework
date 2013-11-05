class Bob
  def hey(message)
    @message = message

    if screaming?
      'Woah, chill out!'
    elsif giving_silent_treatment?
      'Fine. Be that way!'
    elsif questioning?
      'Sure.'
    else
      "Whatever."
    end
  end

  def questioning?
    @message.end_with? '?'
  end

  def screaming?
    @message == @message.upcase && @message =~ /[a-zA-Z]/
  end

  def giving_silent_treatment?
    @message.strip.empty?
  end
end
