progenitor(clara,javier).
progenitor(tomas,javier).
progenitor(tomas,isabel).
progenitor(javier,ana).
progenitor(javier,patricia).
progenitor(patricia,jaime).

%jose de cambio por javier para ejemplo de clase

abuelo(X,Y):- progenitor(X,Z),progenitor(Z,Y).
tio(X,Y):- progenitor(Z,Y),progenitor(V,Z),progenitor(V,X).

hombre(javier).
hombre(tomas).
hombre(jaime).
mujer(clara).
mujer(isabel).
mujer(patricia).
mujer(ana).
dif(X,Y):-X\=Y.
es_madre(X):- mujer(X),progenitor(X,_).
es_padre(X):- hombre(X),progenitor(X,_).
es_hijo(X):- progenitor(_,X).
hermana_de(X,Y):- mujer(X),progenitor(Z,X),progenitor(Z,Y).
abuelo_de(X,Y):- abuelo(X,Y),hombre(X).
abuela_de(X,Y):- abuelo(X,Y),mujer(X).
hermanos(X,Y):-progenitor(A,X),progenitor(A,Y),dif(X,Y).
tia(X,Y):- progenitor(A,Y),hermanos(A,X),mujer(X).
predecesor(X,Y):-progenitor(X,Y).
predecesor(X,Y):-progenitor(X,Z), predecesor(Z,Y).
sucesor(X,Y):-progenitor(Y,X).
sucesor(X,Y):-progenitor(Y,Z),predecesor(Z,X).
