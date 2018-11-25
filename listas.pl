%lista([] )<-.
%lista([X|Y] )<-lista(Y).

membro(X,[X|Z]).
membro(X,[Y|Z]) :- membro(X,Z).

prefixo([], _).
prefixo([X|Xs], [X|Ys]) :- prefixo(Xs,Ys).

sufixo(Xs,Xs).
sufixo(Xs, [Y|Ys]) :- sufixo(Xs,Ys).

sublista(Xs,Ys) :- prefixo(Ps,Ys), sufixo(Xs,Ps).

concat([], Ys, Ys).
concat([X,Xs],Ys,[X,Zs]) :- concat(Xs,Ys,Zs).

adjacente(X,Y,[X,Y|_]).
adjacente(X,Y,[_|T]) :- adjacente(X,Y,T).

duplicar([],[]).
duplicar([H|T],[H,H|Y]) :- duplicar(T,Y).

substituir(A,B,[],[]).
substituir(O,R,[O|T],[R|T2]) :- substituir(O,R,T,T2).
substituir(O,R,[H|T],[H|T2]) :- H\=O, substituir(O,R,T,T2).

merge([],[],Zs).
merge([],[Y|Ys],[Y|Zs]) :- merge([],Ys,Zs).
merge([X|Xs],[],[X|Zs]) :- merge(Xs,[],Zs).
merge([X|Xs],[Y|Ys],[X|Zs]) :- X<Y, merge(Xs,[Y|Ys],Zs).
merge([X|Xs],[Y|Ys],[Y|Zs]) :- X>Y, merge([X|Xs],Ys,Zs).
merge([X|Xs],[Y|Ys],[X,Y|Zs]) :- X=Y, merge(Xs,Ys,Zs).

remover([],[]).
remover([X],[X]).
remover([X,X|T],[X|T]) :- !.
remover([X|Xs],Res) :- remover(Xs,Res0), append([X],Res0,Res).

contem([],_).
contem( [X|Xs], [X|Ys]) :- contem(Xs,Ys).
contem( [X|Xs], [_|Ys]) :- contem([X|Xs],Ys).

dupli(Lista,Set) :- aux(Lista,[],Set).
aux([],Acumulator,Acumulator).
aux([H|T],Acumulador,Set) :- membro(H,Acumulador),aux(T,Acumulador,Set).
aux([H|T],Acumulador,Set) :- aux(T,[H|Acumulador],Set).


%bubble sort
ordena(Xs,Ys) :- permuta(Xs,Ys), ordenado(Ys).
permuta([],[]).
permuta(Xs,[Z|Zs]) :- seleciona(Z,Xs,Ys), permuta(Ys,Zs).
ordenado([X]).
ordenado([X,Y|Ys]) :- X=<Y, ordenado([Y|Ys]).
seleciona(X,[X|Xs],Xs).
seleciona(X,[Y|Ys],[Y|Zs]) :- seleciona(X,Ys,Zs).

%quicksort
quicksort([],[]).
quicksort([X|Xs],Ys) :- particao(Xs,X,Infs,Sups), quicksort(Infs,Is),quicksort(Sups,Ss),concat(Is,[X|Bs],Ys).
particao([],Y,[],[]).
particao([X|Xs],Y,[X|Is],Ss) :- X=<Y, particao(Xs,Y,Is,Ss).
particao([X|Xs],Y,Is,[X|Ss]) :- X>Y, particao(Xs,Y,Is,Ss).
