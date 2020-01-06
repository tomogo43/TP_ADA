--******************************************************************
--                  sous programmes et enregistrements
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


procedure sousprogrammes is 
    --****Déclarations****
    NMAX:constant Integer:= 50; 
    type elements is 
        array(1 .. NMAX) of Integer;
    
    type ensemble is 
        record
            contenu:elements; --les éléments de l'ensemble
            cardinal:integer; --le nombre d'éléments de l'enseble
        end record;

    e:ensemble;

    --****Procedures****

    --procedure qui ajoute un élément dans l'ensemble
    procedure ajouter(e:in out ensemble;x:Integer) is
        --pre condition :
        --post condition:
        
        begin --début ajouter
        put("ajouter");
        e.cardinal:=e.cardinal+1;
        e.contenu(e.cardinal):=x;

    end ajouter; --fin ajouter

    --procedure qui supprime un élement de l'ensemble
    procedure supprimer(x:Integer;e:in out ensemble) is
        --pre condition:
        --post condition:
        j:integer;
        begin --debut supprimer
        put("supprimer");
        for i in 1 .. e.cardinal loop
            if e.contenu(i) = x then
                j:=i+1;
                loop
                e.contenu(i):=e.contenu(j);
                j:=j+1;
                exit when j> e.cardinal;
                end loop;
                e.cardinal:=e.cardinal-1;
            end if;
        end loop;
    end supprimer; --fin supprimer


    --procedure qui affiche le contenu de l'ensemble
    procedure afficher(e:ensemble) is 
        i:Integer;

        begin --debut afficher
        for i in 1 .. e.cardinal loop
            put(e.contenu(i));
        end loop;
    end afficher; --fin afficher


    --****Fonctions****

    --fonction qui créé un ensemble vide
    function creer return ensemble is
        --pre condition: NMAX > 1
        --post condition: retourne ensemble vide

        e:ensemble;

        begin --debut creer

        e.cardinal:=0; --cardinal vaut 0

        return e;

    end creer;

    --fonction qui vérifie la présence d'un élément dans l'enseble
    function appartient(x:Integer;e:ensemble) return boolean is
        --pre condition: 
        --post condition:
        present:boolean;
        begin --debut appartient
        for i in 1 .. e.cardinal loop
            if e.contenu(i) = x then
                present := true;
            end if;
        end loop;
        return present;
    end appartient; --fin appartient


    begin --debut du programme



    e:=creer;
    ajouter(e,1);
    ajouter(e,2);
    ajouter(e,3);
    ajouter(e,4);
    ajouter(e,5);
    afficher(e);
    supprimer(4,e);
    afficher(e);
    if appartient(9,e) then
        put("ok");
    else 
        put("non");
    end if;
end sousprogrammes; --fin du programme
