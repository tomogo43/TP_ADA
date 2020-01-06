--******************************************************************
--                          Question 6
--******************************************************************

--******************************************************************
--                          description
--Compter le nombre d'occurence dans une chaîne de caractères
--******************************************************************


--Déclaration des bibliothèques

with text_io;
use text_io;

with ada.integer_text_io;
use ada.integer_text_io;

with ada.float_text_io;
use ada.float_text_io;

procedure occurence is
    cmax:constant Integer:=80; --taille maximum de la chaîne de caractères
    ch1:string(1..cmax);
    lch1:Integer;
    i:Integer;
    j:Integer;
    type caseTab is
    record
        lettre:Character;
        nbOccur:Integer:=0;
    end record;

    type defArray 
        is array(1..26) of caseTab;
    A:defArray;
    begin --début du programme

    j:=1;

    --initialisation du tableau

    --pour les lettres de a --> z
    for i in 97 .. 122 loop
        A(j).lettre:=CHARACTER'val(i);
        j:=j+1;
    end loop;

    

    get_line(ch1,lch1);

    --calcul le nombre d'occurence dans la chaine 
    for i in 1 .. lch1 loop
        case ch1(i) is
            when 'a' => A(1).nbOccur := A(1).nbOccur +1;
            when 'b' => A(2).nbOccur := A(2).nbOccur +1;
            when 'c' => A(3).nbOccur := A(3).nbOccur +1;
            when 'd' => A(4).nbOccur := A(4).nbOccur +1;
            when 'e' => A(5).nbOccur := A(5).nbOccur +1;
            when 'f' => A(6).nbOccur := A(6).nbOccur +1;
            when 'g' => A(7).nbOccur := A(7).nbOccur +1;
            when 'h' => A(8).nbOccur := A(8).nbOccur +1;
            when 'i' => A(9).nbOccur := A(9).nbOccur +1;
            when 'j' => A(10).nbOccur := A(10).nbOccur +1;
            when 'k' => A(11).nbOccur := A(11).nbOccur +1;
            when 'l' => A(12).nbOccur := A(12).nbOccur +1;
            when 'm' => A(13).nbOccur := A(13).nbOccur +1;
            when 'n' => A(14).nbOccur := A(14).nbOccur +1;
            when 'o' => A(15).nbOccur := A(15).nbOccur +1;
            when 'p' => A(16).nbOccur := A(16).nbOccur +1;
            when 'q' => A(17).nbOccur := A(17).nbOccur +1;
            when 'r' => A(18).nbOccur := A(18).nbOccur +1;
            when 's' => A(19).nbOccur := A(19).nbOccur +1;
            when 't' => A(20).nbOccur := A(20).nbOccur +1;
            when 'u' => A(21).nbOccur := A(21).nbOccur +1;
            when 'v' => A(22).nbOccur := A(22).nbOccur +1;
            when 'w' => A(23).nbOccur := A(23).nbOccur +1;
            when 'x' => A(24).nbOccur := A(24).nbOccur +1;
            when 'y' => A(25).nbOccur := A(25).nbOccur +1;
            when 'z' => A(26).nbOccur := A(26).nbOccur +1;
            when others => NULL; --ne fait strictement rien
        end case;
    end loop;

    --affichage du résultat
    for i in 1 .. 26 loop
        put(A(i).lettre);
        new_line;
        put(A(i).nbOccur);
        new_line;
    end loop;

end occurence; --fin du programme

