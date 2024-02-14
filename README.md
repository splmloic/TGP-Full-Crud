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

 resources :gossips do
      resources :users, only: [:show]
    end
rails g controller Gossips Users show

/gossips/gossips-id/user

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

Le nom de la ville
Les potins écrits par les utilisateurs associés à la ville en question (faire une liste comme celle de la page d'accueil)
La page ville doit être accessible depuis la page utilisateur (lien vers la ville de l'utilisateur) et depuis la page potin (lien vers la ville de l'auteur).