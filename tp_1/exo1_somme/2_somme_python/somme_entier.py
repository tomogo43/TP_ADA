#TP1 Programmation impérative:Premiers programmes en ADA
#1) Python et ADA

#Spécification
#R0[Afficher la somme des entiers compris entre deux entiers naturels]
#R1:Comment R0

#R1-1:Saisir deux entiers naturels m et n,tel que m<=n<=0
n=-1
while n<=0:
    n=input("Veuillez saisir une valeur de n superieur ou egale a 0")
m=0
while m<=n:
    m=input("Veuillez saisir une valeur de m superieur ou egale a n")
S=0
#R1-2:Faire la somme des entiers compris entre m et n
        #R2:Comment faire R1-2
        for i in range(n,m+1):
        S=S+i
#R1-3:Afficher la somme à l'utilisateur
print("La somme des entiers compris entre ",n," et ",m," est ",S)

#On peut également utiliser la concaténation pour afficher des string et des intiers il faut caster 
#print("La somme des entiers compris entre "+str(m)+...)



