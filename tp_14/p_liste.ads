PACKAGE p_liste is

    --*****************Definition des types***********************************

    type T_Cellule_Entier; --annoncer la référence avant

    type T_Liste_Entier is access T_Cellule_Entier; --type pointeur sur un type T_Cellule_ENtier

    type T_Cellule_Entier is
        record
            element:Integer;            --Elément rangé dans la cellule
            suivant:T_Liste_Entier;     --Accès à la cellule suivante
        end record;

    

    --***********************Les fonctions********************************

    --*********************************************************************
    --nom: creer_liste_vide
    --sémantique: creer une liste vide de type T_Liste_Entier
    --paramètres: aucun
    --pré condition: aucune
    --post condition:  La liste est vide
    --Exception: aucune
    --*********************************************************************
    function creer_liste_vide return T_Liste_Entier;

    --*********************************************************************
    --nom: est_vide
    --sémantique: renseigne si une liste est vide 
    --paramètres: F_l: Mode (IN) T_Liste_Entier
    --pré condition: aucune
    --post condition:  renvoit true si liste vide ou false sinon
    --Exception: aucune
    --*********************************************************************
    function est_vide(F_l: in T_Liste_Entier) return boolean;

    --*********************************************************************
    --nom: rechercher
    --sémantique: recherche si e est présent dans la liste,retourne 
    --            son adresse ou null si liste vide ou e n'appartenant
    --            pas à la liste
    --paramètres:
    --      F_e: Mode (IN) Integer; entier à rechercher
    --      F_l: Mode(IN) T_Liste_Entier; liste linéaire
    --pré condition: aucune
    --post condition: 
    --Exception: aucune
    --*********************************************************************
    function rechercher(F_e: in integer;F_l: in out T_Liste_Entier) return T_Liste_Entier;

    --************************Procédures***********************************

    --*********************************************************************
    --nom: inserer_en_tete
    --sémantique: Insère un entier en tête 
    --paramètres: F_nb: mode(IN) Entier;F_l: Mode (IN/OUT) T_Liste_Entier
    --pré condition: aucune
    --post condition:  F_nb est en tête de liste
    --Exception: aucune
    --*********************************************************************
    procedure inserer_en_tete(F_nb:in Integer;F_l:in out T_Liste_Entier);

     --*********************************************************************
    --nom: afficher_liste
    --sémantique: affiche une liste linéaire
    --paramètres:
    --      F_l: Mode(IN/OUT) T_Liste_Entier; liste linéaire simple 
    --pré condition: aucune
    --post condition: aucune
    --Exception: aucune
    --*********************************************************************
    procedure afficher_liste(F_l:in out T_Liste_Entier);

    --*********************************************************************
    --nom: inserer_apres
    --sémantique: Insère un élément dans une liste après un autre
    --paramètres:
    --      F_nb: Mode(IN) Integer; élément à ajouter
    --      F_e: Mode(IN) Integer; élément de la liste        
    --      F_l: Mode(IN/OUT) T_Liste_Entier; liste linéaire simple 
    --pré condition: aucune
    --post condition: F_nb est placé après F_e dans la liste
    --Exception: la liste n'est pas vide / F_e n'est pas dans la liste
    --*********************************************************************
    procedure inserer_apres(F_nb:in Integer;F_e:in Integer;F_l:in out T_Liste_Entier);

    --*********************************************************************
    --nom: inserer_avant
    --sémantique: Insère un élément dans une liste avant un autre
    --paramètres:
    --      F_nb: Mode(IN) Integer; élément à ajouter
    --      F_e: Mode(IN) Integer; élément de la liste        
    --      F_l: Mode(IN/OUT) T_Liste_Entier; liste linéaire simple 
    --pré condition: aucune
    --post condition: F_nb est placé après F_e dans la liste
    --Exception: la liste n'est pas vide / F_e n'est pas dans la liste
    --*********************************************************************
    procedure inserer_avant(F_nb:in Integer;F_e:in Integer;F_l:in out T_Liste_Entier);

    --*********************************************************************
    --nom: enlever
    --sémantique: enlève un élément dans une liste
    --paramètres:
    --      F_e: Mode(IN) Integer; élément de la liste        
    --      F_l: Mode(IN/OUT) T_Liste_Entier; liste linéaire simple 
    --pré condition: aucune
    --post condition: F_e est enlevé de la liste
    --Exception: aucune
    --*********************************************************************
    procedure enlever(F_e:in Integer;F_l:in out T_Liste_Entier);   

end p_liste;