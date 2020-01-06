--******************************************************************
--               Structure de données et paquetages
--******************************************************************

--******************************************************************
--                          description
-- Liste doublement chainée triée
--******************************************************************

--Déclaration des bibliothèques

with text_io;
use text_io;

with ada.integer_text_io;
use ada.integer_text_io;

with ada.float_text_io;
use ada.float_text_io;

package body liste_double is

    --******************Fonctions******************
    function creer_liste_vide return T_Liste_Double is
        liste:T_Liste_Double;
        begin
        liste:=null;
        return liste;

    end creer_liste_vide;

    --******************Procedures******************

    procedure insere_element(F_e:in Integer;F_l: in out T_Liste_Double) is
        courant:T_Liste_Double;
        begin
        courant:=F_l;
        if courant /= null then
            --va à la fin de la liste
            loop
            if courant.all.suivant /= null then
                courant:=courant.all.suivant;
            end if;
            exit when courant.all.suivant = null ;
            end loop;
            courant.all.suivant:=new T_Cellule_Double'(courant,F_e,null);
        else
            F_l:=new T_Cellule_Double'(F_l,F_e,F_l);
        end if;
        
    end insere_element;
    
    procedure affichage(F_l:in out T_Liste_Double) is
        courant:T_Liste_Double;
        begin
        courant:=F_l;
        
        loop
        new_line;
        put(courant.all.element);
        if courant.all.suivant /= null then
            courant.all.suivant.all.precedent:=courant;
        end if;
        
        courant:= courant.all.suivant;
        exit when courant = null;
        end loop;
    end affichage;
end liste_double; --fin du programme