--TP1 Programmation impérative:Premiers programmes en ADA
--4)Nombres Parfaits

--Spécification
--R0[Afficher tous les nombres parfaits entre 2 et N]
--R1:Comment R0

--Chargement des bibliothèques
with text_io;
use text_io;

with ada.integer_text_io;
use ada.integer_text_io;

with ada.float_text_io;
use ada.float_text_io;

procedure NombresParfaits is
    N:Integer:=0; --Initialisation de l'entier saisi par l'utilisateur out
    S:Integer; --Somme des diviseurs des entiers compris entre 2 et N
    
    begin
        --R1-1 Saisir entier naturel N>2
        loop
            put("Veuillez saisir un entier naturel N>2");
            Get(N);
        exit when N>2;
        end loop;
        --R1-2 Afficher tous les nombres parfaits entre 2 et N
            --R2 Comment R1-2
            for i in 2..N loop
                --R3-1 Faire la somme des diviseurs de i
                S:=0;
                for j in 1..i/2 loop
                    if i mod j =0 then
                        S:=S+j;
                    end if;
                end loop;
                --R3-2 Vérifier si i est parfait
                if i=S then
                    put(i);
                    put(" est parfait");
                end if;
            end loop;
end NombresParfaits;