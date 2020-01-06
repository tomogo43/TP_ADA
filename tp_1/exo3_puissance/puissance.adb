--TP1 Programmation impérative:Premiers programmes en ADA
--2)puissance

--Spécification
--R0[Afficher la puissance entière d'un réel avec les entiers relatifs]
--R1:Comment R0

--Chargement des bibliothèques
with text_io;
use text_io;

with ada.integer_text_io;
use ada.integer_text_io;

with ada.float_text_io;
use ada.float_text_io;

procedure racine is
    x:Float; --Reel pour lequel il faut afficher la puissance entière
    a:Integer; --exposant
    xn:Float; --puissance entière de x
    i:Integer;

    begin
    --R1-1 Saisir un réel x
    put("Saisir une valeur de x ");
    Get(x);
    --R1-2 Saisir l'exposant
    put("Saisir une valeur de a ");
    Get(a);
    i:=1;
    --R1-3 déterminer la puissance entière de x
        --R2 comment R1-3
        xn:=1.0;
        if a=0 then
            xn:=2.0;
        elsif a=1 then
            xn:=x;
        elsif a>1 then
            --R3 exposant positif
            for i in 1..a loop
                xn:=xn*x;
            end loop;
        elsif a<0 then
            --R3 exposant négatif
            for i in a..-1 loop
                xn:=xn*(1.0/x);
            end loop;
        end if;
    --R1-4 afficher la puissance entière de x
    put("La puissance entiere de ");
    put(x);
    put(" à la puissance ");
    put(a);
    put(" est ");
    put(xn);
end racine;
    
