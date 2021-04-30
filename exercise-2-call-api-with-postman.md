# Exercice 2 - Appeler des API authentifiés avec Postman

## Objectifs 
* Savoir récupérer un token pour se connecter
* Utiliser Postman pour s'authentifier en utilisant le token

## Récupérer un token de connexion sur Github
* Github, comme de nombreuses API, fonctionne avec un système de jeton (token) qu'il faut générer depuis son compte et envoyer à chaque requête pour s'authentifier
* Pour générer votre token, rendez vous sur cette page (en étant connecté avec votre compte) : https://github.com/settings/tokens
* Cliquer sur Generate new token
* Vous pouvez lui donner un nom (note) qui vous permet de le retrouver, et sélectionner les actions que l'on peut faire avec ce token
* Une fois le token génér, il ne vous reste qu'à le copier, il ressemble à ça : 
```
ghp_NXG5sECj8SzcOVpz7jo2QV2U6pk6Re1nCh4Z
```
* Vous êtes prêt à utiliser ce token pour créer un dépôt par exemple

## Utiliser Postman pour se connecter et appeler l'API avec son token

* Installer postman : https://www.postman.com/downloads/ 
* Ouvrir postman, choisir la méthode GET et entrer l'URL suivante (en remplaçant vannesakovalsky par votre utilisateur) :  https://api.github.com/orgs/vanessakovalsky/repos  
* Appuyer sur SEND et la liste de vos dépôts apparait comme avec curl
* En restant sur la méthode GET et l'URL précédente, descendre dans la page et se positionner sur l'onglet Authorization
    * Dans Type, choisir Bearer Token
    * Coller votre token dans le champs prévu
* Nous allons maintenant créer un repository :
    * Choisir la méthode POST
    * Entrer l'URL : https://api.github.com/user/repos  
    * Laisser le token en place dans Authorization
    * Dans l'onglet Body, coller le code suviant : 
    ``` json
    {
        "name": "test",
        "description": "Created from the API",
        "homepage": "https://github.com",
        "private": false,
        "has_issues": true,
        "has_projects": true,
        "has_wiki": true
    }
    ```
    * Cliquer sur SEND
    * Normalement vous devriez avoir un code retour ok
    * Vérifier dans le navigateur sur github que le depôt test est bien apparu dans vos dépôts

* En plus de la documentation, l'ensemble des actions possibles et des commandes cURL associées sont disponibles ici : https://www.softwaretestinghelp.com/github-rest-api-tutorial/ 
