--******************************************************************
--               TP1:Programmation impérative
--						Nombres amis
--******************************************************************

--******************************************************************
--                          description
--Affiche les nombres amis N et M entre 1 et 2 tq 1<N<M<=MAX
--******************************************************************

--Spécification
--test voir sujet pour N=100000

--R0[Afficher tous les nombres amis deux à deux N et M entre 1 et MAX tq 1<N<M<=MAX]
--R1:Comment R0

--Chargement des bibliothèques
with text_io;
use text_io;

with ada.integer_text_io;
use ada.integer_text_io;

with ada.float_text_io;
use ada.float_text_io;

procedure NombresAmis is
    M:Integer:=0;
    MAX:Integer:=0;
    S:Integer:=0;
    S2:Integer:=0;
begin
    --R1-1 Saisir entier naturel MAX >2
    loop
        Put("Veuillez saisir MAX >2 ");
        Get(MAX);
        New_Line;
    exit when MAX>2;
    end loop;
    --R2 Déterminer les amis entre 2 et MAX 
    for N in 2..MAX loop
        --R3-1 Faire la somme des diviseurs de N exceptés N lui même
        S:=0;
        for i in 1..N-1 loop
            if N mod i = 0 then
                S:=S+i;
            end if;
        end loop;
        --R3-1 Vérifier si N a un ami strictement supérieur à lui et inférieur ou égal à MAX
        if S > N and S <= MAX  then
            S2:=0;
            for j in 1..S-1 loop
                if S mod j = 0 then
                    S2:=S2+j;
                end if;
                M:=j+1; --Car M boucle de 1 à S-1
            end loop;
            --R4 Vérifier si N et M sont amis
            if S = M and S2 = N then
                Put(N);
                Put(" et ");
                Put(M);
                Put(" sont amis entre 2 et ");
                Put(MAX);
                New_Line;
            end if;
        end if;
    end loop;  
end NombresAmis;
