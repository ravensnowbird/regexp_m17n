# encoding: utf-8
require 'iconv'
module RegexpM17N
  def self.non_empty?(str, enc)
    p "TESTING CACHE"
    result = false
    begin
      result = ( str =~ /^.+$/ )
    rescue
      p "rescued"    
    end
    return result if result != false
    begin
      result = ( Encoding::Converter.new(enc.name, "UTF-8").convert(str) =~ /^.+$/ )
    rescue
      p "rescued"
    end
    return result if result != false
    begin
      result = ( Iconv.conv(enc.name, 'utf-8', str) =~ /^.+$/ )
    rescue
      p "rescued"
    end
  end
end
