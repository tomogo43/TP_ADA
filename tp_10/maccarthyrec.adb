--******************************************************************
--                  TP 10: Fonction de MacCarthy 
--******************************************************************

--******************************************************************
--                          description
--Fonction de MacCarthy recursive
--******************************************************************

--Déclaration des bibliothèques

with text_io;
use text_io;

with ada.integer_text_io;
use ada.integer_text_io;

with ada.float_text_io;
use ada.float_text_io;

procedure maccarthyrec is

    --****Déclarations****
    i:Integer;
    n:Integer;

    --****fonctions****
    function M(n:in out Integer) return integer is
        begin --debut de M
        if n > 100 then
            n:=n-10;
        elsif n <= 100 then
            n:=n+11;
            --double récursion
            n:=M(n);
            n:=M(n);
        end if;
        return n;
    end M; --fin de M

    begin --debut du programme

    for i in 1.. 110 loop
        new_line;
        n:=i;
        put(M(n));
        put(i);
    end loop;
end maccarthyrec; --fin du programme