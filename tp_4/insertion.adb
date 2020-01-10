--******************************************************************
--				TP4:Exercices sur les tableaux                  
--					Tri par insertion
--******************************************************************

--******************************************************************
--                      description
--Tri un tableau grâce au principe du tri par insertion
--******************************************************************

--R0[Trier un tableau par insertion]
--Test:
--  voir sujet

--Chargement des bibliothèques
with text_io;
use text_io;

with ada.integer_text_io;
use ada.integer_text_io;

with ada.float_text_io;
use ada.float_text_io;

procedure insertion is
    --****Declarations****

    --Variables
    i:Integer;
    j:Integer;
    k:Integer;
    tmp:Integer;

    --Constantes
    nmax:constant Integer :=6;



    --Tableaux
    type myTab is 
        array(1 .. nmax) of Integer;
    
    D:myTab;

    begin

    D:=(9,2,8,5,1,7); --tableau de longueur 6
    
    --R1:Comment R0
    
    --parcourir le tableau et effectuer le tri par insertion
    for i in 1 .. (nmax -1) loop
		--R2-1:A chaque étape insérer insérer l'élément suivant à sa place
		
		tmp := D(i);
		D(i) := D(i+1);
		D(i+1) := tmp;
		
		--R2-2:Effectuer le trie du tableau entre 1 et i
		if(i>1) then
			for k in 1..i loop
				for j in 1..(i-1) loop
					if D(j)> D(j+1) then
						tmp := D(j);
						D(j) := D(j+1);
						D(j+1) := tmp;
					end if;
				end loop;
			end loop;
		end if;
		
		
    end loop;
    
    --R2-3:Affichage du tableau trié
    for i in 1..nmax loop
		put(D(i));
		new_line;
	end loop;
	

end insertion;


