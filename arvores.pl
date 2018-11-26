tree1(t(6,t(4,t(2,nil,nil),t(5,nil,nil)),t(9,t(7,nill,nill),nill))).
tree2(t(8,t(5,nill,t(7,nill,nill)),t(9,nil,t(11,nill,nill)))).

inorder(t(K,L,R),List) :- inorder(L,LL), inorder(R,LR), append(LL,[K|LR],List).
inorder(nill,[]).

preorder(t(K,L,R),List) :- preorder(L,LL), preorder(R,LR), append([K|LL],LR,List).
preorder(nill,[]).

postorder(t(K,L,R),List) :- postorder(L,LL), postorder(R,LR), append(LL,LR,R1), append(R1,[K],List).
postorder(nill,[]).

procurar(Key,t(Key,_,_)) :- !.
procurar(Key,t(K,L,_)) :- Key < K , ! , procurar(Key,L).
procurar(Key,t(_,_,R)) :- procurar(Key,R).

istree(nill).
istree(t(_,R,L)) :- istree(R),istree(L).

concat([], Ys, Ys).
concat([X,Xs],Ys,[X,Zs]) :- concat(Xs,Ys,Zs).

%list_filhos_esq(t(a,t(b,t(c,nil,nil),nil),t(d,t(e,t(f,nil,nil),nil),t(g,nil,nil))),Ys).

list_esq_aux(nil, []).
list_esq_aux(t(Key, nil, nil), [Key]).
list_esq_aux(t(Key, L, R), List):- list_esq_aux(L, EsqList),list_filhos_esq(R, DirList),append([Key|EsqList], DirList, List).
list_filhos_esq(nil, []).
list_filhos_esq(t(Key, nil, nil), []).
list_filhos_esq(t(_, L, R), List):- list_esq_aux(L, EsqList),	list_filhos_esq(R, DirList),append(EsqList, DirList, List).
