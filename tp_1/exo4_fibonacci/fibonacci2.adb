--TP1 Programmation impérative:Premiers programmes en ADA
--1) Suite de Fibonacci

--Spécification
--R0[Afficher le premier terme de la suite de Fibonacci supérieur à M tq M>1]
--R1:Comment R0

--Chargement des bibliothèques
with text_io;
use text_io;

with ada.integer_text_io;
use ada.integer_text_io;

with ada.float_text_io;
use ada.float_text_io;

procedure Fibonacci2 is
    n:Integer:=2; --Compteur pour déterminer le terme initialiser à 2 car la suite 0 1 1 2 3 le terme 3 est le 1er sup à 1
    fib:Integer:=0; --Contient les termes de la suite de Fibonacci
    fib0:Integer:=0; --terme 0 de la suite ou fib(n-2)
    fib1:Integer:=1; --terme 1 de la suite ou fib(n-1)
    M:Integer:=0; --Valeur saisie par l'utilisateur
    begin
    --R1-1 Saisir M entier relatif >1
    loop
        put("Saisir M entier relatif > 1");
        Get(M);
    exit when M>1;
    end loop;
    --R1-2 Déterminer le 1er terme de la suite de Fibonacci supérieur à M
        --R2 comment R1-2
        loop
            fib:=fib1+fib0; --Calcul le ieme terme de la suite
            fib0:=fib1;
            fib1:=fib;
            n:=n+1; --incrémente le numéro du terme
        exit when fib>M;
        end loop;
    --R1-3 Afficher le premier terme de la suite de Fibonacci supérieur à M
    put("Le terme ");
    put(n);
    put(" de valeur ");
    put(fib);
    put(" est le premier terme supérieur à ");
    put(M);
end Fibonacci2;