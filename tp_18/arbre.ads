package arbre is
    type T_AB is private;

    --***********************Les fonctions********************************

    --*********************************************************************
    --nom: est_vide
    --sémantique: indique si un arbre est vide
    --paramètres: abr: Mode (IN) T_AB: arbre à tester retourne bool
    --retourne boolean   
    --pré condition: aucune
    --post condition:  retourne true si arbre vide, false si arbre rempli
    --Exception: aucune
    --*********************************************************************
    function est_vide(abr:in T_AB) return boolean;

    --*********************************************************************
    --nom: taille
    --sémantique: donne le nombre d'élément d'un arbre
    --paramètres: abr: Mode (IN) T_AB: arbre à tester retourne entier
    --            
    --pré condition: aucune
    --post condition:  retourne la taille de l'arbre sous la forme d'un entier
    --Exception: aucune
    --*********************************************************************
    function taille(abr:in T_AB;t_abr:in out integer) return integer;

    --*********************************************************************
    --nom: recherche
    --sémantique: recherche une donnée dans l'arbre et retourne true si trouvée
    --paramètres: abr: Mode (IN) T_AB: arbre sur lequel s'applique la recherche
    --            donnee: Mode (IN) integer: donnee à rechercher dans l'arbre         
    --pré condition: aucune
    --post condition:  indique si donnee est dans l'arbre ou non
    --Exception: aucune
    --*********************************************************************
    function recherche(abr:in T_AB;donnee:in integer) return boolean;

    --***********************Les procédures********************************

    --*********************************************************************
    --nom: initialiser
    --sémantique: initialise un arbre
    --paramètres: abr: Mode (OUT) T_AB: renvoit un arbre
    --            
    --pré condition: aucune
    --post condition:  abr est vide
    --Exception: aucune
    --*********************************************************************
    procedure initialiser(abr:out T_AB);

    --*********************************************************************
    --nom: insérer
    --sémantique: insérer une donnée dans l'arbre en respectant les contraintes
    --paramètres: abr: Mode (IN/OUT) T_AB: arbre où la valeur doit être insérée
    --            donnee: Mode (IN) integer: donnée à insérer 
    --            
    --pré condition: aucune
    --post condition: donnee est insérer dans abr
    --Exception: aucune
    --*********************************************************************
    procedure inserer(abr:in out T_AB; donnee: in integer);

    --*********************************************************************
    --nom: afficher
    --sémantique: affiche les différents niveaux de l'arbre
    --paramètres: abr: Mode (IN) T_AB: arbre à afficher
    --            
    --pré condition: aucune
    --post condition: affiche les différents niveaux de l'arbre
    --Exception: aucune
    --*********************************************************************
    procedure afficher(abr:in T_AB;niveau:in out integer);

    --*********************************************************************
    --nom: supprimer
    --sémantique: supprime une donnée de l'arbre 
    --paramètres: abr: Mode (IN/OUT) T_AB: arbre où la donnée est à supprimer
    --            donnee : Mode(IN) integer: donnee à supprimer
    --pré condition: aucune
    --post condition: supprime la sonnée dans abr si existe 
    --Exception: aucune
    --*********************************************************************
    procedure supprimer(abr:in out T_AB;donnee:in integer);

    private
        type T_noeud;
        type T_AB is access T_noeud;
        type T_noeud is
            record
                donnee:integer;
                sous_arbre_gauche:T_AB;
                sous_arbre_droit:T_AB;
            end record;

end arbre;