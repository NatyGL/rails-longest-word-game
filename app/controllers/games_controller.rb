require 'open-uri'
require 'json'

class GamesController < ApplicationController
  def new
    @letters = Array('A'..'Z').sample(10)
  end

  def score
   @word_user = params[:word]
   url = "https://wagon-dictionary.herokuapp.com/#{@word_user}"
   word_serialized = URI.open(url).read
   word = JSON.parse(word_serialized)
   result = word['found']
   letters_user = @word_user.split
   letters_user.each do |letter|
    is_valid =  @letters.include?(letter)
   end

   if result == true
    @message = "Congratulations!#{@word_user} is a valid English word"
   elsif result == false
    @message = "Sorry but #{@word_user} does not seem to be a valid English word.."
   elsif is_valid == true
    @message = "Congratulations!#{@word_user} is a valid English word"
   else
    @message = "Sorry but #{@word_user} can't be build out of #{@letters}"
   end
  end
end
