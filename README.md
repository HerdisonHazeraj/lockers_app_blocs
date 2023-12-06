# Application de gestion des casiers

Version 0.10.23

## Historique

04.10.2023 : Livraison de la première version de l'application (0.10.23)

28.11.2023 : Utilisation de "Bloc" et de repository dans l'application (0.11.23)
    - ./ : Création d'un nouveau projet en repartant de zéro

29.11.2023 : Mise en place de l'authentification (0.11.23) : 
    - ./packages : Création de tous les repository utilisables dans l'application
        - ./packages/user_repository : Système d'authentification fonctionnel !
    - ./lib : Création des "Bloc" ainsi que l'affichage 
        - ./lib/screens : Suppression de toutes les pages pour les recréer petit à petit
            - ./lib/authentification : Affichage de l'authentification fonctionnel !
            - ./lib/dashboard : Affichage fonctionnel mais les données sont brutes pour l'instant
        - ./lib/blocs : Création des "Bloc" dont nous avons besoin pour gérer les états
            - ./lib/blocs/user : Gestion de l'authentification fonctionnel !

30.11.2023 : 
