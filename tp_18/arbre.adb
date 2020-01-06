--******************************************************************
--                   arbre binaire et recherche
--******************************************************************

--******************************************************************
--                          description
--******************************************************************

--Déclaration des bibliothèques
with text_io;
use text_io;

with ada.integer_text_io;
use ada.integer_text_io;

with ada.float_text_io;
use ada.float_text_io;

PACKAGE BODY arbre is

    --******************fonctions***************************
    function est_vide(abr:in T_AB) return boolean is 
        begin
        if abr = null then
            return true;
        else
            return false;
        end if;
    end est_vide;

    function taille(abr:in T_AB) return integer is
        t_abr:integer:=2; --taille de l'arbre
        courant:T_AB;
        gauche:T_AB;
        droite:T_AB;
        begin
        if abr /= null then
            t_abr := t_abr + 1;
            if abr.all.sous_arbre_gauche /= null then
            put("gauche");
                t_abr:=taille(abr.all.sous_arbre_gauche);
            elsif abr.all.sous_arbre_droit /= null then
            put("droit");
                t_abr:=taille(abr.all.sous_arbre_droit);
            end if;
        end if;
        
        return t_abr;
    
        
    end taille;

    --*******************procedures*************************

    procedure initialiser(abr:out T_AB) is
        begin
        abr:=null;
    end initialiser;

    procedure inserer(abr:in out T_AB; donnee: in integer) is
        begin
        if abr = null then
            abr:= new T_noeud'(donnee,abr,abr);
        else
            if donnee > abr.all.donnee and abr.all.sous_arbre_droit = null then
                abr.all.sous_arbre_droit:=new T_noeud'(donnee,null,null);
            else
                inserer(abr.all.sous_arbre_droit,donnee);
            end if;

            if donnee < abr.all.donnee and abr.all.sous_arbre_gauche = null then
                abr.all.sous_arbre_gauche:=new T_noeud'(donnee,null,null);
            else
                inserer(abr.all.sous_arbre_gauche,donnee);
            end if;

        end if;
    end inserer;
end arbre;
