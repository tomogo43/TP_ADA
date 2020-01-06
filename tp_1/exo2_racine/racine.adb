--TP1 Programmation impérative:Premiers programmes en ADA
--2)Calcul de la racine carrée d'un nombre (Méthode de Newton)

--Spécification
--R0[Calculer la racine carrée d'un nombre réel]
--R1:Comment R0

--Chargement des bibliothèques
with text_io;
use text_io;

with ada.integer_text_io;
use ada.integer_text_io;

with ada.float_text_io;
use ada.float_text_io;

procedure racine is
    x:Float; --Reel dont la racine est à déterminer
    e:Float; --Précision du calcul
    a0:Float; --approximation ak
    ak:Float; --approkimation ak+1

    begin
    --R1-1 Saisir un entier naturel x>=0
    x:=-1.0;
    loop
        put("Saisir une valeur de x supérieure ou égale à 0");
        Get(x);
    exit when x>=0.0;
    end loop;
    put(x);
    --R1-2 Saisir la précision de calcul e
    e:=-1.0;
    loop
        put("Saisir une valeur pour la précision e");
        Get(e);
    exit when(e>0.0);
    end loop;
    put(e);
    --R1-3 Calculer la racine carrée de x à la kième approximation
        --R2 comment R1-3
        --Calculer la kième approximation grâce à la formule de Newton jusqu'à ce que |ak+&-ak|<e
            --R3 comment R2
            ak:=1.0;
            loop
                a0:=ak;
                ak:=0.5*(a0+(x/a0));
                put(a0);
            exit when ABS(ak-a0)<e;
            end loop;
    --R1-4 Afficher la racine carrée de x à la précision e
    put("La racine carrée de ");
    put(x);
    put(" à la précision ");
    put(e);
    put(" est ");
    put(ak);
end racine;
    
