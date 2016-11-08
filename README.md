# JDL 2016

Ce dépôt contient les scripts de déploiement pour Linux Mint 18.

Ces trois scripts sont à copier à la racine de votre clé USB.

Pour les exécuter, ouvrir un terminal à la racine de la clé, et lancer `bash nom_du_script.sh`

Pas besoin de changer les droits sur les scripts ;)

**IMPORTANT**

**Les scripts sont à lancer dans l'ordre suivant :**

## Etape 1
### Script reparer_reseau.sh
Exécuter le script puis **mettre à jour le système d'exploitation.**

Permet de corriger le bug de gestion des cartes Ethernet par NetworkManager sous Linux Mint 18.

Merci systemd :-(

## Etape 2
### Script deploy_firefox.sh
Permet de déployer le profil modifié de Firefox depuis le serveur PXE, sur les postes des visiteurs.

Note : Il faut renseigner plusieurs fois le mot de passe de l'utilisateur, ce qui est normal.

## Etape 3
### Script deploy_applications.sh
Permet de déployer les applications supplémentaires sur les postes des visiteurs.

Note : Il est conseillé de redémarrer pour terminer la configuration de l'outil `clipit` .
