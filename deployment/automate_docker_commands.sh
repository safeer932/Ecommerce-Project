#!/bin/bash

# Étape 1 : Vérifier les images docker disponibles
echo "Liste des images disponibles :"
docker images | grep -E "safeer932/frontend.*latest|frontend.*latest"

# Étape 2 : Supprimer les images spécifiques si elles existent
if docker images | grep -q "safeer932/frontend.*latest"; then
    echo "Suppression de l'image safeer932/frontend:latest localement."
    docker rmi -f safeer932/frontend:latest
else
    echo "L'image safeer932/frontend:latest n'existe pas localement."
fi

if docker images | grep -q "frontend.*latest"; then
    echo "Suppression de l'image frontend:latest localement."
    docker rmi -f frontend:latest
else
    echo "L'image frontend:latest n'existe pas localement."
fi


echo "Script terminé."
