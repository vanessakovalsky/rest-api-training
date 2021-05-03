# Exercice 3 - Concevoir son API avec Swagger

## Objectifs 
* Concevoir son API Rest en respectant les bonnes pratiques 
* Documenter son API Rest avec Swagger

## Concevoir son API Rest
* En respectant les bonnes pratiques, concevoir l'API Rest suivantes : 
    * Données :
        * Jeu : 
            * id (numérique)
            * Nom du jeux
            * Editeur
            * Année de sortie
            * Photos (autre donnée)
            * Descriptif
            * Catégorie (Familiale / Gestion / Figurine / Expert / Apéro)
            * Durée
            * Nombre de joueur
            * Commentaires 
        * Utilisateur
            * id (numérique)
            * Identifant (pseudo)
            * Nom
            * Prénom
            * Role (membre / administrateur)
            * Présentation
            * Avatar (photo, donc lien vers une autre données)
            * Email
            * Mot de passe
        * Photo
            * id
            * chemin vers le fichier
            * nom de la photo
    * Méthode : 
        * Jeu
            * Lister les jeux (optionnellement par catégorie)
            * Ajouter un jeu 
            * Afficher un jeu (à partir de son id)
            * Modifier un jeu (à partir de son id)
            * Supprimer un jeu (à partir de son id)
        * Utilisateur 
            * Se connecter 
            * Lister les utilisateur
            * Ajouter un Utilisateur 
            * Afficher un Utilisateur (à partir de son id)
            * Modifier un Utilisateur (à partir de son id)
            * Modifier mon propre utilisateur
            * Supprimer un Utilisateur (à partir de son id)
        * Photo
            * Récupérer le chemin et le nom d'une photo à partir de son id
            * Ajouter une photo
            * Supprimer une photo (à partir de son id)

## Documenter son API dans Swagger
* Se créer un compte et se connecter sur https://swagger.io/ 
* Documenter l'API que l'on vient de concevoir dans swagger
* Commencer par représenter les données sous la forme de modèle
* Puis définir les méthodes une par une en choisissant le bon verbes
