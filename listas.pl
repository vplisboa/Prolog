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
aux([H|T],Acumulador,Set) :- member(H,Acumulador),aux(T,Acumulador,Set).
aux([H|T],Acumulador,Set) :- aux(T,[H|Acumulador],Set).



