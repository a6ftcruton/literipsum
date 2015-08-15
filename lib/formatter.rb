class Formatter

  def self.normalize(input)
    dasherized = self.clean(input)
    self.append_underscore(dasherized)
  end

  private

  def self.clean(input)
    input = input.downcase.gsub(/\W|_/, "-")
    self.validate_last_char(input)
  end

  def self.validate_last_char(input)
    input[-1] =~ /[a-z]/ ? input : input[0..-2]
  end

  def self.append_underscore(input)
    input + "_"
  end

end
