--******************************************************************
--              Gestion d'un tableau avec bitmap
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

procedure bitmap is
    --****Déclarations****

    --Indices imin et imax pour optimiser l'accès aux données du tableau
    imin:Integer;
    imax:Integer;

    --variables d'incrémentations
    i:Integer;

    type caseTab is
        record
            indices:Integer;  --indice du tableau 
            sign:Boolean;     --boolean: true = si valeur significative
                              --         false = si valeurs non significatives donc case libre
            valeurs:Float;    --valeurs du tableau
        end record;

    CMAX:constant Integer:=50; --taille maximale du tableau

    type myTab is
        array(1..CMAX) of caseTab;
    
    T:myTab; --tableau de type myTab



    --****Procédures*****

    --procédure qui ajoute une valeur dans une case libre du tableau T

    --R0[AJouter une valeur dans une case libre du tableau entre imin et imax]
    --test: voir sujet
    
    --R1: Comment R0
    --  (1) vérifier si place libre entre imin et imax
    --  (2) trouver une place libre en dehors de imin et imax

    procedure ajout(valToAdd:Float;imin:Integer;imax:Integer) is
        --pre condition: 0<imin<imax
        --post condition: ajout de valToAdd dans une case libre du tableau T
        cond:Boolean;
        begin --début ajout

        --ici ajout d'une valeur dans T dans une case libre

        i:=imin;
        cond:=true;

        --R2: Comment R1-1
        loop
            if T(i).sign = false then
                cond := false;
                T(i).sign := true;
                T(i).valeurs := valToAdd;
                T(i).indices := i;

            end if;
            i:=i+1;
        exit when cond=false or i=(imax+1);

        end loop;
        --R2: Comment R1-2
        --  (1) si place libre avant imin (et imin > 1)
        --  (2) sinon cherche une place libre après imax
        if cond=true and i=(imax+1) then --aucune place libre trouvée entre imin et imax
            i:=0;

            --recherche avant imin si possible soit imin > 1
            
            --R3: Comment R2-1
            if imin > 1 then
                loop
                    if T(i).sign = false then
                        cond := false;
                        T(i).sign := true;
                        T(i).valeurs := valToAdd;
                        T(i).Indices := i;
                    end if;
                    i:=i+1;
                exit when cond=false and i=(imin+1);
                end loop;

                --recherche après imax
                
                --R3: Comment R2-2
                if cond=true and i=(imin+1) then
                    i:=(imax+1);
                    loop
                        if T(i).sign /= true then
                            cond := false;
                            T(i).sign := true;
                            T(i).valeurs := valToAdd;
                            T(i).Indices := i;
                        end if;
                        i:=i+1;
                    exit when cond=false;
                    end loop;
                end if; 

            else

            --recherche après imax

            --R3:Comment R2-1

                i:=(imax+1);
                loop
                    if T(i).sign /= true then
                        cond := false;
                        T(i).sign := true;
                        T(i).valeurs := valToAdd;
                        T(i).Indices := i;
                        
                    end if;
                    i:=i+1;
                exit when cond=false;
                end loop;
            end if;
        end if;

        put("ajout");

        

    end ajout; --fin ajout

    --procédure qui supprime la valeur à l'indice i

    --R0[Supprimer une valeur de T à l'indice i]

    --R1:Comment R0
    procedure suppValeur(indice:Integer) is
        --pre condition: i != 0
        --post condition: passe à false la case i du tableau 
        begin --début suppValeur
            T(indice).sign := false; --la valeur à l'indice i n'est plus significative
        put("suppValeur");
    end suppValeur; --fin de suppValeur

    --procédure qui affiche soit les booleens et les valeurs entre imin et imax (choix --> 1)
    --                      soit les valeurs significatives entre imin et imax et l'effectif (choix --> 2)
    procedure affichage(choix:Integer;imin:Integer;imax:Integer) is
        --pre condition : choix = 1 or choix = 2
        --                0<imin<imax
        --post condition : affiche le tableau en fonction des paramètres renseignés
        begin --début affichage

        --si choix = 1

        if choix = 1 then

            put("       indices");
            put("          tableau de booleens");
            put("          tableau de valeurs");

            for i in imin .. imax loop
                new_line;
                put(T(i).indices);
                if T(i).sign = true then
                    put("                   true                     ");
                else
                    put("                   false                    ");
                end if;
                put(T(i).valeurs);
            end loop;
        end if;

        if choix = 2 then
            new_line;
            put("       valeurs");
            for i in imin .. imax loop
                
                if T(i).sign = true then
                    new_line;
                    put(T(i).valeurs);
                end if;
            end loop;
        end if;

    end affichage; --fin affichage

    --procédure qui compacte le tableau
    --R0[supprimer les trous entre imin et imax] 
    
    --R1 Comment R0
    --  (1)parcourir le tableau et remplacer les valeurs non significatives par des valeurs significatives
    procedure compactage(imin:Integer;imax:Integer) is
        --pre condition 0<imin<imax:
        --post condition: bouche les trous entre imin et imax

        j:Integer:=0;

        tmp:caseTab; 
        cond:Boolean;
        max:Integer:=imax;


        
        begin

        --R2:Comment R1-1

        for i in imin .. max loop

            put("max");
            put(max);
            new_line;
            --(1) case libre détectée
            if T(i).sign = false then
                new_line;

                --R3:remplace le trou par une case remplie

                

                cond:=false;

                j:=i+1;

             

                loop
                put(T(j).valeurs);
                if T(j).sign = true then
                    put("change");
                    tmp.valeurs:= T(i).valeurs;
                    tmp.sign := T(i).sign;

                    T(i) := T(j);
                    T(j).valeurs := tmp.valeurs;
                    T(j).sign := tmp.sign;
                    new_line;
                    cond :=true;
                end if;
                j:=j+1;
                exit when j>max or cond=true;
                end loop;

            end if;

            T(i).indices:=i;
            affichage(1,1,5);
        end loop;


        
    end compactage;



    --****Fonctions*****

    --Fonction qui renvoit l'indice de la première occurence du tableau T

    --R0[renvoyer l'indice de la première occurence d'une valeur de T]
    --test: voir sujet

    --R1: Comment R0
    --  (1) parcourir le tableau jusqu'à cmax
    function recherche(valeur:Float) return Integer is
        --pre condition: Aucune
        --post condition: Renvoit indice 0 si aucune occurence ou l'indice du tableau
        indice:Integer:=0;
        begin --début de recherche

        --R2:Comment R1-1
        for i in 1..CMAX loop
            --R3:retourne l'indice si occurence
            if T(i).valeurs = valeur then
                indice := T(i).indices;
            end if; --si aucune occurence trouvée indice reste à 0
        end loop;

        put("recherche");
        return indice;
    end recherche; --fin de recherche


    begin --début du programme

    T(1).indices := 1;
    T(1).sign := false;
    ajout(1.0,1,1);

    ajout(2.0,1,2);

    ajout(3.0,1,3);

    ajout(4.0,1,4);

    ajout(5.0,1,5);

    

    put(recherche(3.0));

    suppValeur(1);
    suppValeur(2);
    suppValeur(3);
    new_line;

    --affichage(1,1,2);
    --affichage(2,1,4);
    affichage(1,1,5);

    compactage(2,5);
    new_line;
    --affichage(1,1,5);

end bitmap; --fin du programme