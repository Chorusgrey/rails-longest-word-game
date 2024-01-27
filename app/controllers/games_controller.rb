require 'open-uri'
require 'json'
class GamesController < ApplicationController

  def new
    @letters = ("A".."Z").to_a.sample(10)
  end

  def score
    @word = params[:word].upcase.chars
    @letters = params[:letters].split
    if @word == []
      @message = "Sorry you must write a word"
    elsif included?(@word, @letters) && english_word?(@word.join)
      @message = "You won, your word: #{@word.join}"
    else
      @message = "You loose!!!"
    end
  end

  private

  def english_word?(word)
    response = URI.parse("https://wagon-dictionary.herokuapp.com/#{word}")
    json = JSON.parse(response.read)
    return json['found']
  end

  def included?(word,letters)
    @word.all? { |letter| @word.count(letter) <= @letters.count(letter) }
  end
end
