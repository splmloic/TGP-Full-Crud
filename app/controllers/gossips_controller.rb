class GossipsController < ApplicationController
  def index
    @gossips = Gossip.all
  end

  def show
    @gossip = Gossip.find(params[:id])
  end

  def new
    #besoin de rien mon new est un form qui fait un post create
  end

  def create
    puts params
  @user = User.find(41)
  @gossip = Gossip.new(title: params[:title], content: params[:content], user: @user) # avec xxx qui sont les données obtenues à partir du formulaire

    if @gossip.save # essaie de sauvegarder en base @gossip
      # si ça marche, il redirige vers la page d'index du site
      flash[:notice] = "Gossip créé avec succès!"
      redirect_to '/gossips'
    else
      # sinon, il render la view new (qui est celle sur laquelle on est déjà)
      render :new
    end
  end
end