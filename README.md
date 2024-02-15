2.2.1. Hot Gossip

resources :gossips, only: [:new, :create, :index, :show]

rails g controller Gossips index show new create

gossip#show:id


L'objectif de cette partie est que tu crées la page potin (la page show qui affiche un potin spécifique). C’est-à-dire que quand tu tapes l'URL /gossips/3, tu arrives sur la page affichant le contenu du potin portant l'ID 3. La page potin doit afficher :

Son titre
Son contenu
Son auteur
La ville de l'auteur
À partir de la page d'accueil, qui contient l'index des potins, chaque potin doit être accompagné d'un lien pointant vers sa propre page.


2.2.2. Hot user

resources :users, only: [:show]

rails g controller Users show

/users/:id/

gossip = Gossip.find(params[:id])
gossip.user

L'objectif de cette partie est de faire de même pour la page utilisateur. Cette page doit afficher :

Son prénom
Son nom
Sa description
Son e-mail
Son age
Le nom de sa ville
Sur la page show d'un potin, l'utilisateur doit pouvoir en savoir plus sur l'auteur du potin en question. Il doit y avoir un lien vers la page show de l'auteur.

2.2.3. Hot city
Allez, dernière page show : la page pour afficher le détail d'une ville. Cette page devra afficher :


.user.city.(blabla info)
User.where(city_id: ID DE LA VILLE)
Gossip.find(User.where(city_id:8))
Le nom de la ville
Les potins écrits par les utilisateurs associés à la ville en question (faire une liste comme celle de la page d'accueil)
La page ville doit être accessible depuis la page utilisateur (lien vers la ville de l'utilisateur) et depuis la page potin (lien vers la ville de l'auteur).

2.1. Création d'utilisateurs
Fais donc une création d'utilisateur, avec la notion de mot de passe. Bien entendu, le mot de passe ne sera pas stocké en clair dans ta base de données.

Le lien pour s'inscrire devra être sur la navbar. Et une fois l'utilisateur inscrit l'utilisateur sera redirigé vers la page d'accueil.

def change
    add_column :users, :password_digest, :string
end

class User < ApplicationRecord
    has_secure_password
end
Mtn j'ai ma page User/new qui permet de s'inscrire


Pour gérer les connexions à ton app Rails, on va gérer des "sessions" via un sessions_controller qui contiendra les méthodes avec #new, #create, et #destroy.

rails g controller Session  new create destroy

La création d'une session se fera au travers de la page de login où l'on demande mot de passe et email.
Puis la méthode #create va s'occuper d'essayer d'authentifier l'utilisateur avec le couple email-mot de passe. Si ce dernier est bien authentifié, nous stockerons l'info avec session[:user_id] = user.id. S'il n'est pas bien authentifié, on fera un render de la page de login avec les messages d'erreur.
Une fois l'utilisateur connecté, ce sera très simple de retrouver notre utilisateur grâce à User.find(session[:user_id])

https://www.youtube.com/watch?v=bD--WOyQkug
