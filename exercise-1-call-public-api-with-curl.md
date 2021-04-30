# Exercice 1 - Appeler des API avec l'utilitaire curl

## Objectifs
* Etre capable de lire une documentation d'APi
* Savoir appeler une API avec l'utilitaire CURL

## Découvrir comment fonctionne une API

* La première chose à faire lorsque l'on souhaite utiliser une API, c'est de chercher où est la documentation de celle-ci.
* Nous allons utiliser l'API de Github comme exemple et sa documentation se trouve ici : 
https://docs.github.com/en/rest 
* Celle-ci se décompose de la façon suivante (c'est une organisation plutôt standard des documentation d'API):
    * API Overview : contient la documentation par catégorie
    * Référence : contient l'ensemble des méthodes disponibles, avec pour chacune une description, les paramètres attendus et les réponses
    * Guide : contient des tutoriels qui explique comment utiliser l'API pour réaliser différentes opérations

## Appeler une API avec CURL
* Curl est un utilitaire en ligne de commande qui permet d'appeler des API
* Pour l'installer : https://curl.se/download.html 
* Appeler une première API : 
``` bash
curl https://api.github.com/zen 
```
* Le retour est au format json
* Nous pouvons ajouter l'option -i pour voir les headers s'afficher : 
``` bash
curl -i https://api.github.com/users/vanessakovalsky
```

* Nous pouvons donc afficher des informations en provenance de github à partir de cet API avec CURL. Pour la suite, il est nécessaire de se connecter, et donc de passer à l'exercice 2 :) 
