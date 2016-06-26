# http://judge.u-aizu.ac.jp/onlinejudge/description.jsp?id=0029
# require 'minitest/autorun'
require 'minitest'

class WordCount
  def sentence(array)
    result = array.each_with_object(Hash.new(0)) { |w, h| h[w] += 1 }
    [
      result.max_by { |_, v| v },
      result.max_by { |k, _| k.length }
    ].map { |a| a[0].to_s }
  end
end

mode, max_length = WordCount.new.sentence(STDIN.gets.split)
printf "%s %s\n", mode, max_length

class WrodCountTest < Minitest::Test
  def setup
    @word_count = WordCount.new
  end

  def test_sentence
    array = %w(Thank you for your mail and your lectures)
    expect = %w(your lectures)
    assert_equal(expect, @word_count.sentence(array))
  end
end
