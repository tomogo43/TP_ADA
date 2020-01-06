--******************************************************************
--               Paquetages et généricité
--******************************************************************

--******************************************************************
--                          description
--1) Paquetage P_liste
--******************************************************************

--Déclaration des bibliothèques
with text_io;
use text_io;

with ada.integer_text_io;
use ada.integer_text_io;

with ada.float_text_io;
use ada.float_text_io;

PACKAGE BODY p_liste is

    --Fonction qui créée une liste vide
    function creer_liste_vide return T_Liste_Entier is
        --pré-condition: aucune
        --post-condition: retourne une liste 
        
        F_l:T_Liste_Entier;

        begin --debut creer_liste_vide
            F_l:=null;
            return F_l;

    end creer_liste_vide; --fin creer_liste_vide

    --Fonction qui vérifie si une liste est vide
    function est_vide(F_l:T_Liste_Entier) return boolean is
        begin --début est_vide
        if F_l = null then
            return true;
        else
            return false;
        end if;
    end est_vide; --fin est_vide

    --Fonction qui recherche un entier dans la liste T_Liste_Entier
    function rechercher(F_e: in integer;F_l: in out T_Liste_Entier) return T_Liste_Entier is
        adresse:T_Liste_Entier:=null;
        courant:T_Liste_Entier:=F_l;
        begin --début rechercher
        

        if est_vide(F_l)=false then

            loop

                if F_e/= courant.all.element then
                    courant:=courant.all.suivant;
                    adresse:=null;
                    
                else
                    adresse:=courant;
                end if;
            exit when courant=null or adresse/=null;
            end loop;
        end if;
        return adresse;
    end rechercher;

    --procédure qui insère en tête dans une liste
    procedure inserer_en_tete(F_nb:in Integer;F_l:in out T_Liste_Entier) is
        begin --debut inserer_en_tete
        --F_l:=new T_Cellule_Entier'(F_nb,F_l);
            F_l := new T_Cellule_Entier'(F_nb,F_l);

    end inserer_en_tete; --inserer_en_tete

    --procédure qui affiche une liste
    procedure afficher_liste(F_l:in out T_Liste_Entier) is
        courant:T_Liste_Entier;
        begin --début afficher_liste
        courant:=F_l;
        loop
        new_line;
        put(courant.all.element);
        new_line;
        courant:=courant.all.suivant;
        exit when courant=null;
        
        end loop;
    end afficher_liste;

    --procedure qui insere un élément après un autre dans une liste T_Liste_Entier
    procedure inserer_apres(F_nb:in Integer;F_e:in Integer;F_l:in out T_Liste_Entier) is
        courant,q:T_Liste_Entier;
        ELT_EXCEPTION:exception;
        LISTE_VIDE:exception;
        begin --début 
            courant:=F_l;
            if est_vide(F_l) = true then
                raise LISTE_VIDE;
            else
                if rechercher(F_e,F_l) /= null then
                    courant:=rechercher(F_e,F_l);
                    q:= new T_Cellule_Entier;
                    q.all.element:=F_nb;
                    q.all.suivant:=courant.all.suivant;
                    courant.all.suivant:=q;
                else
                    raise ELT_EXCEPTION;
                end if;
            end if;
        exception
            when LISTE_VIDE => put("La liste est vide!");
            when ELT_EXCEPTION => put("Aucun élément dans la liste");
            when others => put("Une autre erreur est survenue");
    end inserer_apres;

    --procedure qui insere un élément avant un autre dans une liste T_Liste_Entier
    procedure inserer_avant(F_nb:in Integer;F_e:in Integer;F_l:in out T_Liste_Entier) is
        courant,q:T_Liste_Entier;
        ELT_EXCEPTION:exception;
        LISTE_VIDE:exception;
        begin --début 
            courant:=F_l;
            if est_vide(F_l) = true then
                raise LISTE_VIDE;
            else
                if rechercher(F_e,F_l) /= null  then
                    courant:=rechercher(F_e,F_l);
                    q:= new T_Cellule_Entier;
                    q.all.element:=courant.all.element;
                    q.all.suivant:=courant.all.suivant;
                    courant.all.element:=F_nb;
                    courant.all.suivant:=q;
                else
                    raise ELT_EXCEPTION;
                end if;
            end if;
        exception
            when LISTE_VIDE => put("La liste est vide!");
            when ELT_EXCEPTION => put("Aucun élément dans la liste");
            when others => put("Une autre erreur est survenue");
    end inserer_avant;

    --procédure qui enlève un élément dans une liste
    procedure enlever(F_e:in Integer;F_l:in out T_Liste_Entier) is
        courant:T_Liste_Entier;
        begin --debut enlever
        courant:=F_l;

        if rechercher(F_e,F_l) /= null then
            loop
            courant:=courant.all.suivant;
            exit when courant.all.suivant.all.element=F_e;
            end loop;
            courant.all.suivant:=courant.all.suivant.all.suivant;
        end if;

        

    end enlever;

end p_liste;