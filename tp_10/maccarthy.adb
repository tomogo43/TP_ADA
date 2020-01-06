--******************************************************************
--                  TP 10: Fonction de MacCarthy
--******************************************************************

--******************************************************************
--                          description
--n=99
--M(99)
--M(M(110)) car n<=100
--M(100) car n>100
--M(M(111)) car n<=100
--M(101) car n>100
--91 car n>100
--******************************************************************

--Déclaration des bibliothèques

with text_io;
use text_io;

with ada.integer_text_io;
use ada.integer_text_io;

with ada.float_text_io;
use ada.float_text_io;

procedure maccarthy is
    n:Integer;
    i:Integer;
    cond:Integer; 
    begin --debut du programme

    for i in 0 .. 110 loop --n varie de 0 à 110
        
        n:=i;

        if n>100 then
            n:=n-10;
        elsif n <= 100 then
            n:=n+11;
            cond:=2;
            loop
                if n>100 then
                    n:=n-10;
                    cond:=cond-1;
                elsif n<=100 then
                    n:=n+11;
                    cond:=cond+1;
                end if;
                exit when cond=0;
            end loop;
        end if;
        new_line;
        put(n);
        put(i);
    end loop;


end maccarthy; --fin du programme