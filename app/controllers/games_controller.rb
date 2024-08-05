require "json"
require "open-uri"

class GamesController < ApplicationController

  def new
    @letters = []
    10.times { @letters << ('A'..'Z').to_a.sample }
  end

  def score
    @word = params[:word]
    @letters = params[:letters].split("")
    if @word.chars.all? { |letter| @letters.include?(letter) }
      url = "https://dictionary.lewagon.com/#{@word}"
      response = URI.open(url).read
      dico_response = JSON.parse(response)
      if dico_response["found"]
        @message = " Well done !"
      else
        @message = "Not an english word"
      end
    else
      @message = "Not in the grid"
    end
    # vérifier que pour chaque lettre de word
     #la lettre est contenu autant de fois que dans le word => .all peremt d'itérer sur le tableau et verifie que la condition soit vraie permet de rempalcer le each do 
  end
end
