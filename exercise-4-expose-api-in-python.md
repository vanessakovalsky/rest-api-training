# Exercice 4 - Exposer une API avec Flask en Python

## Objectifs : 
* Etre capable de proposer une API en Python
* Pouvoir utiliser un micro-framework comme point de départ rapide pour créer une API

## Pré-requis
* Avoir un environnement de travail avec Python 3 installer
* Avoir un éditeur de code, type Visual Studio Code ou un autre paramètrer pour développer en Python

## Installer Flask
* Installer le micro framework Flask avec Pip : 
```
pip install flask
```
* Vérifier l'installation avec la commande : 
```
flask --version
```
* Vous devriez obtenir un numéro de version, en cas d'erreur regarder dans la documentation de flask : https://flask.palletsprojects.com/en/1.1.x/ 

## Configurer l'application Flask et la tester
* Maintenant que Flask est installer, nous pouvons l'utiliser.
* Créer un fichier main.py avec le contevnu suivant : 
``` python
# Import the Flask module that has been installed.
from flask import Flask

# Creating a new "app" by using the Flask constructor. Passes __name__ as a parameter.
app = Flask(__name__)

# Annotation that allows the function to be hit at the specific URL.
@app.route("/")
# Generic Python functino that returns "Hello world!"
def index():
    return "Hello world!"

# Checks to see if the name of the package is the run as the main package.
if __name__ == "__main__":
    # Runs the Flask application only if the main.py file is being run.
    app.run()
```
* Il ne reste plus qu'à lancer l'application : 
```
python main.py
```
* Vous obtenez alors un message vous indiquant que le serveur fonctionne et qu'il est accessible sur http://127.0.0.1:5000 
* Tester cette url dans un navigateur
* Tester là avec curl : 
```
curl http://localhost:5000/
```
* Dans les deux cas vous devriez voir le message qui se trouve dans la fonction index de votre script main.py

## Créer les endpoints de l'API Rest 
* Nous allons rajouter une liste de jeux en json dans le fichier.
* Pour cela on demande à Flask, son composant jsonify qui permet de lire et écrire du JSON
* Puis on déclare une variable qui contient notre JSON exemple
``` python
#main.py

# Import the Flask module that has been installed.
from flask import Flask, jsonify

# Createing a "games" JSON / dict to emulate data coming from a database.
games = [
  {
    "id": 0,
    "name": "Scrabble",
    "editor": "mattel",
    "year_published": "1978",
    "description": "descp",
    "category": "family",
    "time": "60min",
    "number_player": "2-5"
  },
  {
    "id": 1,
    "name": "Aventuriers du rail",
    "editor": "asmodee",
    "year_published": "2006",
    "description": "descp",
    "category": "family",
    "time": "45min",
    "number_player": "2-5"
  }
]

# Creating a new "app" by using the Flask constructor. Passes __name__ as a parameter.
app = Flask(__name__)

# Annotation that allows the function to be hit at the specific URL.
@app.route("/")
# Generic Python function that returns "Hello world!"
def index():
    return "Hello world!"

# Annotation that allows the function to be hit at the specific URL. Indicates a GET HTTP method.
@app.route("/bordgames/v1.0/games", methods=["GET"])
# Function that will run when the endpoint is hit.
def get_games():
    # Returns a JSON of the games defined above. jsonify is a Flask function that serializes the object for us.
    return jsonify({"games": games})

# Checks to see if the name of the package is the run as the main package.
if __name__ == "__main__":
    # Runs the Flask application only if the main.py file is being run.
    app.run()
``` 
* Cette ligne ``` @app.route("/bordgames/v1.0/games", methods=["GET"]) ``` nous permet de déclarer une nouvelle route qui répond sur la méthode GET à la route décrite
* La méthode get_games juste en dessous, est celle qui est appelé lorsque la route définit est demandée
* Pour tester on utilise curl : 
```
curl http://localhost:5000/bordgames/v1.0/games
```
* Définissons maintenant la méthode pour afficher un jeu avec son id : 
``` python
# Annotation that allows the function to be hit at the specific URL with a parameter. Indicates a GET HTTP method.
@app.route("/bordgames/v1.0/games/<int:game_id>", methods=["GET"])
# This function requires a parameter from the URL.
def get_game(game_id):
    # Create an empty dictionary.
    result = {}

    # Loops through all the different games to find the one with the id that was entered.
    for game in games:
        # Checks if the id is the same as the parameter.
        if game["id"] == game_id:
            # Sets the result to the game and makes it a JSON.
            result = jsonify({"game": game})

    # Returns the game in JSON form or an empty dictionary. Should handle the error like 404, but will not cover here.
    return result
```
* Dans la route on ajoute un paramètre entre < > en précisant son type (ici int) et son nom
* Dans la fonction, on récupère le paramètre saisi en argument de la fonction, en utilisant le même nom que celui définit dans la route
* Ajouter les autres routes et fonctions pour les endpoints des jeux

## Pour aller plus loin 
* Définir les endpoints des utilisateurs et des photos
* Lire / écrire dans des fichiers JSON les données de manière dynamique