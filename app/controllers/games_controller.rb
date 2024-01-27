class GamesController < ApplicationController

  def new
    @letters = ("a".."z").to_a.sample(10)
  end

  def score
    @word = params[:word]
    # recupere les lettres de la grille de lettre et bien utiliser les lettres de la grille
    # params l'array des lettres
    # params des mots
    # if est ce que le mot il est bien construit par des lettres présentes
    # donc if  le mot est le dictionnaire voir api
  end
end
