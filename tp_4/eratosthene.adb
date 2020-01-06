--******************************************************************
--                  Crible d'Eratosthène
--******************************************************************

--******************************************************************
--                          description
--Demande à l'utilisateur de saisir un entier N >= 2 et affiche
--en utilisant la méthode du crible d'Eratosthène les nombres 
--premiers compris entre 2 et N
--******************************************************************

--R0[Afficher les nombres premiers compris entre 2 et N]
--Test:
--  N=10 --> 2/3/5/7

--Chargement des bibliothèques
with text_io;
use text_io;

with ada.integer_text_io;
use ada.integer_text_io;

with ada.float_text_io;
use ada.float_text_io;

--R1:Comment R0
--  (1)Saisir un entier N>=2 out
--  (2)Déterminer les nombres premiers compris entre 2 et N par la méthode du crible d'Eratosthène

procedure eratosthene is
    --****Declarations****

    --Variables
    N:Integer;
    --variable d'incrémentation
    i:Integer; 
    j:Integer;
    
    --Enregistrements
    type caseTab is
        record
        valeur:Integer;
        isPremier:Integer;
    end record;

    --Tableaux
    type myArray is
        array(Integer range<>) of caseTab;

    begin --Debut du programme

    --R2:Comment R1-1
    loop
    put("Saisir un entier N >=2");
    New_line;
    get(N);
    exit when N>=2;
    end loop;

    --R2:Comment R1-2
        --R3:Initialiser un tableau contenant tous les entiers compris entre 2 et N associé à un état

        declare --partie déclarative dans le programme principale
        D:myArray(1 .. N-1);

        begin --ouverture du begin

        for i in 1..N-1 loop
            D(i):=(i+1,1); --on associe pour chaque ligne du tableau un entier compris entre 2 et N
                           --avec un état susceptible d'être premier
        end loop;

        --R3:Rechercher les entiers de la table qui sont multiples d'un entier compris entre 2 et N
        for i in 2 .. N loop 
        --première boucle pour tester si un élément du tableau est multiple de l'entier i
            --R4:Enlever les élements du tableau qui sont multiples de i entre 3 et N
            for j in i+1 .. N-1 loop
                if (D(j).valeur mod i) = 0 then
                    D(j).isPremier := 0;
                end if;
            end loop;
        end loop;

        --R3:Afficher les nombres premiers compris entre 2 et N
        for i in 1 .. N-1 loop
            if D(i).isPremier=1 then
                put(D(i).valeur);
                New_line;
            end if;
        end loop;
        end;

end eratosthene; --Fin du programme