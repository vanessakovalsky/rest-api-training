#!/bin/bash

reponame=git-training

input='Entrer votre choix :'
select option in 1-Branche 2-PR 3-Contributeur
do 
    case $option in
        "1-Branche")
            echo "Affiche les branches"
            curl -X GET -u $USERNAMEGITHUB:$TOKENGITHUB https://api.github.com/repos/$USERNAMEGITHUB/$reponame/branches | grep -w name 
            ;;
        "2-PR")
            echo "Affiche les PR"
            curl -X GET -u $USERNAMEGITHUB:$TOKENGITHUB https://api.github.com/repos/$USERNAMEGITHUB/$reponame/pulls?state=open | grep -w title
            ;;
        "3-Contributeur")
            echo "Affiche les contributeurs"
            curl -X GET -u $USERNAMEGITHUB:$TOKENGITHUB https://api.github.com/repos/$USERNAMEGITHUB/$reponame/collaborators | grep -w login
            ;;
        *) echo "invalid option $REPLY"
            break
            ;;
    esac
done