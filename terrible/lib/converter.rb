require 'json'

class Converter
  def initialize(string)
    @string = string
  end

  def convert(type,uppercase = false)
     @string = @string.upcase if uppercase
     @string = @string.gsub(/&\w*&/, '****') if @string.count('&') == 2
    if type == :text
      @string
    elsif type == :html
      "<html><head></head><body>#{ @string }</body></html>"
    elsif type == :json
      { response: @string }.to_json
    elsif type == :xml
      "<response>#{ @string }</response>"
    else
      raise "Unrecognised type"
    end
  end
end
