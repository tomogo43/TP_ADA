--TP1 Programmation impérative:Premiers programmes en ADA
--1) Python et ADA

--Spécification
--R0[Afficher la somme des entiers compris entre deux entiers naturels]
--R1:Comment R0

--Chargement des bibliothèques
with text_io;
use text_io;

with ada.integer_text_io;
use ada.integer_text_io;

with ada.float_text_io;
use ada.float_text_io;

procedure Somme_Entier is
    n:Integer; --Borne inférieure de l'intervalle
    m:Integer; --Borne supérieure de l'intervalle
    S:Integer; --Somme des entiers compris entre n et m
    i:Integer; --Variable de incrémentation
    begin
        --R1-1:Saisir deux entiers naturels m et n,tel que m>=n>=0
        loop
            put("Saisir un entier n supérieur ou égal a 0");
            Get(n);
        exit when n>=0;
        end loop;
        loop
            put("Saisir un entier m superieur ou egale a n");
            Get(m);
        exit when m>=n;
        end loop;
        --R1-2:Faire la somme des entiers compris entre m et n
            --R2:Comment faire R1-2
            S:=0;
            for i in n..m loop
                S:=S+i;
            end loop;
        --R1-3:Afficher la somme à l'utilisateur
        put("La somme des entiers compris entre ");
        put(n);
        put(" et ");
        put(m);
        put(" est ");
        put(S);    
end Somme_Entier;