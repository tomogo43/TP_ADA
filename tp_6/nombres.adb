--******************************************************************
--              Manipulation de nombres positifs binaires
--******************************************************************

--******************************************************************
--                          description
--******************************************************************

--Chargement des bibliothèques
with text_io;
use text_io;

with ada.integer_text_io;
use ada.integer_text_io;

with ada.float_text_io;
use ada.float_text_io;

procedure nombres is
    --****Déclarations****

    --Question 1
    type caseBINAIRE is --définition du type binaire
        record
        indices:Integer;
        valeurs:Integer;
        end record;

    type BINAIRE is
        array(1..8) of caseBINAIRE;

    --Déclaration de deux nombres de type BINAIRE
    nb1:BINAIRE;
    nb2:BINAIRE;
    nb3:BINAIRE;
    sum1:BINAIRE;

    i:Integer;

    --Question 2

    --****procédures****

    --procedure qui affiche un nombre binaire
    procedure affichage_binaire(nb: BINAIRE) is
        --pre condition: nb de type binaire
        --post condition: Affiche un nombre binaire à l'écran

        begin --début de affichage_binaire

        put("affichage_binaire");

        new_line;
        
        i:=8;
        loop
            put(nb(i).valeurs);
            i:=i-1;
        exit when i=0;
        end loop;
        new_line;

    end affichage_binaire; --fin d'affichage binaire

    --****fonctions****
    function conversion10(valeur:BINAIRE) return Integer is
        --pre condition: reçoit un type BINAIRE
        --post condition: renvoit un entier
        nbConvert:Integer:=0;

        begin --début conversion10

        put("conversion10");

        i:=8;

        loop

        nbConvert:=nbConvert + valeur(i).valeurs*(2**valeur(i).indices);

        i:=i-1;

        exit when i=0;
        end loop;


        return nbConvert;

        --return base 10
    end conversion10; --fin conversion10

    function conversionBINAIRE(valeur:Integer) return BINAIRE is
        --pre condition: reçoit un type entier
        --post constion: retourne un type binaire
        valToConv:Integer:=valeur;
        nbConvert:BINAIRE;


        begin --début conversionBINAIRE

        put("conversionBINAIRE");

        for i in 1..8 loop
            nbConvert(i).indices := i-1;
        end loop;

        i:=8;

        loop

        if (2**nbConvert(i).indices) > valToConv then
            nbConvert(i).valeurs := 0;
        else
            nbConvert(i).valeurs := 1;
            valToConv:=valToConv-2**nbConvert(i).indices;
        end if;


        i:=i-1;

        exit when i=0;
        end loop;

        return nbConvert;

        --return BINAIRE
    end conversionBINAIRE; --fin conversionBINAIRE 

    function addition(nb1:BINAIRE; nb2:BINAIRE) return BINAIRE is
        --pre condition: Reçoit deux nombres de type BINAIRE < 128 pour pas de débordement
        --post condition: Retourne la somme de nb1 et de nb2 en type BINAIRE

        sum:BINAIRE; --récupère la somme des deux nombres binaires

        begin --début addition 
        --return somme de type BINAIRE

        put("addition");

        --initialisation des indices de sum
        for i in 1..8 loop
            sum(i).indices := i-1;
        end loop;

        for i in 1..8 loop
            if nb1(i).valeurs = 1 and nb2(i).valeurs = 1 then
                sum(i).valeurs := 0;
            else
                if nb1(i).valeurs = 0 and nb2(i).valeurs = 0 then
                    sum(i).valeurs := 0;
                else
                    sum(i).valeurs :=1;
                end if;
            end if;

        end loop;

        return sum;
    end addition; --fin addition


    begin --début du programme

    --Question 3
    for i in 1..8 loop
        nb1(i).indices:=i-1;
        nb2(i).indices:=i-1;
    end loop;

    --Initialisation de nb1 et nb2

    nb1(1).valeurs := 1; --2^0
    nb1(2).valeurs := 1; --2^1
    nb1(3).valeurs := 1; --2^2
    nb1(4).valeurs := 1; --2^3
    nb1(5).valeurs := 0; --2^4
    nb1(6).valeurs := 0; --2^5
    nb1(7).valeurs := 0; --2^6
    nb1(8).valeurs := 0; --2^7

    nb2(1).valeurs := 0; --2^0
    nb2(2).valeurs := 0; --2^1
    nb2(3).valeurs := 0; --2^2
    nb2(4).valeurs := 0; --2^3
    nb2(5).valeurs := 0; --2^4
    nb2(6).valeurs := 0; --2^5
    nb2(7).valeurs := 1; --2^6
    nb2(8).valeurs := 0; --2^7

    --Affichage d'un nombre binaire
    affichage_binaire(nb1);

    --conversion d'un nombre binaire en base 10
    put(conversion10(nb1));
    new_line;

    --conversion d'un nombre en base 10 en binaire
    new_line;
    nb3:=conversionBINAIRE(10);
    new_line;
    affichage_binaire(nb3);
    new_line;

    --addition de deux nombres binaires
    sum1:=addition(nb1,nb2);
    affichage_binaire(sum1);
    

end nombres; --fin du programme