class UsersController < ApplicationController
  def show
    @gossip = Gossip.find(params[:id])
    @user = @gossip.user
  end

  def new

  end

  def create
  @user = User.new(first_name: params[:first_name], last_name: params[:last_name], description:params[:description], email:params[:email],age:params[:age],city_id:60,password:params[:password])

    if @user.save # essaie de sauvegarder en base @user
      # si ça marche, il redirige vers la page d'index du site
      flash[:notice] = "utilisateur créé avec succès!"
      redirect_to gossips_path
    else
      # sinon, il render la view new (qui est celle sur laquelle on est déjà)
      render :new
    end
  end
end
