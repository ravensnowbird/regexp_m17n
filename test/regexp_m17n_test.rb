# encoding: utf-8
require 'minitest/autorun'
require_relative '../lib/regexp_m17n'

class RegexpTest < MiniTest::Unit::TestCase
  def test_non_empty_string
    Encoding.list.each do |enc|
      p "#########"
      p enc.name
      begin
        assert(RegexpM17N.non_empty?('.'.encode(enc), enc))
      rescue
        p "no encoder"
      end
    end
  end
end
