--******************************************************************
--               Pointeurs et structures de données
--******************************************************************

--******************************************************************
--                          description
--1) La liste chainée
--******************************************************************

--Déclaration des bibliothèques
with text_io;
use text_io;

with ada.integer_text_io;
use ada.integer_text_io;

with ada.float_text_io;
use ada.float_text_io;

procedure liste_chainee is
    --****declarations****
    type T_Cellule_Entier; --annoncer la référence avant

    type T_Liste_Entier is access T_Cellule_Entier; --type pointeur sur un type T_Cellule_ENtier

    type T_Cellule_Entier is
        record
            element:Integer;            --Elément rangé dans la cellule
            suivant:T_Liste_Entier;     --Accès à la cellule suivante
        end record;

    liste:T_Liste_Entier; --déclaration d'une liste
    
    --****fonctions****

    --Fonction qui créée une liste vide
    function creer_liste_vide return T_Liste_Entier is
        --pré-condition: aucune
        --post-condition: retourne une liste 
        
        F_l:T_Liste_Entier;

        begin --debut creer_liste_vide
            put("creer liste vide");
            F_l:=null;
            return F_l;

    end creer_liste_vide; --fin creer_liste_vide

    --Fonction qui vérifie que la liste est vide
    function est_vide(F_l:T_Liste_Entier) return boolean is
        begin --début est_vide
        if F_l = null then
            return true;
        else
            return false;
        end if;
    end est_vide; --fin est_vide

    --Fonction rechercher

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
    function rechercher(F_e: in integer;F_l: in out T_Liste_Entier) return T_Liste_Entier is
        adresse:T_Liste_Entier:=null;
        begin --début rechercher
        

        if est_vide(F_l)=false then

            loop

                if F_e/= F_l.all.element then
                    F_l:=F_l.all.suivant;
                else
                    adresse:=F_l;
                end if;
            exit when F_l.all.suivant=null or adresse/=null;
            end loop;
        end if;
        return adresse;
    end rechercher;


    --****procédures****

    --procédure qui insère en tete

    --*********************************************************************
    --nom: inserer_en_tete
    --sémantique: ajouter un entier en début d'une liste linéaire simple
    --paramètres:
    --      F_nb: Mode (IN) Integer; entier à ajouter en début de liste
    --      F_l: Mode(IN/OUT) T_Liste_Entier; liste linéaire simple où est
    --      ajouté l'entier F_nb
    --pré condition: aucune
    --post condition: F_l.element=F_nb et F_l.suivant=F_l'avant
    --Exception: aucune
    --*********************************************************************
    procedure inserer_en_tete(F_nb:in Integer;F_l:in out T_Liste_Entier) is
        begin --debut inserer_en_tete
        --F_l:=new T_Cellule_Entier'(F_nb,F_l);
            F_l := new T_Cellule_Entier'(F_nb,F_l);

    end inserer_en_tete; --inserer_en_tete


     --procédure qui affiche liste linéaire

    --*********************************************************************
    --nom: afficher_liste
    --sémantique: affiche une liste linéaire
    --paramètres:
    --      F_l: Mode(IN/OUT) T_Liste_Entier; liste linéaire simple 
    --pré condition: aucune
    --post condition: aucune
    --Exception: aucune
    --*********************************************************************
    procedure afficher_liste(F_l:in out T_Liste_Entier) is
        begin --début afficher_liste

        loop
        new_line;
        put(F_l.all.element);
        new_line;
        

        exit when F_l.all.suivant=null;
        F_l:=F_l.all.suivant;
        end loop;
    end afficher_liste;

    --*********************************************************************
    --nom: inserer_apres
    --sémantique: insére un élément après un autre dans une liste
    --paramètres:
    --      F_e: Mode(IN) Interger; élément à ajouter dans la liste
    --      F_a: Mode(IN) Integer; élément avant
    --      F_l: Mode(IN/OUT) T_Liste_Entier; liste linéaire simple 
    --pré condition: aucune
    --post condition: F_e est placé dans la liste après F_a
    --Exception: F_a n'est pas dans la liste la liste est vide
    --*********************************************************************  
    procedure inserer_apres(
        F_e:in Integer;
        F_a:in Integer;
        F_l:in out T_Liste_Entier) is 

        ELT_EXCEPTION:exception;
        LISTE_VIDE:exception;

        L_ap:T_Liste_Entier;
        courant:T_Liste_Entier;

        begin --début insérer après

        L_ap:=new T_Cellule_Entier;

        --vérifie si la liste n'est pas vide
        if est_vide(F_l) = true then
            raise LISTE_VIDE;
        else
            courant:=F_l;
        end if;

        --vérifie si l'élément d'ince est présent dans la liste

        if rechercher(F_a,courant) /= null then
            courant:=rechercher(F_a,courant);
            L_ap.all.element:=F_e;
            L_ap.all.suivant:=courant.all.suivant;
            courant.all.suivant:=L_ap;

        else
            new_line;
            put("rien");
        end if;
        

        



        exception 
            when ELT_EXCEPTION   => put_line("Aucun élément dans la liste");
            when LISTE_VIDE      => put_line("Liste vide");
            when others          => put_line("erreur autre");

    end inserer_apres; --fin insérer après 

    begin --debut du programme
    put("liste chainee");
    liste:=creer_liste_vide;
    inserer_en_tete(2,liste);

    afficher_liste(liste);
    inserer_apres(5,2,liste);
    inserer_apres(10,5,liste);
    inserer_apres(14,10,liste);
    afficher_liste(liste);

   
end liste_chainee; --fin du programme