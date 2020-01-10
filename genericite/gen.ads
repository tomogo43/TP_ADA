package gen is
		
		
	--tableaux génériques
	generic
		type T_indice is (<>);
		type T_tableau is array(T_indice) of float;
	
	procedure generic_swapA(T:in out T_tableau;i,j:in T_indice); 
		
	--***************************procedures******************************
	
	--la déclaration du type générique doit être immédiatement suivie de la
	--spéc de la procédure ou de la fonction générique
	generic
		type T_entier is range <>; --pour traiter tous les entiers
		--type T_discret is (<>); --couvrir tous les types discrets
		--type T_flottant is digits <>; --couvrir tous les types discrets
		
		--le plus générique possible avec les comparaisons et affectation
		--type T_Generic is private
		
		--le plus générique possible sans comparaisons et affectation
		--type T_Generic is limited_private;
		
	procedure generic_swap(a,b:in out T_entier);
	
	
end gen;
