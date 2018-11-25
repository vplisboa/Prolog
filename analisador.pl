compara(N,X) :- N == X, write('acertou').
compara(N,X) :- N < X, write('Muito Alto'), guess(N).
compara(N,X) :- N > X, write('Muito Baixo'), guess(N).
guess(N) :- write('Adivinha N: '), read(X), compara(N,X).

/*
frase(A,C) :- sujeito(A,B), predicado(B,C).
sujeito(A,C) :- artigo(A,B), substantivo(B,C).
predicado(A,D) :- verbo(A,B), artigo(B,C), substantivo(C,D).
artigo([o|A],A).
substantivo([gato|A],A).
substantivo([rato|A],A).
verbo([caçou|A],A). */

sentenca --> sujeito, predicado.

sujeito --> artigo, substantivo.

predicado --> verbo.
predicado --> verbo, objeto.

artigo --> [o] ; [a] ; [e] ; [i] ; [u].

substantivo --> [pera] ; [homem].

letraP --> [p].

verbo --> [come] ; [canta].

objeto --> artigo, substantivo.


replace(_,_,[],[]).
replace(O,R,[O|T],[R|T2]) :- replace(O,R,T,T2).
replace(O,R,[H|T],[H|T2]) :- H\=O, replace(O,R,T,T2).
