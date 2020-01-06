--TP1 Programmation impérative:Premiers programmes en ADA
--1) Suite de Fibonacci

--Spécification
--R0[Afficher le nième terme de la suite de Fibonacci]
--R1:Comment R0

--Chargement des bibliothèques
with text_io;
use text_io;

with ada.integer_text_io;
use ada.integer_text_io;

with ada.float_text_io;
use ada.float_text_io;

procedure Fibonacci is
    n:Integer; --Choix du terme de la suite
    fib:Integer:=0; --nième terme de la suite
    fib0:Integer:=0; --terme 0 de la suite ou fib(n-2)
    fib1:Integer:=1; --terme 1 de la suite ou fib(n-1)
    i:Integer;
    begin
        --R1-1:Saisir le terme n à afficher sup ou égal à 0
        n:=-1;
        loop
            put("Saisir un entier n supérieur ou égal a 0");
            Get(n);
        exit when n>=0;
        end loop;
            --R2 Comment déterminer le nième terme
            if n=0 then
                fib:=fib0;
            elsif n=1 then
                fib:=fib1;  
            elsif n>=2 then
                --R3 Calculer la suite de Fibonacci
                for i in 2..n loop
                    fib:=fib1+fib0;
                    fib0:=fib1;
                    fib1:=fib;
                end loop;
            end if;
        --R1 Afficher le nième terme
        put("Le terme ");
        put(n);
        put(" de la suite de Fibonacci est ");
        put(fib);
end Fibonacci;