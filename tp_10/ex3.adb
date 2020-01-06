--******************************************************************
--                  TP 10: Itératif et récursif
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

procedure ex1 is

    --****Déclarations****
    i:Integer;
    j:Integer;
    m:Integer;
    n:Integer;

    --****Procédures****

    --procédure affiche de manière itérative
    procedure affiche(m: in integer; n: in integer) is 
        begin --debut affiche

        for i in 0 .. m loop
            --affiche une ligne de nombres
            for j in 0 .. n loop
                --affiche un nombre
                put(10*i+j);
            end loop;
            new_line;
        end loop;

    end affiche; --fin affiche

    --procedure affiche de façon récursive
    procedure afficherec(m: in integer;n: in integer;m2:in out Integer;n2: in out integer) is
        begin --debut afficherec
        if n2 <= n then
            put(10*m2+n2);
            n2:=n2+1;
            afficherec(m,n,m2,n2);
        elsif m2 <= m then
            m2:=m2+1;
            n2:=0;
            new_line;
            afficherec(m,n,m2,n2);
        end if;

    end afficherec; --fin afficherec

    

    begin --début du programme
    m:=0;
    n:=0;
    affiche(3,4);
    new_line;
    afficherec(3,4,m,n);
end ex1; --fin du programme