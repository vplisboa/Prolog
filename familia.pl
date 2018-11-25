 % male(P) is true when P is male
male(james1).
male(charles1).
male(charles2).
male(james2).
male(george1).

% female(P) is true when P is female
female(catherine).
female(elizabeth).
female(sophia).

% parent(C,P) is true when C has a parent called P
parent(charles1, james1).
parent(elizabeth, james1).
parent(charles2, charles1).
parent(catherine, charles1).
parent(james2, charles1).
parent(sophia, elizabeth).
parent(george1, sophia).

mother(M,P) :- parent(M,P) , female(M).
father(F,P) :- parent(F,P) , male(F).
sibling(X,Y) :- parent(P,X) , parent(P,Y).
family(X,Y,Z) :- parent(X,Z) , parent(Y,Z), male(X), female(Y).
