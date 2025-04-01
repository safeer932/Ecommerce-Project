#!/bin/bash

# Supprime tous les services sauf ceux qui sont par défaut Kubernetes
default_services=("kubernetes" "kube-dns")
services_to_delete=$(kubectl get services --no-headers | awk '{print $1}' | grep -v -E "$(IFS="|"; echo "${default_services[*]}")")

# Boucle pour supprimer chaque service
for service in $services_to_delete; do
    echo "Suppression du service : $service"
    kubectl delete service $service
done

# Supprime tous les déploiements
deployments_to_delete=$(kubectl get deployments --no-headers | awk '{print $1}')

# Boucle pour supprimer chaque déploiement
for deployment in $deployments_to_delete; do
    echo "Suppression du déploiement : $deployment"
    kubectl delete deployment $deployment
done

# Supprime tous les PersistentVolumeClaims (PVCs)
pvcs_to_delete=$(kubectl get pvc --no-headers | awk '{print $1}')

# Boucle pour supprimer chaque PVC
for pvc in $pvcs_to_delete; do
    echo "Suppression du PVC : $pvc"
    kubectl delete pvc $pvc
done

# Supprime tous les PersistentVolumes (PVs)
pvs_to_delete=$(kubectl get pv --no-headers | awk '{print $1}')

# Boucle pour supprimer chaque PV
for pv in $pvs_to_delete; do
    echo "Suppression du PV : $pv"
    kubectl delete pv $pv
done

# Supprime tous les ConfigMaps sauf ceux qui sont par défaut Kubernetes
default_configmaps=("kube-root-ca.crt" "kube-proxy")
configmaps_to_delete=$(kubectl get configmaps --no-headers | awk '{print $1}' | grep -v -E "$(IFS="|"; echo "${default_configmaps[*]}")")

# Boucle pour supprimer chaque ConfigMap
for configmap in $configmaps_to_delete; do
    echo "Suppression du ConfigMap : $configmap"
    kubectl delete configmap $configmap
done

# Supprime tous les Ingresses sauf ceux qui sont par défaut Kubernetes
default_ingresses=("kube-system")
ingresses_to_delete=$(kubectl get ing --no-headers | awk '{print $1}' | grep -v -E "$(IFS="|"; echo "${default_ingresses[*]}")")

# Boucle pour supprimer chaque Ingress
for ingress in $ingresses_to_delete; do
    echo "Suppression de l'Ingress : $ingress"
    kubectl delete ingress $ingress
done

kubectl delete secret mailer-secret



echo "Attente de 12 secondes..."
sleep 6

echo "Vérification si tout a été supprimé :"
kubectl get services
kubectl get deployments
kubectl get pods
kubectl get pvc
kubectl get pv
kubectl get configmaps
kubectl get ing

