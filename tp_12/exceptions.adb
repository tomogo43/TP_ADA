--******************************************************************
--                  sous programmes et exceptions
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


procedure exceptions is 
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

    --****Fonctions****

    --fonction qui créé un ensemble vide
    function creer return ensemble is
        --pre condition: NMAX > 1
        --post condition: retourne ensemble vide

        e:ensemble;

        begin --debut creer

        e.cardinal:=0; --cardinal vaut 0
        
        --aucune exception à gérer

        return e;

    end creer;

    --fonction qui vérifie la présence d'un élement dans l'ensemble
    function appartient(x:in Integer;e:in out ensemble) return boolean is
        --pre condition: e un ensemble, x integer
        --post condition: renvoit true si élement présent dans l'ensemble et false sinon

        retour:boolean:=false;
        begin --début appartient
        for i in 1..e.cardinal loop
            if x = e.contenu(i) then
                retour:=true;               
            end if;
        end loop;

        return retour;

    end appartient; --fin appartient

    --****Procédures****

    --procedure qui ajoute un élément dans l'ensemble
    procedure ajouter(e:in out ensemble;x:Integer) is
        --pre condition :
        --post condition:

        --exception pour indiquer que l'élement est présent
        ELT_PRESENT:exception;
        
        begin --début ajouter

        if appartient(x,e) = false then
            e.cardinal:=e.cardinal+1;
            e.contenu(e.cardinal):=x;
        else
            raise ELT_PRESENT;
        end if;
        new_line;

        

        --gestion des exceptions
        --  *ensemble plein
        --  *element_present
        exception
            when ELT_PRESENT        => put_line("element déjà présent");
            when CONSTRAINT_ERROR   => put_line("erreur d'indice sur la procédure supprimer");
            when others             => put_line("Une autre erreur sur la procédure supprimer");


    end ajouter; --fin ajouter

    --procedure qui supprime un élement de l'ensemble
    procedure supprimer(x:Integer;e:in out ensemble) is
        --pre condition:
        --post condition:
        j:integer;
        ELT_ABS:exception; --exception pour indiquer que l'élément est absent
        begin --debut supprimer
        put("supprimer");

        if appartient(x,e) = true then
            --si élement appartient à l'ensemble on peut le supprimer
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
        else
            raise ELT_ABS; --lève l'exception ELT_ABS
        end if;

        

        --gestion des exceptions
        --  *ensemble_vide
        --  *element_absent
        exception
            when ELT_ABS            => put_line("élément ne peut être supprimé car inexistant");
            when CONSTRAINT_ERROR   => put_line("erreur d'indice sur la procédure supprimer");
            when others             => put_line("Une autre erreur sur la procédure supprimer");

    end supprimer; --fin supprimer


    --procedure qui affiche le contenu de l'ensemble
    procedure afficher(e:ensemble) is 
        i:Integer;

        begin --debut afficher
        for i in 1 .. e.cardinal loop
            put(e.contenu(i));
        end loop;

        --aucune exception à gérer

    end afficher; --fin afficher


    

    begin --debut du programme

    put("exceptions");

    --matrice de test
    e:=creer;
    ajouter(e,1);
    ajouter(e,2);
    ajouter(e,3);
    ajouter(e,4);
    ajouter(e,5);
    ajouter(e,4);
    afficher(e);    
    supprimer(12,e);


    put_line("fin du programme");
end exceptions; --fin du programme